<%@ page import="net.auken.dht.Entry" %>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'heading', 'error')} ">
    <label for="heading">
        <g:message code="entry.heading.label" default="Heading"/>

    </label>
    <g:textField name="heading" value="${entryInstance?.heading}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'year', 'error')} required">
    <label for="year">
        <g:message code="entry.year.label" default="Year"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="year" type="number" value="${entryInstance.year}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'region', 'error')} required">
    <label for="region">
        <g:message code="entry.region.label" default="Region"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="region" name="region.id" from="${net.auken.dht.Region.list()}" optionKey="id" required=""
              value="${entryInstance?.region?.id}"
              class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="entry.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${entryInstance?.description}"/>
</div>

<div class="fieldcontain">
    <label for="top">No. of locations
    </label>
    <g:textField name="noOfLocation" id="noOfLocation" value="1"/>

</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'top', 'error')}  " id="topDiv">
    <label>Top</label>
    <label>Left</label>

</div>


<g:select name="top" from="${0..93}" style="visibility: hidden" class="top"/>
<g:select name="left" from="${0..96}" style="visibility: hidden" class="left"/>









