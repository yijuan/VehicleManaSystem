package com.surelution.vms

/**
 * 行车违章
 * @author admin
 *
 */
class VehicleIllgle {

    static constraints = {
    }
	
	Date illgleTime  //违章时间
	VehicleInUse vehicleInUse //车辆出借记录
	Date dealTime //违章处理时间
	String dealResult //违章处理结果
	String dealMan   //处理人
}
