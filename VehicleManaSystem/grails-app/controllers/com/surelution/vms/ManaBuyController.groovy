package com.surelution.vms

import java.awt.geom.Arc2D.Double;


/**
 * 购入车辆管理
 * @author admin
 *
 */
class ManaBuyController {

    def index() { }
	
	//添加购入车辆
	def showVehicle(){}
	
	
	//购入车辆显示列表
	def list(){
		
	}
	
	def saveVehicle(){
		def title = params.title
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
		
		def vehicleSource = new BuyVehicle()
		vehicleSource.gotDate = gotDate
		vehicleSource.manufacturer = manufacturer
		vehicleSource.buyMan = buyMan
		vehicleSource.title = title
		vehicleSource.save(flush:true)
		
		def vehicle = new Vehicle()
		vehicle.recordTime = recordTime
		vehicle.vOwner = vOwner
		vehicle.vehicleType = vehicleType
		vehicle.price = price
		vehicle.vehicleModel = vehicleModel
		vehicle.vehicleNO = vehicleNO
		vehicle.status = status
		vehicle.vsource = vehicleSource
		
		vehicle.save(flush:true)
		redirect(action:'list')
		
	}
	
}
