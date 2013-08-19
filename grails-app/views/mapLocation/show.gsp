
<%@ page import="net.auken.dht.MapLocation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mapLocation.label', default: 'MapLocation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mapLocation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mapLocation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mapLocation">
			
				<g:if test="${mapLocationInstance?.entry}">
				<li class="fieldcontain">
					<span id="entry-label" class="property-label"><g:message code="mapLocation.entry.label" default="Entry" /></span>
					
						<span class="property-value" aria-labelledby="entry-label"><g:link controller="entry" action="show" id="${mapLocationInstance?.entry?.id}">${mapLocationInstance?.entry?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapLocationInstance?.leftPosition}">
				<li class="fieldcontain">
					<span id="leftPosition-label" class="property-label"><g:message code="mapLocation.leftPosition.label" default="Left Position" /></span>
					
						<span class="property-value" aria-labelledby="leftPosition-label"><g:fieldValue bean="${mapLocationInstance}" field="leftPosition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapLocationInstance?.noOfLocation}">
				<li class="fieldcontain">
					<span id="noOfLocation-label" class="property-label"><g:message code="mapLocation.noOfLocation.label" default="No Of Location" /></span>
					
						<span class="property-value" aria-labelledby="noOfLocation-label"><g:fieldValue bean="${mapLocationInstance}" field="noOfLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mapLocationInstance?.topPosition}">
				<li class="fieldcontain">
					<span id="topPosition-label" class="property-label"><g:message code="mapLocation.topPosition.label" default="Top Position" /></span>
					
						<span class="property-value" aria-labelledby="topPosition-label"><g:fieldValue bean="${mapLocationInstance}" field="topPosition"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mapLocationInstance?.id}" />
					<g:link class="edit" action="edit" id="${mapLocationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
