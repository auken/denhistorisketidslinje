<%@ page import="net.auken.dht.Entry" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="list">Entry List</g:link></li>
        <li><g:link class="create" controller="region" action="list">Region List</g:link></li>
        <li><g:link class="create" action="showEntries">Show Map</g:link></li>
    </ul>
</div>

<div id="create-entry" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${entryInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${entryInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save" id="createForm">
        <fieldset class="form clearfix">
            <g:render template="form"/>
        </fieldset>

        <div style="position: relative; overflow: hidden; height:500px; width: 620px;margin: auto" class="clearfix">
            <div class="map-container" style="border: 3px solid #ddd;margin: 0">
            </div>
        </div>
        <fieldset class="buttons clearfix">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>


    <div class="map_location_point"
         style="position: absolute; left:0%;top:0%; visibility: hidden"></div>
</div>

<script>
    jQuery(document).ready(function () {
        var mapContainer = jQuery(".map-container");
        var showPoint = jQuery("#map_location_point");
        jQuery("#region").bind("change",function () {
            var selectedRegion = jQuery("#region :selected").text().toLowerCase().replace(/\s/g, "");
            var fileName = "${g.resource(dir: 'images')}" + "/zoomkort_" + selectedRegion + ".png";
            mapContainer.css("background-image", "url(" + fileName + ")");
        }).trigger("change");

        jQuery("#noOfLocation").bind("change",function () {
            var noOfLocation = jQuery("#noOfLocation").val();
            var topDiv = jQuery("#topDiv");
            var locationDiv = jQuery(".map-container");
            topDiv.children().remove();
            locationDiv.children().remove();
            for (i = 1; i <= noOfLocation; i++) {
                var topSelectBox = jQuery("#top").clone();
                var leftSelectBox = jQuery("#left").clone();
                var locationDivClone = jQuery(".map_location_point").clone();
                locationDiv.append(locationDivClone);
                locationDivClone.attr("id", "map-location" + i);
                locationDivClone.css("visibility", "visible");
                topDiv.append("<br><label>Top</label>");
                topDiv.append(topSelectBox);
                topSelectBox.attr({"id": "top" + i, "name": "topPosition"});
                topSelectBox.css("visibility", "visible");
                topDiv.append("<label>Left</label>");
                topDiv.append(leftSelectBox);
                leftSelectBox.attr({"id": "left" + i, "name": "leftPosition"});
                leftSelectBox.css("visibility", "visible");
            }
        }).trigger("change");

        jQuery(document).on("change", "#topDiv>.top",function () {
            var currentTop = jQuery(this).attr("id").split("top")[1];
            var currentMapPointer = jQuery(".map-container").find("div[id=map-location" + currentTop + "]");
            var topValue = parseInt(jQuery(this).val());
            currentMapPointer.css("top", topValue + "%")
        }).trigger("change");

        jQuery(document).on("change", "#topDiv>.left",function () {
            var currentLeft = jQuery(this).attr("id").split("left")[1];
            var currentMapPointer = jQuery(".map-container").find("div[id=map-location" + currentLeft + "]");
            var leftValue = parseInt(jQuery(this).val());
            currentMapPointer.css("left", leftValue + "%")
        }).trigger("change");
    });
</script>
</body>
</html>
