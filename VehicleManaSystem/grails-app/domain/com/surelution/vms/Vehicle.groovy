package com.surelution.vms

/**
 * 车辆信息
 * @author admin
 *
 */
class Vehicle {

    static constraints = {
		vehiclePhoto nullable:true
    }
	
	Date recordTime  //车辆记录在册时间
	String vOwner    //车辆产权归属
	VehicleStatus status  //车辆状态
	VehicleSource vsource //车辆来源
	String vehicleType //车型
	Double price //价格
	String  vehicleModel //发动机型
	String  vehicleNO   //车牌号
	//String  vehiclePhoto 
	
	DynImage vehiclePhoto  //车辆照片
	
	enum VehicleStatus {
		NORMAL,MAINTENACE,PREREPAIR,REPAIR,TRANSFER,SCRAPPED,STOPRENT
	}
	
}
