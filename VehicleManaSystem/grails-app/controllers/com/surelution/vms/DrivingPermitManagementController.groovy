package com.surelution.vms

class DrivingPermitManagementController {

    def index() { }
	
	//TODO 徐光宗代码审核意见: 此处方法应该以小写字母开头，建议改为 driviLicense
	def DriviLicense(Integer max){
		def dp;
		def dpNO = params.dpNO
		if(dpNO == null){
			dp = DrivingPermit.list();
		}
		else{
			dp = DrivingPermit.findByDpNO(dpNO);
			if(dp == null){
				flash.message = "无此准驾证，请核对后查询!";
			}
			//TODO 徐光宗代码审核意见 else代码块没有必要，建议删除
			else{
				flash.message = "";
			}
		}
		[dp:dp]
	}
	
	def checkin(){
		//准驾证核发
	}
	
	def saveDrivingPermit(){
		
		def dpNO = params.dp
		def trainingDate = params.date('trainingDate','yyyy.MM.dd')
		def issueDate = params.date('issueDate','yyyy.MM.dd')
		/*def validityDate = params.date('validityDate','yyyy.MM.dd')*/
		def score = params.int('score')
		def name = params.name
		def descitption = params.description
		def sex = params.sex
		def dlicense = params.dlicense
		def age = params.int('age')
		
		def d = new DrivingPermit()
		d.dpNO = dpNO 
		d.trainingDate = trainingDate
		/*d.validityDate = validityDate*/
		d.issueDate = issueDate
		d.score = score
		d.delay = false
		d.licensRevoked = false
		d.name = name
		d.description = descitption
		d.sex = sex
		d.age = age
		d.dlicense = dlicense
		d.borrowNum = 0
		d.dlligle = " "
		d.enabled = true;
		
		
		d.save(flush: true)
		redirect(action:'DriviLicense')
	}
	
	def postpone(){
		//延期
		def dpNO = params.dpNO
		def dp = DrivingPermit.createCriteria().list {
			if(dpNO){
				eq('dpNO',dpNO)
			}
		}
		 
		[dp:dp]
	}
	
	
	def updatimepostpone(){
		//延期的modal框跳转
	}
	
	def updatepostpone(){
		//延期更新
		def delayto = params.date('delayTo','yyyy.MM.dd');
		def delaytoid = params.delayToid;
		println delayto
		def dp = DrivingPermit.get(delaytoid);
		dp.delayTo = delayto;
		dp.delay = true;
		redirect(action:'postpone');
	}
	
	def revoke(){
		//吊销
		def dpNO = params.dpNO
		 def dp = DrivingPermit.createCriteria().list {
			 if(dpNO){
				 eq('dpNO',dpNO)
			 }
		 }
		
		[dp:dp]
	}
	
	def updatimerevoke(){
		//吊销的modal框跳转
	}
	
	def updaterevoke(){
		//吊销时间更新更新
		def revokeid = params.revokeId;
		def revoketime = new Date();
		println revoketime;
		
		def drivingPermit = DrivingPermit.get(revokeid);
		drivingPermit.revokeDate = revoketime;
		drivingPermit.licensRevoked = true;
		redirect(action:'revoke');
	}
	
	
	
	
	
	
}
