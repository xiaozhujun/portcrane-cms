
<%@ page import="portcrane.cms.Content" %>
<!DOCTYPE html>
<script type="text/javascript">
    $(document).ready(function(){
        $("#show-content a").click(function(){
            return preventGlink(this);
        });
    });
</script>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>

	</head>
	<body>
		<a href="#show-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="show-content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list content">

                <g:if test="${contentInstance?.title}">
                    <li class="fieldcontain">
                        <span id="title-label" class="property-label"><g:message code="content.title.label" default="Title" /></span>

                        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${contentInstance}" field="title"/></span>

                    </li>
                </g:if>

				<g:if test="${contentInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="content.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="category" action="show" id="${contentInstance?.parent?.id}">${contentInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

                <g:if test="${contentInstance?.body}">
                    <li class="fieldcontain">
                        <span id="body-label" class="property-label"><g:message code="content.body.label" default="Body" /></span>

                        <span class="property-value" aria-labelledby="body-label">${contentInstance.body}</span>

                    </li>
                </g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contentInstance?.id}" />
					<g:link class="edit" action="adminedit" id="${contentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
