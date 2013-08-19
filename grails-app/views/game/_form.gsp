<%@ page import="net.auken.dht.Game" %>



<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="game.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${gameInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gameInstance, field: 'steps', 'error')} ">
	<label for="steps">
		<g:message code="game.steps.label" default="Steps" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${gameInstance?.steps?}" var="s">
    <li><g:link controller="step" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="step" action="create" params="['game.id': gameInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'step.label', default: 'Step')])}</g:link>
</li>
</ul>

</div>

