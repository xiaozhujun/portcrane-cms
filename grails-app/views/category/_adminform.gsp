<%@ page import="portcrane.cms.Category" %>


<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} ">
    <label for="name">
        <g:message code="category.name.label" default="Name" />

    </label>
    <g:textField name="name" value="${categoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'parent', 'error')} required">
    <label for="parent">
        <g:message code="category.parent.label" default="Parent" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="parent" name="parent.id" from="${portcrane.cms.Category.list()}" optionKey="id" required="" value="${categoryInstance?.parent?.id}" class="many-to-one"/>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        alert(${params.catid});
        $("#parent").trigger("select");
    });
</script>
