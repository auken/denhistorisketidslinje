<%@ page import="net.auken.dht.MapLocation" %>



<div class="fieldcontain ${hasErrors(bean: mapLocationInstance, field: 'entry', 'error')} required">
    <label for="entry">
        <g:message code="mapLocation.entry.label" default="Entry"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="entry" name="entry.id" from="${net.auken.dht.Entry.list()}" optionKey="id" required=""
              value="${mapLocationInstance?.entry?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mapLocationInstance, field: 'noOfLocation', 'error')} required">
    <label for="noOfLocation">
        <g:message code="mapLocation.noOfLocation.label" default="No Of Location"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="noOfLocation" type="number" value="${mapLocationInstance.noOfLocation}" required=""
                 id="noOfLocation"/>
</div>

<div id="positionDiv">
    <div class="fieldcontain ${hasErrors(bean: mapLocationInstance, field: 'topPosition', 'error')} required"
         id="topDiv">
        <label for="topPosition">
            <g:message code="mapLocation.topPosition.label" default="Top Position"/>
            <span class="required-indicator">*</span>
        </label>
        <g:field name="topPosition" type="number" value="${mapLocationInstance.topPosition}" required=""/><label
            style="color: #ff0000 ;font-size: 13px">(Top value lies between 0 to 93)</label>
    </div>


    <div class="fieldcontain ${hasErrors(bean: mapLocationInstance, field: 'leftPosition', 'error')} required"
         id="leftDiv">
        <label for="leftPosition">
            <g:message code="mapLocation.leftPosition.label" default="Left Position "/>
            <span class="required-indicator">*</span>
        </label>
        <g:field name="leftPosition" type="number" value="${mapLocationInstance.leftPosition}" required=""/>
        <label
                style="color: #ff0000 ;font-size: 13px">(Left value lies between 0 to 96)</label>
    </div>
</div>



