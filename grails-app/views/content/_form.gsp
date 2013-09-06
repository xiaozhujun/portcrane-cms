<%@ page import="portcrane.cms.Content" %>
<script type="text/javascript" charset="utf-8" src="${resource(dir: 'ueditor', file: 'ueditor.config.js')}"></script>
<script type="text/javascript" charset="utf-8" src="${resource(dir: 'ueditor', file: 'ueditor.parse.js')}"></script>
<script type="text/javascript" charset="utf-8" src="${resource(dir: 'ueditor', file: 'ueditor.all.js')}"></script>
<script type="text/javascript">
    UE.getEditor("editor",{
        maxImageSideLength:600,
        elementPathEnabled:false,
        initialFrameHeight:400,
        toolbars: [["fullscreen","source","undo","redo","insertunorderedlist",
            "insertorderedlist","unlink","link","cleardoc","selectall","print",
            "searchreplace","preview","|","pagebreak","insertimage",
            "date","time","horizontal",
            "spechars","blockquote","template",
            "bold","italic","underline","strikethrough","forecolor","backcolor",
            "superscript","subscript","justifyleft","justifycenter","justifyright",
            "justifyjustify","touppercase","tolowercase","directionalityltr",
            "directionalityrtl","indent","removeformat","formatmatch","autotypeset",
            "customstyle","paragraph","rowspacingbottom","rowspacingtop","lineheight",
            "fontfamily","fontsize","imagenone","imageleft","imageright","imagecenter",
            "inserttable","deletetable","mergeright","mergedown","splittorows",
            "splittocols","splittocells","mergecells","insertcol","insertrow",
            "deletecol","deleterow","insertparagraphbeforetable"]]

    });
</script>
<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'title', 'error')} ">
    <label for="title">
        <g:message code="content.title.label" default="Title" />

    </label>
    <g:textField name="title" value="${contentInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'parent', 'error')} required">
	<label for="parent">
		<g:message code="content.parent.label" default="Parent" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parent" name="parent.id" from="${portcrane.cms.Category.list()}" optionKey="id" required="" value="${contentInstance?.parent?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contentInstance, field: 'body', 'error')} ">
    <script id="editor" type="text/plain" name="body">
        ${contentInstance?.body}
    </script>
    %{--<g:textArea name="body" value="${contentInstance?.body}"/>--}%
</div>
