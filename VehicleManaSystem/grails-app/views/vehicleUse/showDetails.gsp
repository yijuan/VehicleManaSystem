<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>车辆归还情况</title>
<script src="http://cdn.staticfile.org/jquery/2.1.1-rc2/jquery.min.js"></script>
<script type="text/javascript">
     function show(){
        var returnTime = $(".rl").val();
        var excepctReturnTime = $("#vehicleInUse").val();
        var borrowTime = $("#borrowTime").val();
        var return1 = new Date(returnTime.replace("-", "/").replace("-", "/"));
        var excepctReturn = new Date(excepctReturnTime.replace("-", "/").replace("-", "/"));
        var borrow = new Date(borrowTime.replace("-", "/").replace("-", "/"));
        if(return1>excepctReturn){
             $("#isDelay").css("display","block");
             $("#delay").attr("checked",true);
            }
        if(return1<borrow){
                $("#messages").html("实际还车时间不能小于借车时间")
        	    $("#sub").prop('disabled', true);
            }else{
            	$("#messages").html("")
            	$("#sub").prop('disabled', false);
                }
         }

     function check(){
          var receiveMile = $("#receiveMile").val();
          var returnMile = $("#returnMile").val();
          if(receiveMile>returnMile){
               $("#mess").html("交车里程数必须大于接车里程数");
               $("#sub").prop('disabled', true);
              }else{
            	  $("#mess").html("");
                  $("#sub").prop('disabled', false);
                  }
         }
</script>
</head>
<body>
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">请填写车辆归还情况</h4>
        </div>
        <g:uploadForm action="sendVehicle" method="post">
        
        <input type="hidden" value="${params.borrowTime}" id="borrowTime"/>
		<div class="modal-body">
		  <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.returnTime" default="实际归还时间" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
							   <g:textField name="returnTime" value="${new Date().format('yyyy.MM.dd HH:mm')}"
									id="datetimepicker" class="form-control rl" onchange="show()"/>
								<script type="text/javascript">
									$('#datetimepicker').datetimepicker({
										isRTL : false,
										format : 'yyyy.mm.dd hh:ii',
										autoclose : true,
										minView : 'hour',
										language : 'zh-CN'
									});
								</script>
							</div>
							<span id ="messages" style="color: red;"></span>
						</dd>
					</dl>
		    <div>
		   </div>
		   <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.receiveMile" default="接车里程数" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" class="form-control" name="receiveMile" id="receiveMile" required=""/>
							</div>
						</dd>
					</dl>
		 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.returnMile" default="交车里程数"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="returnMile" class="form-control" id="returnMile" onchange="check()" required=""/>
							    <span id="mess" style="color:red;"></span>
							</div>
						</dd>
					</dl><%--
		 
		 <dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.returnPic" default="交车里程数照片"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="file" name="returnPic" class="form-control"/>
							</div>
						</dd>
					</dl>
					
					--%><div id="isDelay" style="display: none;">
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"><g:message
									code="label.vehicle.isDelay" default="是否延期" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="checkbox" name="delay" value="1" id="delay"/>
							</div>
						</dd>
					</dl>
					
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"><g:message
									code="label.vehicle.delayReason" default="延期理由" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<textarea class="form-control" name="delayReason"></textarea>
							</div>
						</dd>
					</dl>
					</div>
					<input type="hidden" name="vehicleInUseId" value="${params.id}"/>
		            <input type="hidden" name="vehicleInUse" id="vehicleInUse" value="${params.excepectReturnTime}"/>
		 </div>	
		 <div class="modal-footer">		
				<fieldset class="buttons">
					<input type="submit" id="sub" value="确认还车" onclick="return confirm('确认还车吗？')" class="btn btn-primary"/>
					<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
				</fieldset>
		</div>
		</g:uploadForm>
</body>
</html>