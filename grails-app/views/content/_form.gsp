<%@ page import="portcrane.cms.Content" %>



<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="content.body.label" default="Body" />
		
	</label>
	<g:textField name="body" value="${contentInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="content.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${portcrane.cms.Category.list()}" optionKey="id" required="" value="${contentInstance?.parent?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="content.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${contentInstance?.title}"/>
</div>

