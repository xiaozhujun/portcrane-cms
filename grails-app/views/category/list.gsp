
<%@ page import="portcrane.cms.Category" %>
<!DOCTYPE html>
<script type="text/javascript">
    $(document).ready(function(){
        $("#list-category a").click(function(){
            return preventGlink(this);
        });
    });
</script>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
        <meta name="title" content="test">
		<title><g:message code="default.list.label" args="[entityName]" /></title>
        <meta name="layout" content="backpage">
	</head>
	<body>
		<a href="#list-category" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-category" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'category.name.label', default: 'Name')}" />
					
						<th><g:message code="category.parent.label" default="Parent" /></th>
					    <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${categoryInstance.id}">${fieldValue(bean: categoryInstance, field: "name")}</g:link></td>
					    <g:if test="${categoryInstance.parent}">
                            <td>${categoryInstance.parent.name}</td>
					    </g:if>
                      <td>
                          <g:form>
                              <fieldset class="buttons">
                                  <g:hiddenField name="id" value="${categoryInstance?.id}" />
                                  <g:if test="${categoryInstance?.id!=0}">
                                      <g:link class="edit" action="edit" id="${categoryInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                                      <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                                  </g:if>
                              </fieldset>
                          </g:form>                      </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${categoryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
