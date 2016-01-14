<%@page import="java.awt.Desktop.Action"%>
<%@page import="org.springframework.stereotype.Controller"%>
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
					车辆管理档案 <small></small>
				</h1>
				</section>
	<section class="content">
<g:if test="${flash.message}">
			<div class="message" role="status" style="color:red; font-weight:bold;">${flash.message}</div>
			</g:if>
		<div class="box box-info">
                <div class="box-header with-border">
                  <h4 class="box-title">车辆查询</h4>
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
	                                  <input type="text" name="price" value="${params.price }" class="form-control">
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
					
			<h3>车辆列表</h3>
			
			<table class="table table-bordered  table-striped">
			    <thead>
				  <tr>
				    <th><g:message code="label.vehicle.vOwner" default="vOwner"/></th>
                    <th><g:message code="label.vehicle.recordTime" default="recordTime"/></th>
                    <th><g:message code="label.vehicle.vehicleType" default="vehicleType"/></th>
                    <th><g:message code="label.vehicle.price" default="price"/></th>
                    <th><g:message code="label.vehicle.vehicleModel" default="vehicleModel"/></th>
                    <th><g:message code="label.vehicle.vehicleNO" default="vehicleNO"/></th>
                   <%-- <th><g:message code="label.vehicle.vehiclePtot" default="vehiclePhoto"/></th>--%>
                    <th><g:message code="label.vehicle.manufacturer" default="manufacturer"/></th>
                    <th><g:message code="label.vehicle.buyMan" default="buyMan"/></th>
                    <th><g:message code="label.vehicle.title" default="title"/></th>
                    <th><g:message code="label.vehicle.gotDate" default="gotDate"/></th>
                    <th><g:message code="label.vehicle.rentTo" default="rentTo"/></th>
                    <th><g:message code="label.vehicle.rentMan" default="rentMan"/></th>
                  </tr>
                 </thead>
               <tbody>
                
                 <g:each in="${vehicleResult }" var="vehicle">
                   <tr>
                      <td><g:link action="showVehicleSource" id="${vehicle?.id}">${vehicle.vOwner}</g:link></td>
                      <td><g:formatDate date="${vehicle.recordTime}" format="yyyy-MM-dd"/></td>
                     
                      <td>${vehicle.vehicleType}</td>
                      <td>${vehicle.price}</td>
                      <td>${vehicle.vehicleModel}</td>
                      <td>${vehicle.vehicleNO}</td>
                      <g:if test="${vehicle.vsource.title=='购买' }">
                      <td>${vehicle.vsource.manufacturer}</td>
                      <td>${vehicle.vsource.buyMan}</td>
                      <td>${vehicle.vsource.title }</td>
                      <td><g:formatDate date="${vehicle.vsource.gotDate }" format="yyyy-MM-dd"/></td>
                      </g:if>
                      
                      <g:elseif test="${vehicle.vsource.title=='租赁' }">
                      <td>${vehicle.vsource.manufacturer}</td>
                      <td>${vehicle.vsource.rentMan}</td>
                      <td>${vehicle.vsource.title }</td>
                      <td><g:formatDate date="${vehicle.vsource.gotDate }" format="yyyy-MM-dd"/></td>
                      <td><g:formatDate date="${vehicle.vsource.rentTo }" format="yyyy-MM-dd"/></td>
                      </g:elseif>
                   </tr>
                   </g:each>
                 
               </tbody>
			</table>
				</section>
		</div>
</body>
</html>