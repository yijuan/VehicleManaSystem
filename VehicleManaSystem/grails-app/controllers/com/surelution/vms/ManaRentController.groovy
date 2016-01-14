package com.surelution.vms

import grails.util.Holders;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


/**
 * 租赁车辆管理
 * @author admin
 *
 */
class ManaRentController {

	static CommonsMultipartFile  photo
	
    def index() { }
	
	def showVehicle(){}
	
	//添加租赁车辆
	def saveVehicle(){
		def recordTime = params.date('recordTime','yyyy.MM.dd')
		def vOwner = params.vOwner
		def vehicleType = params.vehicleType
		def price = params.double('price')
		def vehicleModel = params.vehicleModel
		def vehicleNO = params.vehicleNO
		def gotDate = params.date('gotDate','yyyy.MM.dd')
		def rentTo = params.date('rentTo','yyyy.MM.dd')
		def manufacturer = params.manufacturer
		def rentMan = params.rentMan
		def status = params.status
		
		def image = new DynImage()
		photo =  request.getFile("rentPhoto")
		if(photo && !photo.empty){
		savePic(image)
		}
		def vehicleSource = new RentVehicle()
		vehicleSource.gotDate = gotDate
		vehicleSource.rentTo = rentTo
		vehicleSource.manufacturer = manufacturer
		vehicleSource.rentMan = rentMan
		vehicleSource.title = "租赁"
		vehicleSource.rentPhoto = image
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
		//redirect(action:'list',controller:'manaBuy')
	}
	
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
	
	//显示租赁凭证图片
	def showBillPhoto(long id){
		def vehicleSource = VehicleSource.get(id)
		def pc = vehicleSource.rentPhoto
		
		def picUrl = pc.picUrl
		File file = new File(picUrl)
		def os = response.outputStream
		os << file.bytes
		os.flush()
		return
	}
}
