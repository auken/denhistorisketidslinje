<%@ page import="net.auken.dht.Entry" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="list"><g:message code="default.list.label"
                                                            args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
        <li><g:link class="create" controller="region" action="list">Region List</g:link></li>
        <li><g:link class="create" action="showEntries">Show Map</g:link></li>
    </ul>
</div>

<div id="show-entry" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list entry">

        <g:if test="${entryInstance?.heading}">
            <li class="fieldcontain">
                <span id="heading-label" class="property-label">
                    <g:message code="entry.heading.label" default="Heading"/>
                </span>

                <span class="property-value" aria-labelledby="heading-label">
                    <g:fieldValue bean="${entryInstance}" field="heading"/>
                </span>

            </li>
        </g:if>

        <g:if test="${entryInstance?.year}">
            <li class="fieldcontain">
                <span id="year-label" class="property-label">
                    <g:message code="entry.year.label" default="Year"/>
                </span>

                <span class="property-value" aria-labelledby="year-label">
                    ${entryInstance.year}
                </span>

            </li>
        </g:if>

        <g:if test="${entryInstance?.region}">
            <li class="fieldcontain">
                <span id="region-label" class="property-label"><g:message code="entry.region.label"
                                                                          default="Region"/>
                </span>

                <span class="property-value" aria-labelledby="region-label">
                    <g:link controller="region" action="show" id="${entryInstance?.region?.id}">
                        ${entryInstance?.region?.encodeAsHTML()}
                    </g:link>
                </span>
            </li>
        </g:if>

        <g:if test="${entryInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label">
                    <g:message code="entry.description.label" default="Description"/>
                </span>

                <span class="property-value" aria-labelledby="description-label">
                    ${entryInstance.showDescription()}
                </span>
            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${entryInstance?.id}"/>
            <g:link class="edit" action="edit" id="${entryInstance?.id}"><g:message code="default.button.edit.label"
                                                                                    default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
