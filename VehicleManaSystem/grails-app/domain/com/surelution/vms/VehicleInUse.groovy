package com.surelution.vms


/**
 * 车辆出借，归还
 * @author admin
 *
 */
class VehicleInUse {

    static constraints = {
    }
	
	Vdriver driver   //驾驶员
	Vehicle vehicle  //车辆信息
	Date borrowTime  //借出时间
	String borrowRecordMan // 借出记录人
	boolean  status   //是否归还
	Date returnTime  //归还时间
	String returnRecordMan  //归还记录人
	
	double receiveMile   //接车里程数
	double returnMile    //交车里程数
	
	DynImage  receivePic //接车里程数照片
	DynImage  returnPic  //交车里程数照片
	
	
}
