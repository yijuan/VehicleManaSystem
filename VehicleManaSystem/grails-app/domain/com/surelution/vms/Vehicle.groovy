package com.surelution.vms

/**
 * 车辆信息
 * @author admin
 *
 */
class Vehicle {

    static constraints = {
		vehiclePhoto nullable:true
		insureEndDate nullable:true
		recordTime nullable:true
    }
	
	Date recordTime  //车辆记录在册时间
	String vOwner    //车辆产权归属
	/*VehicleStatus status  //车辆状态
*/	VehicleSource vsource //车辆来源
	String vehicleType //车型
	Double price //价格
	String  vehicleModel //发动机型
	String  vehicleNO   //车牌号
	
	DynImage vehiclePhoto  //车辆照片
	
	boolean inuse //是否在用，借出和归还状态
	boolean enabled   //是否有使用权
	
	PrerepairStatus statu
	
	enum PrerepairStatus{
		NORMAL,     //正常
		PREINUSE,    //报修可以使用
		PRENOTINUSE  //报修不可以使用
	}
	
	Date insureEndDate  //保险到期日
	
	/*enum VehicleStatus {
		NORMAL,MAINTENACE,PREREPAIR,REPAIR,TRANSFER,SCRAPPED,STOPRENT
	}*/
	
}
