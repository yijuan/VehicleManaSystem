package com.surelution.vms

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService;
import grails.util.Holders;
/**
 * 车辆使用
 * @author admin
 *
 */
class VehicleUseController {
	static CommonsMultipartFile  photo
	
	def flag
	
	def user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    def index() { }
	
	//借车页面
	def show(){
		def vehicleNO = params.vehicleNO
	    def vehicleList = Vehicle.createCriteria().list {
		    if(vehicleNO){
			   eq('vehicleNO',vehicleNO)
		    }
		   // eq('enabled',true)
	   }
	    [vehicleList:vehicleList]
	}
	
	
	//借车详细信息
	def showDrivingPermit(){
		
	}
	
	//还车页面
	def returnVehicle(){
		def carNO = params.carNO
		def dp = DrivingPermit.findByDpNO(carNO)
		/*def vehicleInUseList = VehicleInUse.findAllByDrivingPermit(dp)
		[vehicleInuseList:vehicleInUseList]*/
		def vehicleInUseList = VehicleInUse.createCriteria().list {
			if(dp){
			 eq('drivingPermit',dp)}
		}
		[vehicleInuseList:vehicleInUseList]
	}
	
	
	//显示还车详细信息
	def showDetails(){
	      
	}
	
	
	//借出车辆
	def lendVehicle(){
		def dpid = params.dpId
		def dp = DrivingPermit.get(dpid) 
		dp.borrowNum+=1
		dp.save(flush:true)
		
		def vehicleId = params.vehicleId
		def vehicle = Vehicle.get(vehicleId)
		vehicle.inuse  = true
		vehicle.save(flush:true)
		
		
		def borrowTime = params.date('borrowTime',"yyyy.MM.dd hh:mm")
		def expectReturnTime = params.date('expectReturnTime',"yyyy.MM.dd hh:mm")
		def reason = params.reason
		//def receiveMile = params.double('receiveMile')
		
		/*photo = request.getFile("receivePic")
		def image = new DynImage()
		if(photo && !photo.empty){
			savePic(image)
			}*/
		
		def vehicleInUse = new VehicleInUse()
		vehicleInUse.drivingPermit = dp
		vehicleInUse.vehicle = vehicle
		vehicleInUse.borrowTime = borrowTime
		vehicleInUse.expectReturnTime = expectReturnTime
		
		vehicleInUse.borrowRecordMan = user.username
		//vehicleInUse.receiveMile = receiveMile
		vehicleInUse.borrowReason = reason
		//vehicleInUse.receivePic = image
		vehicleInUse.save(flush:true)
		redirect(action:'show')
	}
	
	//车辆归还
	def sendVehicle(){
		def vehicleInUseId = params.vehicleInUseId
		def returnTime = params.date('returnTime','yyyy.MM.dd hh:mm')
		def returnMile = params.double('returnMile')
		def receiveMile = params.double('receiveMile')
		def isDelay = params.delay
		def delayReason = params.delayReason
		
		/*photo = request.getFile('returnPic')
		def image = new DynImage()
		if(photo && !photo.empty){
			savePic(image)
		}*/
		
		def vehicleInUse = VehicleInUse.get(vehicleInUseId) 
		
		def vehicle = vehicleInUse.vehicle
		vehicle.inuse = false
		vehicle.save(flush:true)
		
		//判断上一次还车的里程数和这一次的接车里程数是否一致
		
		
		vehicleInUse.returnMile = returnMile
		vehicleInUse.returnTime = returnTime
		vehicleInUse.receiveMile = receiveMile
		vehicleInUse.returnRecordMan = user.username
	//	vehicleInUse.returnPic = image
		vehicleInUse.isReturn = true
		
		if(isDelay.equals('1')){
			vehicleInUse.isDelay =true   //1表示true,已经延期
		}else{
		    vehicleInUse.isDelay =false
		}
		vehicleInUse.delayReason = delayReason
		
		vehicleInUse.save(flush:true)
		redirect(action:'returnVehicle')
	}
	
	//查询还车信息
	def showReturnVehicle(long id){
		def vehicleInUse = VehicleInUse.get(id)
		[vehicleInUse:vehicleInUse]
	}
	
   //查询借车信息
	def showlend(long id){
		def vehicle = Vehicle.get(id)
		def vehicleInUse = VehicleInUse.findByVehicleAndIsReturn(vehicle,false)
		[vehicleInUse:vehicleInUse] 
	}
	
	//检查驾驶员信息
	def checkDrivingPermit(){
		def drivingPermit = params.drivingPermit
		def dp = DrivingPermit.findByDpNO(drivingPermit)
		
		if(dp==null || dp.licensRevoked==true || dp.enabled==false){
			render false
		}else if(dp.delay==true && dp.delayTo<new Date()){
		    render false
		}else{
		   if(dp.enabled==true){
			   flag = "正常"
		   }
	       render dp.collect(){['id':dp.id,'name':dp.name,'dlicense':dp.dlicense,'dpNO':dp.dpNO,'enabled':flag]} as JSON
		}
	}
	//保存图片的方法
	def static savePic(DynImage image){
		def location = Holders.config.grails.dynImage.rootPath
		def uuid = UUID.randomUUID().toString()
		def picUrl = "${location}${uuid}"
		println picUrl
		
		if(photo && !photo.empty){
			def name = photo.getOriginalFilename()
			image.picUrl = picUrl
			image.originPicName = name
			image.save(flush:true)
			photo.transferTo(new File(picUrl))
		}
	}
	
	//显示接车里程数照片
	def showReceivePic(long id){
		def vehicleInUse = VehicleInUse.get(id)
		def pc = vehicleInUse.receivePic
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
	
	//显示交车里程数照片
	def showReturnPic(long id){
		def vehicleInUse = VehicleInUse.get(id)
		def pc = vehicleInUse.returnPic
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
}
