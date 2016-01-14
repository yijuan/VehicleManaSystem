
<%@ page import="com.surelution.vms.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script src="${resource(dir:'js',file:'bootstrap.js') }"></script>
		<style>
			table{margin-left:0px; border:1px solid #000; margin-top:5px;}
			td{width:200px;}
			th{color:#000;}
			li{list-style:none;}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
		<div style="height:50px;"></div>
		<div id="list-user" class="content scaffold-list" role="main">
			<span><g:link class="create" action="create" style="color:#000; font-weight:bold;" >新建用户<%--<g:message code="default.new.label" args="[entityName]" />--%></g:link></span>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class = "table-bordered">
				<thead>
					<tr style=" background-color:#FFF;">
						<th><g:message code="user.username.label" default="Username"/></th>
        				<th><g:message code="user.accountExpired.label" default="Account Expired"/></th>
        				<th><g:message code="user.accountLocked.label" default="Account Locked"/></th>
        				<th><g:message code="user.enabled.label" default="Enabled"/></th>
        				<th><g:message code="user.passwordExpired.label" default="Password Expired"/></th>
        				<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
					
						<%--<td>${fieldValue(bean: userInstance, field: "password")}</td>
					
						--%><td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>
						
						<td>
							<a href="${createLink(action:'delete',controller:'user',id:userInstance.id) }" onclick="return confirm('${message(code:'default.button.delete.confirm.message',default:'亲，确认删除嘛？ ')}')">删除</a>
							<a data-toggle="modal" href="${createLink(action:'edit',controller:'user',id:userInstance.id) }" data-target="#myModal" data-toggle="tooltip" data-palcement="top" title="编辑">编辑</a>
							
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
			<div class="modal fade" id="myModal">
   				<div class="modal-dialog">
      			<div class="modal-content">
      			</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
	</div>
	</body>
</html>
