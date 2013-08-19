<%@ page import="net.auken.dht.ToolBoxEntry" %>



<div class="fieldcontain ${hasErrors(bean: toolBoxEntryInstance, field: 'statement', 'error')} ">
	<label for="statement">
		<g:message code="toolBoxEntry.statement.label" default="Statement" />
		
	</label>
	<g:textField name="statement" value="${toolBoxEntryInstance?.statement}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolBoxEntryInstance, field: 'step', 'error')} required">
	<label for="step">
		<g:message code="toolBoxEntry.step.label" default="Step" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="step" name="step.id" from="${net.auken.dht.Step.list()}" optionKey="id" required="" value="${toolBoxEntryInstance?.step?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: toolBoxEntryInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="toolBoxEntry.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${net.auken.dht.CategoryType?.values()}" keys="${net.auken.dht.CategoryType.values()*.name()}" required="" value="${toolBoxEntryInstance?.type?.name()}"/>
</div>

