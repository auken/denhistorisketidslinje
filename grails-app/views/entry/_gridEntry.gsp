<g:each in="${yearWiseEntryVOs}" var="yearWiseEntryVO">
    <div id="year-${yearWiseEntryVO.key}" style="position:relative;height: 432px;">
        <g:set var="entryVOs" value="${yearWiseEntryVO.value}"/>
        <g:each in="${1..25}" var="divNumber">
            <g:set var="entryVO" value="${entryVOs.find { it.divNumber == divNumber }}"/>
            <g:if test="${entryVO}">
                <div class="gridEntry divNumber${entryVO.divNumber}" title="${entryVO.heading + " " + entryVO.year}"
                     id="${entryVO.regionName + "-" + divNumber + "-" + entryVO.year}"
                     rel="#entry-${entryVO.entryId}">
                    ${entryVO.heading}
                </div>
            </g:if>
        </g:each>
    </div>
</g:each>

