<!DOCTYPE html>
<html>
<head>
    <title>DHT Mockup</title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    <g:javascript src="jquery-1.8.2.min.js"/>
    <g:javascript src="jquery.imagemapster.min.js"/>
    <g:javascript src="jquery.tools.min.js"/>
    <r:layoutResources/>
</head>

<body>
<div id="container">
    <div id="header">
        <a href="/" id="logo"><img src="${resource(dir: 'images', file: 'logo.jpg')}"
                                   alt="DEN HISTORISKE TIDSLINJE.DK"/></a>
        <ul>
            <li><a href="#" class="buttonSize button selected">tidslinjen</a></li>
            <li><a href="#" class="buttonSize button">Projektet</a></li>
            <li><a href="#" class="buttonSize button">Kontakt</a></li>
            <li><a href="#" class="buttonSize button">Spil</a></li>
            <li class="right"><a href="#" class="buttonSize button">Log ind</a></li>
            <li class="right"><a href="#" class="buttonSize92 button">Brugernavn</a></li>
            <li class="right"><input type="text" class="inputBox"/></li>
            <li class="right">S&Oslash;g</li>

        </ul>
    </div>

    <div id="map"><img src="${resource(dir: 'images', file: 'map.jpg')}" width="1260" height="350" usemap="#Map"
                       border="0"/>
        <map name="Map" id="Map">
            <area shape="poly"
                  coords="463,258,468,262,458,253,455,247,451,241,450,237,451,232,455,227,457,221,456,216,449,215,443,214,436,209,430,206,422,203,414,202,406,197,401,191,397,185,392,181,388,175,384,173,393,188,388,185,384,180,381,175,377,169,373,167,367,160,365,153,364,142,363,132,357,125,355,119,351,115,349,123,346,114,344,108,338,102,333,99,323,99,314,101,313,104,310,109,305,111,297,113,287,118,277,123,282,118,293,111,300,107,296,104,291,103,289,100,286,99,280,99,283,94,286,89,290,86,294,83,289,82,285,82,282,80,280,77,285,74,290,74,288,68,285,65,285,61,292,57,298,52,305,51,313,54,323,57,332,59,338,62,346,64,349,60,355,57,361,57,371,61,379,62,383,60,378,51,377,45,373,44,368,52,364,50,362,39,364,36,366,34,372,33,380,35,385,39,391,43,397,43,401,39,401,37,398,31,391,32,383,32,381,29,376,24,368,23,368,21,375,16,386,8,392,4,397,3,409,3,415,2,419,1,425,2,431,1,435,1,439,0,447,0,453,0,459,0,463,0,454,18,449,23,436,22,433,23,441,28,448,26,452,29,452,33,450,36,454,38,458,41,462,45,468,52,471,56,477,61,479,68,485,73,485,82,480,82,483,90,481,94,478,95,474,94,471,96,476,102,479,100,481,99,487,107,490,113,494,117,496,121,499,124,500,131,503,135,501,136,496,137,492,135,493,131,489,129,486,130,486,133,490,137,493,139,488,143,477,146,472,147,468,151,463,156,457,163,455,170,448,173,448,179,452,183,455,187,457,191,458,192,464,194,473,194,477,196,479,199,469,202,462,201,456,199,452,199,451,194,447,192,443,190,446,186,444,181,442,178,432,176,427,177,423,179,422,180,419,184,415,189,416,194,419,195,424,195,428,194,431,193,433,192,436,192,439,192,441,200,445,202,446,205,449,209,454,211,461,212,468,210,473,210,478,212,485,212,489,213,496,218,504,221,510,227,516,233,523,234,532,237,539,241,538,247,533,257,528,268,520,272,514,274,512,280,508,288,503,293,498,295,497,299,495,302,489,303,487,305,483,308,481,310,482,315,481,315,478,319,477,321,477,325,479,326,475,331,473,334,476,340,480,344,485,339,491,334,495,334,495,337,492,338,484,344,471,344,466,343,463,338,461,332,461,324"
                  href="#"/>
            <area shape="poly"
                  coords="471,25,484,31,493,35,500,47,502,60,503,72,503,85,513,99,522,103,529,98,530,88,540,83,549,75,563,68,564,81,564,88,579,88,586,91,586,99,603,104,612,109,618,117,628,115,637,113,637,104,640,93,645,88,642,94,644,100,650,100,661,97,661,91,658,83,659,75,661,62,661,56,644,55,635,67,625,78,619,84,603,89,580,84,573,75,569,68,569,59,570,43,574,34,576,25,575,15,574,11,585,6,617,9,635,12,649,16,659,11,653,5,478,4,473,4,468,9,466,11"
                  href="#"/>
            <area shape="poly"
                  coords="619,222,621,234,627,244,626,260,628,269,632,282,635,292,647,295,656,287,664,278,668,271,673,265,683,261,683,271,691,280,696,272,696,260,699,255,679,254,679,247,682,241,687,236,695,224,704,216,698,212,679,209,673,196,668,184,662,174,649,172,639,173,631,172,625,168,611,162,599,165,584,168,579,180,573,187,569,202,573,210,582,219,596,224"
                  href="#"/>
            <area shape="poly"
                  coords="590,163,599,160,616,160,618,152,625,153,637,160,647,164,650,156,652,143,651,134,645,128,641,121,629,118,617,118,613,122,603,125,600,120,594,109,591,106,584,114,582,121,590,127,593,133,598,138,593,144,585,144,583,154,583,159,657,164,656,159,659,151,671,152"
                  href="#"/>
            <area shape="poly"
                  coords="715,193,718,185,719,172,720,166,716,160,702,161,696,161,689,154,680,154,669,154,664,155,664,164,667,171,678,192,686,205,699,206"
                  href="#"/>
            <area shape="poly"
                  coords="878,135,883,126,883,111,899,108,917,116,933,110,942,97,954,91,973,80,972,68,968,56,957,51,941,51,928,52,909,56,904,54,888,47,885,38,882,28,870,24,868,36,865,44,858,52,851,47,849,40,837,38,828,38,820,31,816,20,809,9,803,5,796,5,790,9,792,21,788,24,776,29,768,35,761,49,743,53,738,55,718,62,718,57,718,43,732,31,738,25,738,12,727,15,720,22,708,37,706,43,704,50,702,57,703,64,677,71,669,70,663,77,662,91,664,106,656,106,652,111,649,115,649,128,659,135,672,141,694,149,706,158,723,159,745,154,755,139,768,134,781,128,799,126,817,125,827,129,842,122,852,129,860,136,865,144,863,148"
                  href="#"/>
            <area shape="poly"
                  coords="739,198,731,184,725,176,725,166,741,159,759,150,770,144,779,137,794,135,817,135,830,134,845,134,853,135,856,144,855,153,852,163,851,172,858,169,867,161,872,153,880,147,886,148,882,155,875,169,863,172,857,172,845,168,840,159,837,159,839,169,839,179,838,192,834,193,818,197,819,212,830,212,833,205,839,199,846,210,847,223,847,228,859,234,867,234,878,233,887,235,903,235,913,245,918,248,932,256,943,266,947,263,951,261,958,268,940,273,922,270,931,286,943,293,950,293,951,303,944,312,938,318,933,322,920,326,921,318,933,305,933,301,932,293,924,283,923,269,922,264,919,260,922,266,908,262,891,259,885,258,891,270,898,282,901,300,884,313,872,304,846,296,833,296,827,292,827,284,835,266,847,258,853,253,835,248,820,249,810,247,802,239,799,227,797,221,791,212,790,231,789,223,794,235,789,225,789,218,789,208,787,205,783,199,773,194,768,198,766,212,765,216,762,221,760,225,751,220,744,213"
                  href="#"/>
        </map></div>

    <div id="wrapper">
        <div id="scrollbar">
            <a href="#"><img class="topArrow" src="${resource(dir: 'images', file: 'top-arrow.png')}"/></a>
            <g:each in="${maxYear..(maxYear - 25)}" var="${entryYear}" status="index">
                <div id="${'time-' + entryYear}"
                     class="${entryYear == maxYear ? "topYear" : (entryYear == minYear || index == 25) ? "bottomYear" : 'hiddenYear'}">
                    <g:if test="${(entryYear in [maxYear, minYear]) || index == 25}">
                        ${entryYear}
                    </g:if>
                    <g:else>
                        &nbsp;
                    </g:else>
                </div>
            </g:each>
            <a href="#"><img class="bottomArrow" src="${resource(dir: 'images', file: 'bot-arrow.png')}"/></a>
        </div>

        <div id="gridBox">
            <ul class="gridBox">
                <li><div class="head norden">DANMARK OG NORDEN</div>
                </li>
                <li>
                    <div class="head europa">EUROPA</div>
                </li>
                <li>
                    <div class="head nordamerika sydamerika">NORD & SYD- AMERIKA</div>
                </li>
                <li>
                    <div class="head det">DET TIDL. SOVJET</div>
                </li>
                <li>
                    <div class="head mellemsten">MELLEM&Oslash;STEN</div>
                </li>
                <li>
                    <div class="head asien">ASIEN OG OCEANIEN</div>
                </li>
                <li>
                    <div class="head afrika">AFRIKA</div>
                </li>
            </ul>

            <div id="gridMultpleBox">
                <ul class="gridBox gridBoxs">
                    <li>
                        <div class="emptyBox"></div>
                        <g:render template="gridEntry"
                                  model="[entries: regionWiseEntries['norden'], minYear: minYear, maxYear: maxYear, makeEmptyDivsToScrollTo: true]"/>

                    </li>
                    <li>
                        <g:render template="gridEntry"
                                  model="[entries: regionWiseEntries['europa'], minYear: minYear, maxYear: maxYear]"/>

                    </li>
                    <li>
                        <g:render template="gridEntry"
                                  model="[entries: regionWiseEntries['nordamerika'], minYear: minYear, maxYear: maxYear]"/>
                    </li>
                    <li>
                        <g:render template="gridEntry"
                                  model="[entries: regionWiseEntries['sovjet'], minYear: minYear, maxYear: maxYear]"/>
                    </li>
                    <li>
                        <g:render template="gridEntry"
                                  model="[entries: regionWiseEntries['mellemøsten'], minYear: minYear, maxYear: maxYear]"/>
                    </li>
                    <li>
                        <g:render template="gridEntry"
                                  model="[entries: regionWiseEntries['kina'], minYear: minYear, maxYear: maxYear]"/>
                    </li>
                    <li>
                        <g:render template="gridEntry"
                                  model="[entries: regionWiseEntries['afrika'], minYear: minYear, maxYear: maxYear]"/>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    jQuery.tools.overlay.addEffect("customEffect", function (css, done) {
                overlay = this.getOverlay();
                trigger = this.getTrigger();
                css.top += jQuery(trigger).position.top;
                css.left += jQuery(trigger).position.left;
                css.position = 'relative';
                overlay.css(css).show();
            },
            function (done) {
                jQuery('div[id*="time-"][class="hiddenYear"]').html("&nbsp;");
                this.getOverlay().fadeOut(this.getConf().closeSpeed, done);
            }
    );
    jQuery(document).ready(function () {

        jQuery(".gridEntry").tooltip({
            position:'center right',
            effect:'slide',
            offset:[10, 2]
        }).dynamic({ bottom:{ direction:'down', bounce:true } });

        jQuery(".gridEntry").overlay({
            closeOnClick:false,
            fixed:false,
            effect:'customEffect'
        });

        jQuery(".gridEntry").click(function () {
            var entryYear = jQuery(this).attr('id').split("-")[2];
            jQuery('div[id*="time-"][class="hiddenYear"]').html("&nbsp;");
            jQuery("#time-" + entryYear).html(entryYear);
        });
        jQuery('.bottomYear').click(function () {
            var bottomYear = jQuery('.bottomYear').attr('id').split('-')[1];
            jQuery('.topYear').html(bottomYear);
            jQuery('.topYear').attr('id', "time-" + Number(bottomYear));
            jQuery('.bottomYear').html(Number(bottomYear) - 25);
            jQuery('.bottomYear').attr('id', "time-" + (Number(bottomYear) - 25));
            jQuery('.hiddenYear').each(function (index) {
                jQuery(this).attr('id', "time-" + (Number(bottomYear) - (Number(index) + 1)));
            });
        });
        jQuery('.topYear').click(function () {
            var topYear = jQuery('.topYear').attr('id').split('-')[1];
            jQuery('.bottomYear').html(topYear);
            jQuery('.bottomYear').attr('id', "time-" + Number(topYear));
            jQuery('.topYear').html(Number(topYear) + 25);
            jQuery('.topYear').attr('id', "time-" + (Number(topYear) + 25));
            jQuery('.hiddenYear').each(function (index) {
                jQuery(this).attr('id', "time-" + (Number(topYear) + (25 - (Number(index) + 1))));
            });
        });
    });
</script>
</body>
</html>
