
<%@ page import="net.auken.dht.Step" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'step.label', default: 'Step')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-step" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-step" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="maxToolBoxEntriesAllowed" title="${message(code: 'step.maxToolBoxEntriesAllowed.label', default: 'Max Tool Box Entries Allowed')}" />
					
						<th><g:message code="step.game.label" default="Game" /></th>
					
						<g:sortableColumn property="helpText" title="${message(code: 'step.helpText.label', default: 'Help Text')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'step.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="occurrenceOrder" title="${message(code: 'step.occurrenceOrder.label', default: 'Occurrence Order')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stepInstanceList}" status="i" var="stepInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stepInstance.id}">${fieldValue(bean: stepInstance, field: "maxToolBoxEntriesAllowed")}</g:link></td>
					
						<td>${fieldValue(bean: stepInstance, field: "game")}</td>
					
						<td>${fieldValue(bean: stepInstance, field: "helpText")}</td>
					
						<td>${fieldValue(bean: stepInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: stepInstance, field: "occurrenceOrder")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stepInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
