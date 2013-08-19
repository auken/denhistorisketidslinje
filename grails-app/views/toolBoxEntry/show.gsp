
<%@ page import="net.auken.dht.ToolBoxEntry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-toolBoxEntry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-toolBoxEntry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list toolBoxEntry">
			
				<g:if test="${toolBoxEntryInstance?.statement}">
				<li class="fieldcontain">
					<span id="statement-label" class="property-label"><g:message code="toolBoxEntry.statement.label" default="Statement" /></span>
					
						<span class="property-value" aria-labelledby="statement-label"><g:fieldValue bean="${toolBoxEntryInstance}" field="statement"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolBoxEntryInstance?.step}">
				<li class="fieldcontain">
					<span id="step-label" class="property-label"><g:message code="toolBoxEntry.step.label" default="Step" /></span>
					
						<span class="property-value" aria-labelledby="step-label"><g:link controller="step" action="show" id="${toolBoxEntryInstance?.step?.id}">${toolBoxEntryInstance?.step?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${toolBoxEntryInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="toolBoxEntry.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${toolBoxEntryInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${toolBoxEntryInstance?.id}" />
					<g:link class="edit" action="edit" id="${toolBoxEntryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
