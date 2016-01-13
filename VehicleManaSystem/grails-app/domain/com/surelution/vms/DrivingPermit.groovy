package com.surelution.vms


/**
 * 准驾证类
 * @author admin
 *
 */
class DrivingPermit {
	
    static constraints = {
    }
	
	String dpNO         //准驾证编号
	Date trainingDate   //培训日期
	Double  score          //考核成绩
	boolean delay       //是否延期
	boolean licensRevoked  //是否吊销
	Date delayTo       //延期时长
	Date revokeDate    //吊销日期
	
}
