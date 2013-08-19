<%@ page import="net.auken.dht.Step" %>
<g:each in="${stepWiseEntries.get(Step.findByOccurrenceOrder(2))}" var="entry">
    <div class="list"><ul><li>${entry.statement}</li></ul></div>
</g:each>