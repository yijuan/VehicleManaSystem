<%@page import="com.surelution.vms.Vehicle"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="layout" content="jarvis" />
<title>购入车辆记录</title>

<script type="text/javascript">
    
</script>
</head>
<body>
	<div class="body">
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					购入车辆信息录入 <small></small>
				</h1>
			</section>
			<section class="content">
				<g:uploadForm action="saveVehicle">

					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.recordTime" default="recordTime"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:textField name="recordTime" value="${params.recordTime}"
									id="datetimepicker" class="form-control" />
								<script type="text/javascript">
									$('#datetimepicker').datetimepicker({
										isRTL : false,
										format : 'yyyy.mm.dd',
										autoclose : true,
										minView : 'month',
										language : 'zh-CN'
									});
								</script>
							</div>
						</dd>
					</dl>

					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vOwner" default="vOwner" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vOwner" class="form-control" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.status" default="status" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:select name="status" from="${Vehicle.VehicleStatus.values()}"
									class="form-control" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehiclePhoto" default="vehiclePhoto"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="file" class="form-control" name="vehiclePhoto" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehicleType" default="vehicleType" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleType" class="form-control" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.price" default="price" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="price" class="form-control" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehicleModel" default="vehicleModel" /> <span
								class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleModel" class="form-control" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.vehicleNO" default="vehicleNO"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="vehicleNO" class="form-control" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.gotDate" default="gotDate"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<g:textField name="gotDate" value="${params.dateBegin}"
									id="datetimepicker1" class="form-control" />
								<script type="text/javascript">
									$('#datetimepicker1').datetimepicker({
										isRTL : false,
										format : 'yyyy.mm.dd',
										autoclose : true,
										minView : 'month',
										language : 'zh-CN'
									});
								</script>
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.billPhoto" default="billPhoto"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="file" class="form-control" name="billPhoto" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.manufacturer" default="manufacturer"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="manufacturer" class="form-control" />
							</div>
						</dd>
					</dl>
					<dl class="dl-horizontal">
						<dt>
							<label for="branch"> <g:message
									code="label.vehicle.buyMan" default="buyMan"
									class="form-control" /> <span class="required-indicator">*</span>
							</label>
						</dt>
						<dd>
							<div class="col-xs-8">
								<input type="text" name="buyMan" class="form-control" />
							</div>
						</dd>
					</dl>

					<fieldset class="buttons">
						<g:submitButton name="create" class="save btn btn-primary"
							value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>

				</g:uploadForm>
			</section>
		</div>
	</div>
</body>
</html>