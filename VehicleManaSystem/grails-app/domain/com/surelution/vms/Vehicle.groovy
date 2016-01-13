package com.surelution.vms

/**
 * 车辆信息
 * @author admin
 *
 */
class Vehicle {

    static constraints = {
    }
	
	Date recordTime  //车辆记录在册时间
	String vOwner    //车辆产权归属
	VehicleStatus status  //车辆状态
	VehicleSource vsource //车辆来源
	
	enum VehicleStatus {
		NORMAL,MAINTENACE,PREREPAIR,REPAIR,TRANSFER,SCRAPPED,STOPRENT
		
	}
	
}
