package com.surelution.vms

import grails.util.Holders;

import java.awt.geom.Arc2D.Double;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


/**
 * 购入车辆管理
 * @author admin
 *
 */
class ManaBuyController {
	
	static CommonsMultipartFile  photo

    def index() { }
	
	
	def showVehicle(){}

	//购入车辆显示列表
	def list(){
	   def price = params.double('price')
	   def vehicleType = params.vehicleType
	   def dateBegin = params.date('dateBegin','yyyy.MM.dd')
	   
	   def dateEnd = params.date('dateEnd','yyyy.MM.dd')
	   def vehicleResult = Vehicle.createCriteria().list {
		   if(price){
			   eq('price',price)
		   }
		   if(vehicleType){
			   eq('vehicleType',vehicleType)
		   }
		   if(dateBegin){
			   ge('recordTime',dateBegin)
		   }
		   if(dateEnd){
			   le('recordTime',dateEnd)
		   }
		   
	   }
	   
	   println vehicleResult
	   [vehicleResult:vehicleResult]
	}
	
	//添加购入车辆
	def saveVehicle(){
		//def title = params.title
		def recordTime = params.date('recordTime','yyyy.MM.dd')
		def vOwner = params.vOwner
		def vehicleType = params.vehicleType
		def price = params.double('price')
		def vehicleModel = params.vehicleModel
		def vehicleNO = params.vehicleNO
		def gotDate = params.date('gotDate','yyyy.MM.dd')
		def manufacturer = params.manufacturer
		def buyMan = params.buyMan
		def status = params.status
		
		def image = new DynImage()
		photo =  request.getFile("billPhoto")
		if(photo && !photo.empty){
		savePic(image)
		}
		def vehicleSource = new BuyVehicle()
		vehicleSource.gotDate = gotDate
		vehicleSource.manufacturer = manufacturer
		vehicleSource.buyMan = buyMan
		vehicleSource.title = "购买"
		vehicleSource.billPhoto = image
		
		println vehicleSource.errors
		vehicleSource.save(flush:true)
		
		def image1 = new DynImage()
		photo =  request.getFile("vehiclePhoto")
		if(photo && !photo.empty){
		savePic(image1)
		}
		def vehicle = new Vehicle()
		vehicle.recordTime = recordTime
		vehicle.vOwner = vOwner
		vehicle.vehicleType = vehicleType
		vehicle.price = price
		vehicle.vehicleModel = vehicleModel
		vehicle.vehicleNO = vehicleNO
		vehicle.status = status
		vehicle.vsource = vehicleSource
		
		vehicle.vehiclePhoto = image1
		vehicle.save(flush:true)
		redirect(action:'list')
	}
	
	//编辑购入车辆
	def editVehicle(){}
	
	//更新购入车辆
	def updateVehicle(){}
	
	//删除购入车辆
	def deleteVehicle(long id){
		/*def vehicle = Vehicle.get(id)
		def vsource = vehicle.vsource*/
		
	}
	
	def showVehicleSource(long id){
		def vehicleSource = Vehicle.get(id)
		[vehicleSource:vehicleSource]
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
	
	//显示公车图片的方法
	def showPic(long id){
		def vehicle = Vehicle.get(id)
		def pc = vehicle.vehiclePhoto
		
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
	
	//显示购车发票图片
	def showBillPhoto(long id){
		def vehicleSource = VehicleSource.get(id)
		def pc = vehicleSource.billPhoto
		
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
	
}
