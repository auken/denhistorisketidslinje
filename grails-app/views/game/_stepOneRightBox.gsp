<%@ page import="net.auken.dht.Step" %>
<g:set var="stepOneEntries" value="${stepWiseEntries.get(Step.findByOccurrenceOrder(1))}"/>
<g:set var="stepOneEntriesSize" value="${stepOneEntries.size()}"/>
<g:each in="${stepOneEntries}" var="entry">
    <div class="boxGameBoard stepOneBoxes">
        ${entry.statement}
        <div class="event">
            <div class="text step3ImportantEvents">&nbsp;</div>
        </div>
    </div>
</g:each>
