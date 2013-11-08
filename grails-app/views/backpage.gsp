<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="layout" content="backpage">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'css',file:'head.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'menu.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'simpleTree.css')}" type="text/css">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.7.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'simpleTree.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'preventGlink.js')}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $.ajax({
                url: "/portcrane-cms/category/get",
                success: function(data){
                    $(data).appendTo($("#status")).attr("id","tree");
                    simpleTree($("#tree"));
                    $(".bullet").click(function(){
                        $("#templatebody").load($(this).attr("url"));
                    });
                }
            });
            $(".nav a").click(function(){
                return preventGlink(this);
            });
            $("#init1").load("/portcrane-cms/category");
//                $("#init2").load("/portcrane-cms/content");
            $(".message").click(function(){
                $(this).remove();
            });
        });
    </script>
</head>
<body>
<div class="nav" role="navigation">
     <div class="title">效果预览</div>
</div>
<div id="status" role="complementary">
    <div class="templatebody" id="templatebody"></div>
</div>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>

</g:if>
<div id="body">

    %{--<div id="init1"></div>
    <div id="init2"></div>--}%
</div>
<div class="footer" role="contentinfo">

</div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"/></div>
</body>
</html>
