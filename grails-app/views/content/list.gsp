
<%@ page import="portcrane.cms.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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

					</tr>
				</thead>
				<tbody>
				<g:each in="${contentInstanceList}" status="i" var="contentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: contentInstance, field: "title")}</td>

                        <td>${fieldValue(bean: contentInstance, field: "parent")}</td>

                        %{--<td><g:link action="show" id="${contentInstance.id}">${fieldValue(bean: contentInstance, field: "body")}</g:link></td>--}%
                        <td><g:link action="show" id="${contentInstance.id}">点击查看正文...</g:link></td>
					
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
