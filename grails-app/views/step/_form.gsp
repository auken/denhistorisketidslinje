<%@ page import="net.auken.dht.Step" %>



<div class="fieldcontain ${hasErrors(bean: stepInstance, field: 'maxToolBoxEntriesAllowed', 'error')} ">
	<label for="maxToolBoxEntriesAllowed">
		<g:message code="step.maxToolBoxEntriesAllowed.label" default="Max Tool Box Entries Allowed" />
		
	</label>
	<g:field name="maxToolBoxEntriesAllowed" type="number" value="${stepInstance.maxToolBoxEntriesAllowed}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stepInstance, field: 'game', 'error')} required">
	<label for="game">
		<g:message code="step.game.label" default="Game" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="game" name="game.id" from="${net.auken.dht.Game.list()}" optionKey="id" required="" value="${stepInstance?.game?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stepInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="step.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${stepInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stepInstance, field: 'occurrenceOrder', 'error')} required">
	<label for="occurrenceOrder">
		<g:message code="step.occurrenceOrder.label" default="Occurrence Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="occurrenceOrder" type="number" value="${stepInstance.occurrenceOrder}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: stepInstance, field: 'toolBoxEntries', 'error')} ">
	<label for="toolBoxEntries">
		<g:message code="step.toolBoxEntries.label" default="Tool Box Entries" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${stepInstance?.toolBoxEntries?}" var="t">
    <li><g:link controller="toolBoxEntry" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="toolBoxEntry" action="create" params="['step.id': stepInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'toolBoxEntry.label', default: 'ToolBoxEntry')])}</g:link>
</li>
</ul>

</div>

