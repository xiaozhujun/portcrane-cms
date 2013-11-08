
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
        <g:if test="${contentInstance?.body}">
                <span class="frontcontentshow" aria-labelledby="body-label">${contentInstance.body}</span>
        </g:if>

</div>
</body>
</html>
