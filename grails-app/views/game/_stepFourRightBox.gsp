<%@ page import="net.auken.dht.CategoryType; net.auken.dht.Step" %>
<g:set var="stepOneEntries" value="${stepWiseEntries.get(Step.findByOccurrenceOrder(5)) as Set}"/>
<g:each in="${stepOneEntries}" var="entry">
    <g:if test="${entry.type.equals(CategoryType.STYLISTIC_STYLE)}">
        <div class="green-box">
            ${entry.statement}
        </div>
    </g:if>
    <g:else>
        <div class="yellow-box">
            ${entry.statement}
        </div>
    </g:else>
</g:each>
