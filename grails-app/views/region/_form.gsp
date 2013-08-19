<%@ page import="net.auken.dht.Region" %>



<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="region.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${regionInstance?.name}"/>
</div>

