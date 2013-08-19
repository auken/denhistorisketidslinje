<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="layout" content="mainTwo">
    <title>Den Historiske Tidslinje</title>
</head>

<body id="show_period">
<div id="background"></div>

<div id="headerGame">
    <div id="knp_tidslinjen"></div>

    <div id="knp_about_game"></div>

    <div id="knp_kontakt_game"></div>

    <div id="knp_spil_game"></div>

    <div id="apDiv1"></div>

    <div id="apDiv2"></div>

    <div id="b"></div>

    <div id="apDiv4"></div>

    <div id="apDiv5"></div>

    <div id="apDiv6"></div>

    <div id="apDiv3"></div>

    <div id="apDiv7"></div>

    <div id="luk"></div>
</div>


<div class="middle-content clearfix" id="parentDiv">
    <div class="left-col">
        <div class="placeholder connectedSortable" id="containerDiv">
        </div>

    </div>

    <div class="right-col">
        <div id="apDiv13"></div>

        <div id="apDiv14">
            <div class="container connectedSortable" id="toolBoxDiv">
                <div class="box"></div>

                <div class="box"></div>

                <div class="box"></div>

                <div class="box"></div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    jQuery(document).ready(function () {
        var containerDiv = jQuery('#containerDiv')
        var containerDivWidth = containerDiv.width();
        var containerDivHeight = containerDiv.height();
        jQuery("#containerDiv, #toolBoxDiv").sortable({
            connectWith: ".connectedSortable",
            receive: function (event, ui) {
                if (ui.sender.attr('id') != 'toolBoxDiv') {
                    jQuery(ui.item.removeAttr('style'));
                    jQuery(ui.item.removeClass());
                    jQuery(ui.item).resizable('destroy');
                    jQuery(ui.item.addClass('box'));
                } else {
                    jQuery(ui.item).removeClass("shadow");
                    jQuery(ui.item).resizable({
                        maxWidth: containerDivWidth,
                        minWidth: containerDivWidth,
                        maxHeight: containerDivHeight,
                        grid: 5,
                        resize: function (event, ui) {
                            checkAndRevertTheSortableDiv(ui.element, containerDivHeight);
                        }
                    });
                }
            },
            start: function (event, ui) {
                jQuery(ui.item).addClass("shadow");
            },
            stop: function (event, ui) {
                jQuery(ui.item).removeClass("shadow");
                checkAndRevertTheSortableDiv(ui.item, containerDivHeight);
            }
        }).disableSelection();
    });

    function checkAndRevertTheSortableDiv(object, containerDivHeight) {
        var heightSum = 0;
        jQuery(object).nextAll().each(function (array, object) {
            heightSum = heightSum + jQuery(object).height();
        });
        jQuery(object).prevAll().each(function (array, object) {
            heightSum = heightSum + jQuery(object).height();
        });
        heightSum = heightSum + jQuery(object).height();
        if (heightSum > containerDivHeight) {
            var containerDiv = jQuery('#containerDiv');
            var toolBoxDiv = jQuery('#toolBoxDiv');
            var lastDivHtml = containerDiv.children().last().html();
            toolBoxDiv.append("<div class='box'></div>");
            toolBoxDiv.children().last().html(lastDivHtml);
            toolBoxDiv.find(".ui-resizable-handle").each(function (array, object) {
                jQuery(object).remove();
            });
            toolBoxDiv.children().last().resizable('destroy');
            containerDiv.children().last().remove();
        }
    }
</script>
</body>
</html>