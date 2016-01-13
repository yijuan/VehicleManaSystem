package com.surelution.vms

class VehicleTransfer {

    static constraints = {
    }
	
	Vehicle vehicle 
	Date transferDate  //转让时间
	String transferMan  //转让人
	double money   //转让金额
    int   contractNO  //转让合同编号
	
	Date dateCreated
}
