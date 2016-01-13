package com.surelution.vms

class Vdriver {
	
	//驾驶员类

    static constraints = {
    }
	
	String name  //驾驶员姓名
	String description   //描述
	int age    //年龄
	String sex   //性别
	
	String dlicense  //驾驶证
	int  borrowNum   //借车次数
	String dlligle   //违章情况
	
	DrivingPermit permit   //准驾证
}
