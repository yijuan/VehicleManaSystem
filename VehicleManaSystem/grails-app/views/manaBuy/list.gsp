<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="layout" content="jarvis"/>
<title>购入车辆管理档案</title>

<style type="text/css">
.tab{ width: 70%; text-align: center;}
</style>
</head>
<body>
     <div class="content-wrapper">
         <section class="content-header">
				<h1>
					购入车辆管理档案 <small></small>
				</h1>
				</section>
	<section class="content">
	           <div class="c1" style=" height: 30px; border-bottom: 1px solid #e5e5e5;margin-bottom:10px;">
            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
			<g:link action="showVehicle" data-toggle="modal" data-target="#myModal"><g:message code="default.new.label" args="[entityName]" /></g:link>
			<!-- 新增台账的dialog -->	
			 <div class="modal fade" id="myModal" role="dialog">
                     <div class="modal-dialog">
                           <!-- Modal content-->
                           <div class="modal-content"> 
                           </div>
                          </div>
                      </div>		
          </div>
<g:if test="${flash.message}">
			<div class="message" role="status" style="color:red; font-weight:bold;">${flash.message}</div>
			</g:if>
		<div class="box box-info">
                <div class="box-header with-border">
                  <h4 class="box-title">购入车辆查询</h4>
                </div>
                <div class="box-body">
		             <g:form action="list" >
					     <fieldset class="form">
						    <div class="fieldcontain  ">
						     <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.price" default="price" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                  <input type="text" name="price" class="form-control">
	                               </div>
	                            </dd>
	                        </dl>
	                        <dl class="dl-horizontal" style="margin-left:-80px;">
	                            <dt><label for="branch">
								        <g:message code="label.vehicle.vehicleType" default="vehicleType" />
							         </label>
							    </dt>
	                            <dd>
	                               <div class="col-xs-3">
	                                  <input type="text" name="vehicleType" class="form-control">
	                               </div>
	                            </dd>
	                        </dl>
						   </div>
						<div class="row">
                           <div class="col-md-8">
                               <div class="fieldcontain">
				                  <dl class="dl-horizontal" style="margin-left:-80px;">
	                                 <dt><label for="salingAt">
								        <g:message code="customerStock.cdate.label" default="Date" />
							            </label>
							         </dt>
	                                 <dd>
	                               <div class="col-xs-5">
	                              <g:textField name="dateBegin" value="${params.dateBegin}" id="datetimepicker" class="form-control"/>
						<script type="text/javascript">
                $('#datetimepicker').datetimepicker({
                	isRTL: false,
                    format: 'yyyy.mm.dd',
                    autoclose:true,
                    minView: 'month',
                    language: 'zh-CN'
					});
        </script>
						</div>
						<div class="col-xs-1">~</div>
						<div class="col-xs-5">
						<g:textField name="dateEnd" value="${params.dateEnd}" id="datetimepicker1" class="form-control"/>
						<script type="text/javascript">
                $('#datetimepicker1').datetimepicker({
                	isRTL: false,
                    format: 'yyyy.mm.dd',
                    autoclose:true,
                    minView: 'month',
                    language: 'zh-CN'
					});
        </script>
						
						</div>
	                              
	                            </dd>
	                        </dl>						
					</div>
				    </div>
				   </div>
					</fieldset>
					
					 <fieldset class="buttons">
						<g:submitButton name="search" class="search btn btn-primary" value="${message(code: 'default.button.search.label', default: 'Search')}" />
					</fieldset>
					</g:form>
					</div>
					</div>
					
			<h3>购入车辆列表</h3>
			
			<table class="table table-bordered  table-striped">
			    <thead>
				  <tr>
                    <th><g:message code="label.vehicle.recordTime" default="recordTime"/></th>
                    <th><g:message code="label.vehicle.vOwner" default="vOwner"/></th>
                    <th><g:message code="label.vehicle.status" default="status"/></th>
                    <th><g:message code="label.vehicle.vehicleType" default="vehicleType"/></th>
                    <th><g:message code="label.vehicle.price" default="price"/></th>
                    <th><g:message code="label.vehicle.vehicleModel" default="vehicleModel"/></th>
                    <th><g:message code="label.vehicle.vehicleNO" default="vehicleNO"/></th>
                    <th><g:message code="label.vehicle.manufacturer" default="manufacturer"/></th>
                    <th><g:message code="label.vehicle.buyMan" default="buyMan"/></th>
                   </tr>
                 </thead>
               <tbody>
                   <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                   </tr>
               </tbody>
			</table>
				</section>
			
		</div>
</body>
</html>