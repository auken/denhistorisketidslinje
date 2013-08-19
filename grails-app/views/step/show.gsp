
<%@ page import="net.auken.dht.Step" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'step.label', default: 'Step')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-step" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-step" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list step">
			
				<g:if test="${stepInstance?.maxToolBoxEntriesAllowed}">
				<li class="fieldcontain">
					<span id="maxToolBoxEntriesAllowed-label" class="property-label"><g:message code="step.maxToolBoxEntriesAllowed.label" default="Max Tool Box Entries Allowed" /></span>
					
						<span class="property-value" aria-labelledby="maxToolBoxEntriesAllowed-label"><g:fieldValue bean="${stepInstance}" field="maxToolBoxEntriesAllowed"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stepInstance?.game}">
				<li class="fieldcontain">
					<span id="game-label" class="property-label"><g:message code="step.game.label" default="Game" /></span>
					
						<span class="property-value" aria-labelledby="game-label"><g:link controller="game" action="show" id="${stepInstance?.game?.id}">${stepInstance?.game?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${stepInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="step.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${stepInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stepInstance?.occurrenceOrder}">
				<li class="fieldcontain">
					<span id="occurrenceOrder-label" class="property-label"><g:message code="step.occurrenceOrder.label" default="Occurrence Order" /></span>
					
						<span class="property-value" aria-labelledby="occurrenceOrder-label"><g:fieldValue bean="${stepInstance}" field="occurrenceOrder"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${stepInstance?.toolBoxEntries}">
				<li class="fieldcontain">
					<span id="toolBoxEntries-label" class="property-label"><g:message code="step.toolBoxEntries.label" default="Tool Box Entries" /></span>
					
						<g:each in="${stepInstance.toolBoxEntries}" var="t">
						<span class="property-value" aria-labelledby="toolBoxEntries-label"><g:link controller="toolBoxEntry" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${stepInstance?.id}" />
					<g:link class="edit" action="edit" id="${stepInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
