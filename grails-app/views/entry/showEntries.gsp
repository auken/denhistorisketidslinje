<%@ page import="net.auken.dht.Entry" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta name="layout" content="mainTwo">
    <title>Den Historiske Tidslinje</title>
    <g:javascript src="jquery.tools.min.js"/>
    <g:javascript src="jquery.scrollTo-1.4.3.1-min.js"/>
    <g:javascript src="jquery.localscroll-1.2.7-min.js"/>
</head>

<body id="show_entries">
<div id="background">

    <div class="topContainer">
        <div id="header"></div>

        <div id="knp_tidslinjen"></div>

        <div id="apDiv1"></div>

        <a href="about"><div id="knp_about"></div></a>

        <a href="kontakt"><div id="knp_kontakt"></div></a>

        <a href="../game/startGame"><div id="knp_spil"></div></a>

        <div id="knp_logud"></div>

        <div id="knp_MAPamerika"></div>

        <div id="knp_MAPnorden"></div>

        <div id="knp_MAPeuropa"></div>

        <div id="knp_MAPafrika"></div>

        <div id="knp_MAPsovjet"></div>

        <div id="knp_MAPmellemoesten"></div>

        <div id="knp_MAPasien"></div>


        <div id="zoomkort_europa">

            <div class="map-container">
                <g:each in="${regionWiseEntries["norden"]}" var="entries">
                    <g:each in="${entries.mapLocations}" var="mapLocation">
                        <div id="${entries.region.name}-${entries.year}" class="show_point"
                             style='position: absolute; top: ${mapLocation.topPosition}%; left:${mapLocation.leftPosition}%;'></div>
                    </g:each>
                </g:each>

                <g:each in="${regionWiseEntries["europa"]}" var="entries">
                    <g:each in="${entries.mapLocations}" var="mapLocation">
                        <div id="${entries.region.name}-${entries.year}" class="show_point"
                             style='position: absolute; top: ${mapLocation.topPosition}%; left:${mapLocation.leftPosition}%;'></div>
                    </g:each>
                </g:each>

                <g:each in="${regionWiseEntries["afrika"]}" var="entries">
                    <g:each in="${entries.mapLocations}" var="mapLocation">
                        <div id="${entries.region.name}-${entries.year}" class="show_point"
                             style='position: absolute; top: ${mapLocation.topPosition}%; left:${mapLocation.leftPosition}%;'></div>
                    </g:each>
                </g:each>

                <g:each in="${regionWiseEntries["mellemoesten"]}" var="entries">
                    <g:each in="${entries.mapLocations}" var="mapLocation">
                        <div id="${entries.region.name}-${entries.year}" class="show_point"
                             style='position: absolute; top: ${mapLocation.topPosition}%; left:${mapLocation.first().leftPosition}%;'></div>
                    </g:each>
                </g:each>

                <g:each in="${regionWiseEntries["sovjet"]}" var="entries">
                    <g:each in="${entries.mapLocations}" var="mapLocation">
                        <div id="${entries.region.name}-${entries.year}" class="show_point"
                             style='position: absolute; top: ${mapLocation.topPosition}%; left:${mapLocation.leftPosition}%;'></div>
                    </g:each>
                </g:each>

                <g:each in="${kinaAndAustralienEntries}" var="entries">
                    <g:each in="${entries.mapLocations}" var="mapLocation">
                        <div id="${entries.region.name}-${entries.year}" class="show_point"
                             style='position: absolute; top: ${mapLocation.topPosition}%; left:${mapLocation.leftPosition}%;'></div>
                    </g:each>
                </g:each>

                <g:each in="${northAndSouthAmericaEntries}" var="entries">
                    <g:each in="${entries.mapLocations}" var="mapLocation">
                        <div id="${entries.region.name}-${entries.year}" class="show_point"
                             style='position: absolute; top: ${mapLocation.topPosition}%; left:${mapLocation.leftPosition}%;'></div>
                    </g:each>
                </g:each>

                <a href="#" id="show_arrow">
                    <img src="${g.resource(dir: 'images', file: 'btn_mapdown_A.png')}" id="show_down_arrow"
                         style="display: none"/>
                    <img src="${g.resource(dir: 'images', file: 'btn_mapup_B.png')}" id="show_up_arrow"
                         style="display: none"/>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="container">

    <ul class="regionsHeading">
        <li><div id="knp_norden"></div></li>

        <li><div id="knp_europa"></div></li>

        <li><div id="knp_amerika"></div></li>

        <li><div id="knp_sovjet"></div></li>

        <li><div id="knp_mellemoesten"></div></li>

        <li><div id="knp_asien"></div></li>

        <li><div id="knp_afrika"></div></li>
    </ul>

    <div id="scrollbar">
        <a href="#year-1100" class="topYear" id="top-1000"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1000</span>
        </a>
        <a href="#year-1200" class="topYear" id="top-1100"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1100</span>
        </a>
        <a href="#year-1300" class="topYear" id="top-1200"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1200</span>
        </a>
        <a href="#year-1400" class="topYear" id="top-1300"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1300</span>
        </a>
        <a href="#year-1500" class="topYear" id="top-1400"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1400</span>
        </a>
        <a href="#year-1550" class="topYear" id="top-1500"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1500</span>
        </a>
        <a href="#year-1600" class="topYear" id="top-1550"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1550</span>
        </a>
        <a href="#year-1650" class="topYear" id="top-1600"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1600</span>
        </a>
        <a href="#year-1700" class="topYear" id="top-1650"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1650</span>
        </a>
        <a href="#year-1750" class="topYear" id="top-1700"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1700</span>
        </a>
        <a href="#year-1800" class="topYear" id="top-1750"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1750</span>
        </a>
        <a href="#year-1850" class="topYear" id="top-1800"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1800</span>
        </a>
        <a href="#year-1900" class="topYear" id="top-1850"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1850</span>
        </a>
        <a href="#year-1925" class="topYear" id="top-1900"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1900</span>
        </a>
        <a href="#year-1950" class="topYear" id="top-1925"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1925</span>
        </a>
        <a href="#year-1975" class="topYear" id="top-1950"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1950</span>
        </a>
        <a href="#year-2000" class="topYear" id="top-1975"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>1975</span>
        </a>
        <a href="#year-2025" class="topYear" id="top-2000"><img class="topArrow"
                                                                src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>2000</span>
        </a>
        <a href="#" class="topYear" id="top-2025"><img class="topArrow"
                                                       src="${resource(dir: 'images', file: 'top-arrow.png')}"/><span>2025</span>
        </a>

        <div id="selectedYear"></div>

        <hr id="horizontalLine" style="border-color:#B6363A; width: 45px"/>
        <a href="#year-1100" class="bottomYear" id="bottom-1100" rel="1000"><span>1100</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1200" class="bottomYear" id="bottom-1200" rel="1100"><span>1200</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1300" class="bottomYear" id="bottom-1300" rel="1200"><span>1300</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1400" class="bottomYear" id="bottom-1400" rel="1300"><span>1400</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1500" class="bottomYear" id="bottom-1500" rel="1400"><span>1500</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1550" class="bottomYear" id="bottom-1550" rel="1500"><span>1550</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1600" class="bottomYear" id="bottom-1600" rel="1550"><span>1600</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1650" class="bottomYear" id="bottom-1650" rel="1600"><span>1650</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1700" class="bottomYear" id="bottom-1700" rel="1650"><span>1700</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1750" class="bottomYear" id="bottom-1750" rel="1700"><span>1750</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1800" class="bottomYear" id="bottom-1800" rel="1750"><span>1800</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1850" class="bottomYear" id="bottom-1850" rel="1800"><span>1850</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1900" class="bottomYear" id="bottom-1900" rel="1850"><span>1900</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1925" class="bottomYear" id="bottom-1925" rel="1900"><span>1925</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1950" class="bottomYear" id="bottom-1950" rel="1925"><span>1950</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-1975" class="bottomYear" id="bottom-1975" rel="1950"><span>1975</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>
        <a href="#year-2000" class="bottomYear" id="bottom-2000" rel="1975"><span>2000</span><img class="bottomArrow"
                                                                                                  src="${resource(dir: 'images', file: 'bot-arrow.png')}"/>
        </a>

    </div>

    <div id="gridMultpleBox">
        <ul class="gridBoxs">
            <li id="li_MAPnorden">
                <dht:renderRegionEntries entries="${regionWiseEntries['norden']}"/>
            </li>

            <li id="li_MAPeuropa">
                <dht:renderRegionEntries entries="${regionWiseEntries['europa']}"/>
            </li>

            <li id="li_MAPamerika">
                <dht:renderRegionEntries entries="${northAndSouthAmericaEntries}"/>
            </li>

            <li id="li_MAPsovjet">
                <dht:renderRegionEntries entries="${regionWiseEntries['sovjet']}"/>
            </li>

            <li id="li_MAPmellemoesten">
                <dht:renderRegionEntries entries="${regionWiseEntries['mellemoesten']}"/>
            </li>

            <li id="li_MAPasien">
                <dht:renderRegionEntries entries="${kinaAndAustralienEntries}"/>
            </li>

            <li id="li_MAPafrika">
                <dht:renderRegionEntries entries="${regionWiseEntries['afrika']}"/>
            </li>
        </ul>
    </div>

    <div style="position:relative;">
        <g:render template="entryDescription"
                  model="[entries: regionWiseEntries['norden']]"/>
        <g:render template="entryDescription"
                  model="[entries: regionWiseEntries['europa']]"/>
        <g:render template="entryDescription"
                  model="[entries: northAndSouthAmericaEntries]"/>
        <g:render template="entryDescription"
                  model="[entries: regionWiseEntries['sovjet']]"/>
        <g:render template="entryDescription"
                  model="[entries: regionWiseEntries['mellemoesten']]"/>
        <g:render template="entryDescription"
                  model="[entries: kinaAndAustralienEntries]"/>
        <g:render template="entryDescription"
                  model="[entries: regionWiseEntries['afrika']]"/>
    </div>
</div>

<script type="text/javascript">

    jQuery.tools.overlay.addEffect("customEffect", function (css, done) {
                overlay = this.getOverlay();
                css.position = 'absolute';
                css.top = '35px';
                css.left = '385px';
                overlay.css(css).show();
            },
            function (done) {
                jQuery('div[id*="time-"][class="hiddenYear"]').html("&nbsp;");
                this.getOverlay().fadeOut(this.getConf().closeSpeed, done);
            }
    );

    jQuery(document).ready(function () {
        var topYear = jQuery('.topYear');
        var bottomYear = jQuery('.bottomYear');
        var gridEntry = jQuery('.gridEntry');
        var topContainer = jQuery('.topContainer');
        var selectedYear = jQuery('#selectedYear');
        var zoomedEuropa = jQuery("#zoomkort_europa");
        var mapContainer = jQuery(".map-container");
        var showPoint = jQuery("#show_point");
        var gridBoxsLi = jQuery("ul.gridBoxs li");
        var horizontalLine = jQuery("#horizontalLine");
        var downArrow = jQuery("#show_down_arrow");
        var upArrow = jQuery("#show_up_arrow");
        var currentEntryDiv;
        topYear.hide();
        bottomYear.hide();
        jQuery('#top-2025').show();
        jQuery('#bottom-2000').show();

        bottomYear.click(function () {
            var newBottomYear = jQuery(this).attr('rel');
            var newTopId = jQuery(this).attr('id').split('-')[1];
            if (newTopId != 1000) {
                bottomYear.hide();
                jQuery('#bottom-' + newBottomYear).show();
                topYear.hide();
                jQuery('#top-' + newTopId).show();
            }
        });

        topYear.click(function () {
            var newTopYear = jQuery(this).attr('href').split('-')[1];
            var newBottomId = jQuery(this).attr('id').split('-')[1];
            if (newBottomId != 2025) {
                topYear.hide();
                jQuery('#top-' + newTopYear).show();
                bottomYear.hide();
                jQuery('#bottom-' + newBottomId).show();
            }
        });

        jQuery("#scrollbar").localScroll({
            target: '#gridMultpleBox'
        });

        jQuery('ul.regionsHeading li div').click(function () {
            topContainer.children().each(function () {
                jQuery(this).removeClass('selected');
            });
            jQuery("ul.regionsHeading li div").each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            gridBoxsLi.parent().children().each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            var correspondingMapDivElement = jQuery(this).attr('id').replace('knp_', 'knp_MAP');
            var correspondingLiElement = jQuery(this).attr('id').replace('knp_', 'li_MAP');
            jQuery(this).addClass('selectedRegion');
            jQuery("#" + correspondingMapDivElement).addClass('selected');
        });

        gridBoxsLi.click(function () {
            topContainer.children().each(function () {
                jQuery(this).removeClass('selected');
            });
            jQuery("ul.regionsHeading li div").each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            gridBoxsLi.parent().children().each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            var correspondingRegionLiElement = jQuery(this).attr('id').replace('li_MAP', 'knp_');
            var correspondingMapDivElement = jQuery(this).attr('id').replace('li', 'knp');
            jQuery("#" + correspondingRegionLiElement).addClass('selectedRegion');
            jQuery("#" + correspondingMapDivElement).addClass('selected');
        });

        jQuery('#knp_MAPamerika, #knp_MAPnorden, #knp_MAPeuropa, #knp_MAPmellemoesten, #knp_MAPsovjet, #knp_MAPasien, #knp_MAPafrika').click(function () {
            topContainer.children().each(function () {
                jQuery(this).removeClass('selected');
            });
            jQuery(this).addClass('selected');
            jQuery("ul.regionsHeading li div").each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            gridBoxsLi.parent().children().each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            var correspondingRegionLiElement = jQuery(this).attr('id').replace('MAP', '');
            var correspondingLiElement = jQuery(this).attr('id').replace('knp', 'li');
            jQuery("#" + correspondingRegionLiElement).addClass('selectedRegion');
        });

        gridEntry.overlay({
            effect: 'customEffect'
        });

        gridEntry.click(function () {
            mapContainer.find("div").hide();
            jQuery("ul.regionsHeading li").each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            gridBoxsLi.parent().children().each(function () {
                jQuery(this).removeClass('selectedRegion');
            });
            var correspondingRegionLiElement = jQuery(this).parent().parent().attr('id').replace('li_MAP', 'knp_');
            var correspondingLiElement = jQuery(this).parent().parent().attr('id');
            jQuery("#" + correspondingRegionLiElement).addClass('selectedRegion');
            jQuery("#" + correspondingLiElement).addClass('selectedRegion');
            var regionName = jQuery(this).attr("id").split('-')[0];
            var year = jQuery(this).attr("id").split("-")[2];
            var currentEntryMap = regionName.toLowerCase();
            mapContainer.css("background-image", "url(../images/zoomkort_" + currentEntryMap + ".png)");
            upArrow.hide();
            var locationDiv = mapContainer.find("div[id=" + regionName + "-" + year + "]");
            locationDiv.show();
            var mapWidth = mapContainer.width();
            var mapHeight = mapContainer.height();
            switch (currentEntryMap) {
                case 'sydamerika':
                    currentEntryDiv = jQuery(this);
                    upArrow.show();
                    changeZoomedMapsWithDownArrow(downArrow, "nordamerika", currentEntryDiv);
                    break;
                case 'nordamerika':
                    currentEntryDiv = jQuery(this);
                    downArrow.show();
                    changeZoomedMapsWithDownArrow(downArrow, "sydamerika", currentEntryDiv);
                    break;
                case 'kina':
                    currentEntryDiv = jQuery(this);
                    downArrow.show();
                    changeZoomedMapsWithDownArrow(downArrow, "australien", currentEntryDiv);
                    break;
                case 'australien':
                    currentEntryDiv = jQuery(this);
                    upArrow.show();
                    changeZoomedMapsWithDownArrow(downArrow, "kina", currentEntryDiv);
                    break;
                default:
                	downArrow.hide();
                	upArrow.hide();
            }
            zoomedEuropa.show();
        });

        jQuery("img#show_up_arrow").bind("click", function () {
            var regionName = jQuery(this).parent().parent().css("background-image").split("zoomkort_")[1].split(".png")[0];
            var upArrow = jQuery("img#show_up_arrow");
            switch (regionName) {
                case 'sydamerika':
                    changeZoomedMapsWithUpArrow(upArrow, "nordamerika", downArrow, currentEntryDiv);
                    break;
                case 'nordamerika':
                    changeZoomedMapsWithUpArrow(upArrow, "sydamerika", downArrow, currentEntryDiv);
                    break;
                case 'kina':
                    changeZoomedMapsWithUpArrow(upArrow, "australien", downArrow, currentEntryDiv);
                    break;
                case 'australien':
                    changeZoomedMapsWithUpArrow(upArrow, "kina", downArrow, currentEntryDiv);
                    break;
            }
        });

        gridEntry.hover(function (event) {
                    var entryYear = jQuery(this).attr('id').split('-')[2];
                    var divNumber = jQuery(this).attr('class').split('divNumber')[1];
                    var positionOfYear = jQuery(this).attr('data-name').split('yearPosition')[1];
                    var isHorizontal = jQuery(this).attr('data-name').split('-multiLine')[0];
                    var parentDivId = jQuery(this).parent().attr('id');
                    var positionTop = jQuery(this).position().top;
                    var hrHtml = '<hr class="redLine" style="border-color:#B6363A;  position: relative; top: ' + positionTop + 'px;"/>';
                    selectedYear.css({top: function (index) {
                        return positionOfYear * 17;
                    }, position: 'absolute', left: '7px'}).html(entryYear);
                    if (isHorizontal == "true") {
                        horizontalLine.css({top: function (index) {
                            return divNumber * 17;
                        }, position: 'absolute', left: '7px', zIndex: 1});
                        horizontalLine.show();
                    }

                    selectedYear.show();
                    jQuery(this).css('color', '#B6363A');

                    var currentLi = jQuery(this).parent().parent();
                    var currentElement = jQuery(this);
                    var currentElementId = jQuery("div[id=" + currentElement.parent().attr('id') + "]");
                    var parentDiv = jQuery("div[id=" + parentDivId + "]");
                    gridBoxsLi.not(currentLi).each(function () {
                        if (!(jQuery(this).find(parentDiv).find('.divNumber' + divNumber))[0]) {
                            jQuery(this).find(parentDiv).append(hrHtml);
                            jQuery(this).find(parentDiv).find('div').each(function (array, object) {
                                var positionTop = jQuery(this).position().top;
                                jQuery(this).css('top', positionTop - 8);
                            });
                        }
                        var entryDivsInLi = jQuery(this).find(currentElementId).children().not("hr");
                        if (entryDivsInLi.length) {
                            entryDivsInLi.each(function () {
                                var divTopAndHeight = 0;
                                var divTop = jQuery(this).position().top;
                                divTopAndHeight = (divTop + jQuery(this).height());
                                if (divTopAndHeight > positionTop && positionTop > divTop) {
                                    entryDivsInLi.parent().find('hr').css('z-index', -1);
                                }
                            });
                        }
                    });

                },
                function (event) {
                    var currentLi = jQuery(this).parent().parent();
                    selectedYear.hide();
                    horizontalLine.hide();
                    jQuery(this).css('color', '#0d0e2a');
                    var parentDivId = jQuery(this).parent().attr('id');
                    var divNumber = jQuery(this).attr('class').split('divNumber')[1];
                    var parentDiv = jQuery("div[id=" + parentDivId + "]");
                    gridBoxsLi.not(currentLi).each(function () {
                        var year = '#' + parentDivId;
                        var currentYearDiv = jQuery(this).find(year);
                        currentYearDiv.find('hr').remove();
                        if (!(jQuery(this).find(parentDiv).find('.divNumber' + divNumber))[0]) {
                            jQuery(this).find(parentDiv).find('div').each(function (array, object) {
                                var positionTop = jQuery(this).position().top;
                                jQuery(this).css('top', positionTop + 8);
                            });
                        }
                    });
                });

        jQuery(".simple_overlay .close").click(function () {
            zoomedEuropa.hide();
        });

        jQuery(window).load(function () {
            gridEntry.each(function () {
                var divHeight = jQuery(".gridEntry").height();
                var currentDivTop = jQuery(this).position().top;
                var heightOfCurrentDiv;
                var count = 0;
                var totalHeightOfNextDiv = 0;
                var currentDivHeight;
                var allNextDivHeight;
                var divNumber;
                var newDivClass;
                var positionOfYear = jQuery(this).attr("class").split("divNumber")[1];
                horizontalLine.hide();
                jQuery(this).attr("data-name", "false-multiLine-yearPosition" + positionOfYear);
                if (jQuery(this).prev().length) {
                    var previousDivTopAndHeight = jQuery(this).prev().position().top + jQuery(this).prev().height();
                    if (jQuery(this).prev() && jQuery(this).next()) {
                        currentDivHeight = Math.round(jQuery(this).height() / divHeight);
                        if (previousDivTopAndHeight > currentDivTop) {
                            allNextDivHeight = jQuery(this).prev().nextAll();
                            if (allNextDivHeight.length) {
                                allNextDivHeight.not(allNextDivHeight.last()).each(function () {
                                    heightOfCurrentDiv = Math.round(jQuery(this).height() / divHeight);
                                    totalHeightOfNextDiv = heightOfCurrentDiv + totalHeightOfNextDiv;
                                    count = count + 1;
                                });
                                var previousDivHeight = Math.round(jQuery(this).prev().height() / divHeight);
                                var prevDiv = jQuery(this).prev();
                                divNumber = prevDiv.attr('class').split('divNumber')[1];
                                newDivClass = parseInt(divNumber) - previousDivHeight - totalHeightOfNextDiv + count + 1;
                                jQuery(this).prev().removeClass("divNumber" + divNumber);
                                jQuery(this).prev().addClass("divNumber" + newDivClass);
                                jQuery(this).prev().attr("data-name", "true-multiLine-yearPosition" + divNumber);
                                totalHeightOfNextDiv = 0;
                                count = 0;
                            }
                        }

                        if (currentDivHeight == 1 && jQuery(this).next().length > 0) {
                            allNextDivHeight = jQuery(this).nextAll();
                            allNextDivHeight.not(allNextDivHeight.last()).each(function () {
                                heightOfCurrentDiv = Math.round(jQuery(this).height() / divHeight);
                                totalHeightOfNextDiv = heightOfCurrentDiv + totalHeightOfNextDiv;
                                count = count + 1
                            });
                            divNumber = jQuery(this).attr('class').split('divNumber')[1];
                            newDivClass = parseInt(divNumber) - totalHeightOfNextDiv + count;
                            jQuery(this).removeClass("divNumber" + divNumber);
                            jQuery(this).addClass("divNumber" + newDivClass);
                        }
                    }
                }

                currentDivHeight = Math.round(jQuery(this).height() / divHeight);
                var lastDiv = 0;
                if (jQuery(this).prev().length == 0 && jQuery(this).next().length && currentDivHeight == 1) {
                    var firstDiv = jQuery(this);
                    currentDivHeight = Math.round(jQuery(this).height() / divHeight);
                    var allNextDiv = jQuery(this).nextAll();
                    var lastDivHeight = Math.round(allNextDiv.last().height() / divHeight);
                    if (allNextDiv.length > 1) {
                        allNextDiv.each(function () {
                            var nextDiv = jQuery(this).next();
                            var prevDiv = jQuery(this).next()
                            if (nextDiv.length) {
                                currentDivHeight = Math.round(jQuery(this).height() / divHeight);
                                totalHeightOfNextDiv = totalHeightOfNextDiv + currentDivHeight;
                                count = count + 1;
                                var nextDivHeight = Math.round(nextDiv.height() / divHeight);
                                if (lastDivHeight > 1 && nextDivHeight > 1) {
                                    lastDiv = 1;
                                }
                            }
                        });
                        var currentDivNumber = firstDiv.attr('class').split('divNumber')[1];
                        var newClassOfDiv = parseInt(currentDivNumber) - totalHeightOfNextDiv + count;
                        firstDiv.removeClass("divNumber" + currentDivNumber);
                        firstDiv.addClass("divNumber" + newClassOfDiv);
                        if (lastDiv == 1)
                            firstDiv.attr("data-name", "true-multiLine-yearPosition" + currentDivNumber);
                        totalHeightOfNextDiv = 0;
                        count = 0;
                        lastDiv = 0
                    }
                }

            })
        });

    });

    function changeZoomedMapsWithDownArrow(downArrow, regionNameOfChangedMap, currentRegion) {
        var mapContainer = jQuery(".map-container");
        downArrow.attr("src", "../images/btn_mapdown_B.png");
        var currentRegionName = currentRegion.attr("id").split("-")[0];
        var currentYear = currentRegion.attr("id").split("-")[2];
        downArrow.bind("click", function () {
            mapContainer.css("background-image", "url(../images/zoomkort_" + regionNameOfChangedMap + ".png)");
            downArrow.hide();
            jQuery("#show_up_arrow").show();
            jQuery(".map-container").find("div[id=" + currentRegionName + "-" + currentYear + "]").hide();
        });
    }

    function changeZoomedMapsWithUpArrow(upArrow, regionName, downArrow, currentEntryDiv) {
        var mapContainer = jQuery(".map-container");
        var regionNameOfCurrentEntry = currentEntryDiv.attr("id").split("-")[0];
        var yearOfCurrentEntry = currentEntryDiv.attr("id").split("-")[2]
        downArrow.show();
        upArrow.hide();
        mapContainer.css("background-image", "url(../images/zoomkort_" + regionName + ".png)");
        jQuery(".map-container").find("div[id=" + regionNameOfCurrentEntry + "-" + yearOfCurrentEntry + "]").show();
    }
</script>
</body>
</html>