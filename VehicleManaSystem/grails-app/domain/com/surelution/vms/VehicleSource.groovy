package com.surelution.vms

/**
 * 车辆来源
 * @author admin
 *
 */
class VehicleSource {

    static constraints = {
    }
	
	String title     //来源名称
	Date   gotDate        //购入或者租入日期
	String vehicleType //车型
	Double price //价格
	
	Date dateCreated
}
