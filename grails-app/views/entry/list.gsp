
<%@ page import="net.auken.dht.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" controller="region" action="list">Region List</g:link></li>
                <li><g:link class="create" action="showEntries">Show Map</g:link></li>
			</ul>
		</div>
		<div id="list-entry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="heading" title="${message(code: 'entry.heading.label', default: 'Heading')}" />

                        <g:sortableColumn property="year" title="${message(code: 'entry.year.label', default: 'Year')}" />

                        <th><g:message code="entry.region.label" default="Region" /></th>

                        <g:sortableColumn property="description" title="${message(code: 'entry.description.label', default: 'Description')}" />

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entryInstanceList}" status="i" var="entryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entryInstance.id}">${fieldValue(bean: entryInstance, field: "heading")}</g:link></td>
					
						<td>${entryInstance.year}</td>
					
						<td>${fieldValue(bean: entryInstance, field: "region")}</td>
					
						<td>${entryInstance.showDescription()}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
