
<%@ page import="com.surelution.vms.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="jarvis">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
			table{margin-left:70px;}
			td{width:200px;}
			li{list-style:none;}
			span{margin:10px;}
		</style>
	</head>
	<body>
	<div class="content-wrapper">
		<%--<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		--%><div class="nav" role="navigation">
			<div style="width:300px; height:50px; margin-left:88px; margin-top:30px; font-size:30px; font-weifght:bold;">
				<%--<span><a class="home" href="${createLink(uri: '/')}">主页<g:message code="default.home.label"/></a></span>
				--%><span><g:link class="create" action="create">新建用户<%--<g:message code="default.new.label" args="[entityName]" />--%></g:link></span>
			</div>
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><%--<g:message code="default.list.label" args="[entityName]" />--%></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class = "table-bordered">
				<thead style="background:#FFF;">
					<tr>
					
						<g:sortableColumn property="usernme" title="${message(code: 'user.username.label', default: '用户名 ')}" />
					
						<%--<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />--%>
						
						<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Password Expired')}" />
					
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
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
</div>
	</body>
</html>
