
<%@ page import="portcrane.cms.Content" %>
<!DOCTYPE html>
<script type="text/javascript">
    $(document).ready(function(){
        $("#list-content a").click(function(){
            return preventGlink(this);
        });
    });
</script>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <meta name="layout" content="backpage">
	</head>
	<body>
		<a href="#list-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
                        <g:sortableColumn property="title" title="${message(code: 'content.title.label', default: 'Title')}" />

						<th><g:message code="content.parent.label" default="Parent" /></th>

                        <g:sortableColumn property="body" title="${message(code: 'content.body.label', default: 'Body')}" />
                       <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentInstanceList}" status="i" var="contentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: contentInstance, field: "title")}</td>

                        <td>${fieldValue(bean: contentInstance, field: "parent")}</td>

                        %{--<td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean: contentInstance, field: "body")}</g:link></td>--}%
                        <td><g:link action="show" id="${contentInstance.id}">点击查看正文...</g:link></td>
					       <td>
                               <g:form>
                                   <fieldset class="buttons">
                                       <g:hiddenField name="id" value="${contentInstance?.id}" />
                                       <g:link class="edit" action="edit" id="${contentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                       <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                   </fieldset>
                               </g:form>
					       </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
