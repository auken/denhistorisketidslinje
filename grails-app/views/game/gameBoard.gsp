<%@ page import="net.auken.dht.Step" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="layout" content="mainTwo">
    <title>Den Historiske Tidslinje</title>
    <g:javascript src="jquery.tools.min.js"/>
    <g:javascript src="jquery.scrollTo-1.4.3.1-min.js"/>
    <g:javascript src="jquery.localscroll-1.2.7-min.js"/>
    <g:javascript src="jquery.jeditable.mini.js"/>
</head>

<body>

<div id="container">
    <div id="headerGameBoard">
        <div class="top clearfix">
            <a href="#" class="btn-logud" id="logud">&nbsp;</a>
            <ul>
                <li><a href="#" id="tidslinjen" class="tidslinjenStep">&nbsp;</a></li>
                <li><a href="#" id="om_projektet" class="om_projektetStep">&nbsp;</a></li>
                <li><a href="#" id="kontakt" class="kontaktStep">&nbsp;</a></li>
                <li>
                    <a href="#" id="spil" class="spilStep"></a>
                </li>
            </ul>
            <img alt="den historiske tidslinjedk" src="../images/header_den.png"/>
        </div>

        <div id="menu" class="clearfix">
            <ul id="steps">
                <li class="step1 active"><a href="#">&nbsp;</a></li>
                <li class="step2"><a href="#">&nbsp;</a></li>
                <li class="step3"><a href="#">&nbsp;</a></li>
                <li class="step4"><a href="#">&nbsp;</a></li>
                <li class="step5"><a href="#">&nbsp;</a></li>
                <li class="step6"><a href="#">&nbsp;</a></li>
            </ul>
            <ul class="actions">
                <li><a href="#" id="tilbage" class="tilbage">&nbsp;</a></li>
                <li><a href="#" id="go_vidare" class="go-next">&nbsp;</a></li>
                <li><a href="#" id="nulstil" class="resetStep">&nbsp;</a></li>
                <li><a href="#" id="help" class="help">&nbsp;</a></li>
                <li><a href="#" id="tidslinje" class="tidslinjeStep" style="display: none">&nbsp;</a></li>
                <li><a href="#" id="hentData" class="hent-data" style="display: none">&nbsp;</a></li>
                <li><a href="#" id="overfer" class="overfer" style="display: none">&nbsp;</a></li>
                <li>
                    <g:form name="generatePdf" controller="util" action="createPdf" method="post">
                        <textarea rows="10" cols="10" style="display: none;" id="bodyHtml" name="bodyHtml"></textarea>
                        <a href="#" id="openPdf" class="openPdfStep" style="display: none">&nbsp;</a>
                    </g:form>
                </li>
            </ul>

        </div>

    </div>

    <div class="middle-content-gameboard clearfix" id="step1">
        <g:render template="stepFourLeftBoxes"/>
        <g:render template="stepSixHistoryLessons"/>

        <div class="left-col">
            <g:render template="stepOneLeftBox"/>
        </div>

        <div class="right-col">
            <div class="content">Her er hj¾lpeteksten - for s¿ren... 123 456 !!
                <div class="form clearfix">
                    <form action="#">
                        <label>Antal</label>
                        <input type="text" value="4" id="historyLessonCount"/>
                        <input type="submit" id="submitButton" value=""/>
                    </form>
                </div>
            </div>

            <div class="connectedSortable box-container" id="toolBoxDivGameBoard">
                <g:render template="stepOneRightBox" model="[stepWiseEntries: stepWiseEntries]"/>
                <g:render template="stepTwoRightBox" model="[stepWiseEntries: stepWiseEntries]"/>
                <g:render template="stepFourRightBox" model="[stepWiseEntries: stepWiseEntries]"/>
            </div>
        </div>
    </div>
</div>

<div id="mapDiv" style="display: none;">
    <g:render template="showMapGameBoard"
              model="[regionWiseEntries: regionWiseEntries, kinaAndAustralienEntries: kinaAndAustralienEntries, northAndSouthAmericaEntries: northAndSouthAmericaEntries]"/>
</div>

<script type="text/javascript">
    jQuery(document).ready(function () {
        var stepCompleted = 1;
        var containerDivGameBoard = jQuery('#containerDivGameBoard');
        var toolBoxDivGameBoard = jQuery("#toolBoxDivGameBoard");
        var mapDiv = jQuery('#mapDiv');
        var containerDivWidth = containerDivGameBoard.width() - 10;
        var containerDivHeight = containerDivGameBoard.height() - 10;
        var divTop;
        var divLeft;
        jQuery(".stepOneBoxes").draggable({
            cursor: 'move',
            revert: true
        });

        jQuery('#openPdf').click(function () {
            var bodyClone = jQuery('body').clone();
            bodyClone.find('input').remove();
            bodyClone.find('#headerGameBoard').css('visibility', 'hidden');
            bodyClone.find('.right-col').remove();
            jQuery('#bodyHtml').val(bodyClone.html());
            jQuery('form#generatePdf').submit();
        });

        jQuery("#nulstil").click(function () {
            window.location.reload(true);
        });

        jQuery("#containerDivGameBoard").droppable({
            drop: function (event, ui) {
                var toolBoxStepDiv = ui.draggable.clone();
                var topPosition = ui.offset.top;
                var leftPosition = ui.offset.left;
                var containerDivTop = containerDivGameBoard.offset().top;
                var maxTop = Math.max(topPosition, containerDivTop);
                if (maxTop == containerDivTop) {
                    topPosition = 10;
                } else {
                    topPosition = (topPosition - containerDivTop) + 10;
                }

                var maxHeight = Math.max((topPosition + 30), containerDivHeight);
                if (maxHeight == containerDivHeight) {
                    toolBoxStepDiv.find('.ui-resizable-handle').remove();
                    toolBoxStepDiv.resizable({
                        maxWidth: containerDivWidth,
                        minWidth: containerDivWidth,
                        maxHeight: containerDivHeight,
                        grid: 5,
                        resize: function (event, ui) {
                            checkAndRevertTheSortableDiv(ui.element, containerDivHeight, containerDivWidth);
                        }
                    });
                    containerDivGameBoard.append(toolBoxStepDiv);
                    toolBoxStepDiv.css({top: topPosition, left: containerDivGameBoard.offset().left, position: "absolute", width: containerDivWidth });
                    toolBoxStepDiv.removeClass("shadow");
                    ui.draggable.remove();
                    if (!jQuery("#toolBoxDivGameBoard").find('.boxGameBoard').size()) {
                        jQuery('#go_vidare').addClass('active');
                    }
                } else {
                    ui.draggable.removeClass("shadow");
                }
            },

            over: function (event, ui) {
//                ui.draggable.addClass("shadow");
            },
            activate: function (event, ui) {
                ui.draggable.css("z-index", '9999');
//                ui.draggable.addClass("shadow");
            },
            deactivate: function (event, ui) {
                ui.draggable.css("z-index", '1');
                ui.draggable.removeClass("shadow");
            },
            out: function (event, ui) {
                ui.draggable.removeClass("shadow")
            }
        }).sortable();

        toolBoxDivGameBoard.droppable({
            drop: function (event, ui) {
                var containerDivClone = ui.draggable.clone();
                containerDivClone.removeAttr("style");
                jQuery(this).append(containerDivClone);
                containerDivClone.draggable({
                    cursor: "move",
                    revert: true
                });
                containerDivClone.removeClass("ui-resizable-resizing");
                containerDivClone.removeClass("ui-resizable");
                containerDivClone.removeClass("shadow");
                removeResizableFromDiv(toolBoxDivGameBoard);
                ui.draggable.remove();
                if (jQuery("#toolBoxDivGameBoard").find('.boxGameBoard, .list').size()) {
                    jQuery('#go_vidare').removeClass('active');
                }
            },
            activate: function (event, ui) {
                ui.draggable.css("z-index", '9999');
            },
            deactivate: function (event, ui) {
                ui.draggable.css("z-index", '1');
            }
        }).sortable();

        jQuery("#go_vidare").click(function (event) {
            if (jQuery(this).hasClass("active")) {
                switch (stepCompleted) {
                    case 1:
                    {
                        jQuery('#containerDivGameBoard').sortable('destroy');
                        jQuery('#containerDivGameBoard').droppable('destroy');
                        toolBoxDivGameBoard.sortable('destroy');
                        toolBoxDivGameBoard.droppable('destroy');
                        jQuery('#step1').attr('id', 'step2');
                        removeResizableFromDiv(jQuery(".boxGameBoard"));
                        jQuery(".list").draggable({
                            revert: true,
                            cursor: "move",
                            stack: ".list"
                        });
                        jQuery(".stepOneBoxes").droppable({
                            accept: ".list",
                            drop: function (event, ui) {
                                if (ui.draggable.parent("div").attr("id") == "toolBoxDivGameBoard") {
                                    var draggedEvent = ui.draggable.clone();
                                    jQuery(this).append(draggedEvent);
                                    draggedEvent.removeClass("shadow").css({width: "98%"});
                                    var parentTopPosition = draggedEvent.parent("div").position().top;
                                    var parentTopAndHeight = parentTopPosition + draggedEvent.parent("div").height();
                                    draggedEvent.css({left: "0px", top: "0px", marginTop: "5px"});
                                    draggedEvent.parent("div").children(".list").each(function (array, object) {
                                        var childrenDivTopAndHeight = jQuery(this).position().top + jQuery(this).height() + draggedEvent.parent("div").position().top - 1;
                                        var maxChildrenTopAndHeight = Math.max(childrenDivTopAndHeight, parentTopAndHeight);
                                        var childrenTop = jQuery(this).position().top + parentTopPosition;
                                        if (maxChildrenTopAndHeight == childrenDivTopAndHeight || childrenTop == parentTopPosition) {
                                            var droppableEvent = jQuery(this).clone().removeAttr("style");
                                            droppableEvent.draggable({
                                                revert: true,
                                                cursor: "move"
                                            });
                                            toolBoxDivGameBoard.append(droppableEvent);
                                            jQuery(this).remove();
                                        }
                                    });
                                    ui.draggable.remove();
                                }
                                if (!jQuery("#toolBoxDivGameBoard").find('.list').size()) {
                                    jQuery('#go_vidare').addClass('active');
                                }
                            },
                            activate: function (event, ui) {
                                ui.draggable.css("z-index", '9999');
                            },
                            deactivate: function (event, ui) {
                                ui.draggable.css("z-index", '1');
                            }
                        }).sortable();
                        toolBoxDivGameBoard.droppable({
                            drop: function (event, ui) {
                                var containerDivClone = ui.draggable.clone();
                                containerDivClone.removeAttr("style");
                                jQuery(this).append(containerDivClone);
                                containerDivClone.draggable({
                                    cursor: "move",
                                    revert: true
                                });
                                containerDivClone.removeClass("ui-resizable-resizing");
                                containerDivClone.removeClass("ui-resizable");
                                containerDivClone.removeClass("shadow");
                                removeResizableFromDiv(toolBoxDivGameBoard);
                                ui.draggable.remove();
                                if (jQuery("#toolBoxDivGameBoard").find('.boxGameBoard, .list').size()) {
                                    jQuery('#go_vidare').removeClass('active');
                                }
                            },
                            activate: function (event, ui) {
                                ui.draggable.css("z-index", '9999');
                            },
                            deactivate: function (event, ui) {
                                ui.draggable.css("z-index", '1');
                            }
                        }).sortable();
                        jQuery(this).removeClass('active');
                        jQuery('.step1').removeClass('active');
                        jQuery('.step2').addClass('active');
                        stepCompleted++;
                        break;
                    }
                    case 2:
                    {
                        jQuery('#step2').attr('id', 'step3');
                        jQuery('.stepOneBoxes').droppable('destroy');
                        jQuery('.stepOneBoxes').sortable('destroy');
                        jQuery('.list').draggable('destroy');
                        jQuery(this).removeClass('active');
                        // the code below is written to remove the last event div from the left container div at step 3
                        var heights = jQuery("#containerDivGameBoard").children().map(function () {
                            return jQuery(this).position().top;
                        }).get();
                        var maxHeight = Math.max.apply(null, heights);
                        jQuery('#containerDivGameBoard').children().each(function () {
                            if (jQuery(this).position().top == maxHeight) {
                                jQuery(this).find('.event').remove();
                            }
                        });
                        jQuery('.step2').removeClass('active');
                        jQuery('.step3').addClass('active');
                        jQuery('#hentData').show();
                        stepCompleted++;
                        break;
                    }
                    case 3:
                    {
                        jQuery('#go_vidare').removeClass('active');
                        jQuery('#step3').attr('id', 'step4');
                        jQuery('.step3ImportantEvents').droppable('destroy');
                        jQuery('.step3ImportantEvents').sortable('destroy');
                        jQuery('.dummyClass').draggable('destroy');
                        toolBoxDivGameBoard.droppable('destroy');
                        toolBoxDivGameBoard.sortable('destroy');
                        jQuery(".yellow-box").draggable({
                            helper: 'original',
                            cursor: 'move',
                            revert: true
                        });
                        jQuery(".green-box").draggable({
                            helper: 'original',
                            cursor: 'move',
                            revert: true
                        });
                        jQuery('.yellow-box-container').droppable({
                            accept: ".yellow-box",
                            drop: function (event, ui) {
                                var toolBoxStepDiv = ui.draggable.clone();
                                toolBoxStepDiv.removeAttr("style");
                                var topPosition = ui.offset.top;
                                var leftPosition = ui.offset.left;
                                var yellowBoxContainerDiv = jQuery(".yellow-box-container");
                                var yellowBoxContainerDivWidth = yellowBoxContainerDiv.width() - 10;
                                var yellowBoxContainerDivHeight = yellowBoxContainerDiv.height() - 10;
                                var yellowBoxTop = yellowBoxContainerDiv.offset().top;
                                toolBoxStepDiv.find('.ui-resizable-handle').remove();
                                toolBoxStepDiv.resizable({
                                    maxWidth: yellowBoxContainerDivWidth,
                                    minWidth: yellowBoxContainerDivWidth,
                                    maxHeight: yellowBoxContainerDivHeight,
                                    minHeight: 25,
                                    grid: 5,
                                    resize: function (event, ui) {
                                        checkAndRevertTheSortableDiv(ui.element, yellowBoxContainerDivHeight, yellowBoxContainerDivWidth);
                                    }
                                });
                                yellowBoxContainerDiv.append(toolBoxStepDiv);
                                var maxTop = Math.max(topPosition, yellowBoxTop);
                                if (maxTop == yellowBoxTop) {
                                    topPosition = 10;
                                } else {
                                    topPosition = (topPosition - yellowBoxTop) + 10;
                                }

                                toolBoxStepDiv.css({top: topPosition, position: "absolute", width: yellowBoxContainerDivWidth, height: ui.draggable.height()});
                                toolBoxStepDiv.removeClass("shadow");
                                ui.draggable.remove();
                                /* Do not bring this if statement on top of the above 'ui.draggable.remove()' statement*/
                                if (!jQuery("#toolBoxDivGameBoard").find('.green-box, .yellow-box').size()) {
                                    jQuery('#go_vidare').addClass('active');
                                }
                            }
                        }).sortable();

                        jQuery('.green-box-container').droppable({
                            accept: ".green-box",
                            drop: function (event, ui) {
                                var toolBoxStepDiv = ui.draggable.clone();
                                toolBoxStepDiv.removeAttr("style");
                                var topPosition = ui.offset.top;
                                var leftPosition = ui.offset.left;
                                var greenBoxContainerDiv = jQuery(".green-box-container");
                                var greenBoxContainerDivWidth = greenBoxContainerDiv.width() - 10
                                var greenBoxContainerDivHeight = greenBoxContainerDiv.height() - 10
                                var greenBoxTop = greenBoxContainerDiv.offset().top;
                                toolBoxStepDiv.find('.ui-resizable-handle').remove();
                                toolBoxStepDiv.resizable({
                                    maxWidth: greenBoxContainerDivWidth,
                                    minWidth: greenBoxContainerDivWidth,
                                    maxHeight: greenBoxContainerDivHeight,
                                    minHeight: 25,
                                    grid: 5,
                                    resize: function (event, ui) {
                                        checkAndRevertTheSortableDiv(ui.element, greenBoxContainerDivHeight, greenBoxContainerDivWidth);
                                    }
                                });
                                greenBoxContainerDiv.append(toolBoxStepDiv);
                                var maxTop = Math.max(topPosition, greenBoxTop);
                                if (maxTop == greenBoxTop) {
                                    topPosition = 10;
                                } else {
                                    topPosition = (topPosition - greenBoxTop) + 10;
                                }
                                toolBoxStepDiv.css({top: topPosition, position: "absolute", width: greenBoxContainerDivWidth, height: ui.draggable.height()});
                                toolBoxStepDiv.removeClass("shadow");

                                ui.draggable.remove();
                                /* Do not bring this if statement on top of the above 'ui.draggable.remove()' statement*/
                                if (!jQuery("#toolBoxDivGameBoard").find('.green-box, .yellow-box').size()) {
                                    jQuery('#go_vidare').addClass('active');
                                }
                            }
                        }).sortable();
                        toolBoxDivGameBoard.droppable({
                            drop: function (event, ui) {
                                var containerDivClone = ui.draggable.clone();
                                containerDivClone.removeAttr("style");
                                jQuery(this).append(containerDivClone);
                                containerDivClone.draggable({
                                    cursor: "move",
                                    revert: true
                                });
                                containerDivClone.removeClass("ui-resizable-resizing");
                                containerDivClone.removeClass("ui-resizable");
                                containerDivClone.removeClass("shadow");
                                removeResizableFromDiv(toolBoxDivGameBoard);
                                ui.draggable.remove();
                                if (jQuery("#toolBoxDivGameBoard").find('.green-box, .yellow-box').size()) {
                                    jQuery('#go_vidare').removeClass('active');
                                }
                            }
                        }).sortable();
                        jQuery('.step3').removeClass('active');
                        jQuery('.step4').addClass('active');
                        jQuery('#hentData').hide();
                        stepCompleted++;
                        break;
                    }
                    case 4:
                    {
                        toolBoxDivGameBoard.droppable('destroy');
                        toolBoxDivGameBoard.sortable('destroy');
                        jQuery('.yellow-box-container').droppable('destroy');
                        jQuery('.yellow-box-container').sortable('destroy');
                        jQuery('.green-box-container').droppable('destroy');
                        jQuery('.green-box-container').sortable('destroy');
                        removeResizableFromDiv(jQuery('.green-box-container'));
                        removeResizableFromDiv(jQuery('.yellow-box-container'));
                        jQuery('.form').show();
                        jQuery('#go_vidare').removeClass('active');
                        jQuery('.step4').removeClass('active');
                        jQuery('.step5').addClass('active');
                        stepCompleted++;
                        break;
                    }
                    case 5:
                    {
                        jQuery('.history-lessons').droppable('destroy');
                        jQuery('.history-lessons').sortable('destroy');
                        toolBoxDivGameBoard.droppable('destroy');
                        toolBoxDivGameBoard.sortable('destroy');
                        removeResizableFromDiv(jQuery('.history-lessons'));
                        jQuery('#step5').attr('id', 'step6');
                        jQuery('.dummyClass').draggable({
                            cursor: "move",
                            revert: true
                        });
                        jQuery('.history-box').droppable({
                            accept: ".dummyClass",
                            drop: function (event, ui) {
                                if (ui.draggable.parent("div").attr("id") == "toolBoxDivGameBoard") {
                                    var draggedEvent = ui.draggable.clone();
                                    jQuery(this).append(draggedEvent);
                                    draggedEvent.removeClass("shadow").css({width: "98%"});
                                    var parentTopPosition = draggedEvent.parent("div").position().top;
                                    var parentTopAndHeight = parentTopPosition + draggedEvent.parent("div").height();
                                    draggedEvent.css({left: "0px", top: "0px", marginTop: "5px"});
                                    draggedEvent.parent("div").children(".list").each(function (array, object) {
                                        var childrenDivTopAndHeight = jQuery(this).position().top + jQuery(this).height() + draggedEvent.parent("div").position().top - 1;
                                        var maxChildrenTopAndHeight = Math.max(childrenDivTopAndHeight, parentTopAndHeight);
                                        var childrenTop = jQuery(this).position().top + parentTopPosition;
                                        if (maxChildrenTopAndHeight == childrenDivTopAndHeight || childrenTop == parentTopPosition) {
                                            var droppableEvent = jQuery(this).clone().removeAttr("style");
                                            droppableEvent.draggable({
                                                revert: true,
                                                cursor: "move",
                                                stack: ".list"
                                            });
                                            toolBoxDivGameBoard.append(droppableEvent);
                                            jQuery(this).remove();
                                        }
                                    });
                                    ui.draggable.remove();
                                }
                                if (!jQuery("#toolBoxDivGameBoard").find('.list').size()) {
                                    jQuery('#go_vidare').addClass('active');
                                    jQuery('#hentData').hide();
                                }
                            }
                        }).sortable();
                        toolBoxDivGameBoard.droppable({
                            drop: function (event, ui) {
                                var containerDivClone = ui.draggable.clone();
                                containerDivClone.removeAttr("style");
                                jQuery(this).append(containerDivClone);
                                containerDivClone.draggable({
                                    cursor: "move",
                                    revert: true
                                });
                                containerDivClone.removeClass("ui-resizable-resizing");
                                containerDivClone.removeClass("ui-resizable");
                                containerDivClone.removeClass("shadow");
                                removeResizableFromDiv(toolBoxDivGameBoard);
                                ui.draggable.remove();
                                if (jQuery("#toolBoxDivGameBoard").find('.event').size()) {
                                    jQuery('#go_vidare').removeClass('active');
                                    jQuery('#hentData').show();
                                }
                            }
                        }).sortable();
                        jQuery('.step5').removeClass('active');
                        jQuery('.step6').addClass('active');
                        jQuery('#go_vidare').removeClass('active');
                        jQuery('#hentData').show();
                        stepCompleted++;
                        break;
                    }
                    case 6:
                    {
                        toolBoxDivGameBoard.droppable('destroy');
                        toolBoxDivGameBoard.sortable('destroy');
                        jQuery('.event').droppable('destroy');
                        jQuery('.event').sortable('destroy');
                        jQuery('#openPdf').show();
                        break;
                    }
                    default:
                        break;
                }
            }
        });

        jQuery('#submitButton').click(function () {
            var historyLessonCount = parseInt(jQuery('#historyLessonCount').val(), 10);
            jQuery.each(new Array(historyLessonCount), function () {
                toolBoxDivGameBoard.append('<div class="history-box editable">ANGIV TITEL</div>');
            });

            jQuery('#step4').attr('id', 'step5');
            jQuery('.form').hide();
            jQuery('.history-box').draggable({
                cursor: "move",
                revert: true
            });

            toolBoxDivGameBoard.droppable({
                drop: function (event, ui) {
                    var containerDivClone = ui.draggable.clone();
                    containerDivClone.removeAttr("style");
                    jQuery(this).append(containerDivClone);
                    containerDivClone.draggable({
                        cursor: "move",
                        revert: true
                    });
                    containerDivClone.removeClass("ui-resizable-resizing");
                    containerDivClone.removeClass("ui-resizable");
                    containerDivClone.removeClass("shadow");
                    containerDivClone.addClass("editable");
                    removeResizableFromDiv(toolBoxDivGameBoard);
                    jQuery('.editable').editable(function (value, settings) {
                        return(value);
                    }, {
                        onblur: 'submit',
                        cssClass: 'inherit',
                        style: 'inherit'
                    });
                    ui.draggable.remove();
                    if (jQuery("#toolBoxDivGameBoard").find('.history-box').size()) {
                        jQuery('#go_vidare').removeClass('active');
                    }
                }
            }).sortable();

            jQuery('.history-lessons').droppable({
                accept: ".history-box",
                drop: function (event, ui) {
                    var toolBoxStepDiv = ui.draggable.clone();
                    toolBoxStepDiv.removeAttr("style");
                    var topPosition = ui.offset.top;
                    var leftPosition = ui.offset.left;
                    var historyLessonsContainerDiv = jQuery(".history-lessons");
                    var historyLessonsContainerDivWidth = historyLessonsContainerDiv.width() - 10;
                    var historyLessonsContainerDivHeight = historyLessonsContainerDiv.height() - 10;
                    var historyLessonsContainerTop = historyLessonsContainerDiv.offset().top;
                    toolBoxStepDiv.find('.ui-resizable-handle').remove();
                    toolBoxStepDiv.resizable({
                        maxWidth: historyLessonsContainerDivWidth,
                        minWidth: historyLessonsContainerDivWidth,
                        maxHeight: historyLessonsContainerDivHeight,
                        minHeight: 25,
                        grid: 5,
                        resize: function (event, ui) {
                            checkAndRevertTheSortableDiv(ui.element, historyLessonsContainerDivHeight, historyLessonsContainerDivWidth);
                        }
                    });
                    historyLessonsContainerDiv.append(toolBoxStepDiv);
                    var maxTop = Math.max(topPosition, historyLessonsContainerTop);
                    if (maxTop == historyLessonsContainerTop) {
                        topPosition = 10;
                    } else {
                        topPosition = (topPosition - historyLessonsContainerTop) + 10;
                    }

                    toolBoxStepDiv.css({top: topPosition, position: "absolute", width: historyLessonsContainerDivWidth, height: ui.draggable.height()});
                    toolBoxStepDiv.removeClass("shadow");
                    toolBoxStepDiv.removeClass("editable");
                    ui.draggable.remove();
                    /* Do not bring this if statement on top of the above 'ui.draggable.remove()' statement*/
                    if (!jQuery("#toolBoxDivGameBoard").find('.history-box').size()) {
                        jQuery('#go_vidare').addClass('active');
                    }
                }
            }).sortable();

            jQuery('.editable').editable(function (value, settings) {
                return(value);
            }, {
                onblur: 'submit',
                cssClass: 'inherit',
                style: 'inherit'
            });
        });

        jQuery('#hentData').click(function (event) {
            mapDiv.css('display', 'block');
            mapDiv.css('z-index', '9999');
            jQuery(this).hide();
            jQuery("#overfer").show();
        });

        jQuery('#overfer').click(function (event) {
            toolBoxDivGameBoard.droppable('destroy');
            toolBoxDivGameBoard.sortable('destroy');
            jQuery('.box-container').find('div.event').each(function () {
                jQuery(this).remove();
            });
            jQuery('#mapToolBox').find('div').each(function (array, object) {
                jQuery('.box-container').append(jQuery(object).removeClass('gridEntryToolBox').addClass('event').addClass('dummyClass'));
            });
            mapDiv.hide();
            jQuery(".right-col>.event").draggable({
                helper: 'original',
                cursor: 'move',
                revert: true
            });
            toolBoxDivGameBoard.droppable({
                drop: function (event, ui) {
                    var containerDivClone = ui.draggable.clone();
                    containerDivClone.removeAttr("style");
                    jQuery(this).append(containerDivClone);
                    containerDivClone.draggable({
                        helper: 'original',
                        cursor: "move",
                        revert: true,
                        stack: '.dummyClass'
                    });
                    containerDivClone.removeClass("ui-resizable ui-resizable-resizing");
                    containerDivClone.addClass("event");
                    if (jQuery("#toolBoxDivGameBoard").find('.event').size()) {
                        jQuery('#go_vidare').removeClass('active');
                        jQuery('#hentData').show();
                    }
                    removeResizableFromDiv(toolBoxDivGameBoard);
                    if (!ui.draggable.hasClass("event")) {
                        ui.draggable.parent().css({'background': 'none repeat scroll 0 0 #FFFFFF'});
                    }
                    ui.draggable.remove();
                }
            }).sortable();
            jQuery('.step3ImportantEvents').droppable({
                accept: ".event",
                drop: function (event, ui) {
                    var containerDivClone = ui.draggable.clone();
                    containerDivClone.removeAttr("style");
                    jQuery(this).prepend(containerDivClone);
                    containerDivClone.draggable({
                        helper: 'original',
                        cursor: "move",
                        revert: true
                    });
                    containerDivClone.removeClass("event");
                    containerDivClone.removeClass("gridEntryToolBox");
                    containerDivClone.parent().css({'background': 'none repeat scroll 0 0 #E4E5E0'});
                    ui.draggable.remove();
                    /* Do not bring this if statement on top of the above 'ui.draggable.remove()' statement*/
                    if (!jQuery("#toolBoxDivGameBoard").find('.event').size()) {
                        jQuery('#go_vidare').addClass('active');
                        jQuery('#hentData').hide();
                    }
                }
            }).sortable();
            jQuery("#hentData").show();
            jQuery("#overfer").hide();
        });
    });

    function checkAndRevertTheSortableDiv(object, containerDivHeight, containerDivWidth) {
        var containerStepOneDivTopAndHeight = object.position().top + object.height();
        if (containerStepOneDivTopAndHeight > (containerDivHeight + 10)) {
            object.css({height: containerDivHeight - object.position().top});
        }
    }

    function removeResizableFromDiv(objectParent) {
        objectParent.find(".ui-resizable-handle").each(function (array, object) {
            jQuery(object).remove();
        });
    }
</script>
</body>
</html>