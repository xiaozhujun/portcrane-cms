<%@ page import="org.codehaus.groovy.grails.commons.GrailsClassUtils" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户管理-<g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'menu.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'css',file:'head.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'css',file:'standard1.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'css',file:'mymenu.css')}" type="text/css">
    <script type="text/javascript" src='${resource(dir: 'js',file: 'jquery-1.4.2.js')}'></script>
    <g:layoutHead/>
    <r:layoutResources />
    <script>
        $(document).ready(function(){
            $(".deviceCount").click(function(){
                $("#mainContainer").load("../deviceCount.jsp");
            })
        })
    </script>
</head>
<body>
<div id="wrapper">
    <div id='titleContainerDiv'>
        <div id="titleDiv">港口起重机内容管理系统<span id="devNameDiv"><g:link action="frontshow" controller="category">进入前台</g:link></span></div>
    </div>
    <div id='mainHeadDiv'>
        <div id='headTab' class='tabs'>
            <div class='tabItem' url="integrateManagement.html">港机信息可视化</div>
            <div class='tabItem mainselected' onclick="location.href='/inspect'">港机智能点检</div>
            <div class='tabItem'>港机润滑管理</div>
            <div class='tabItem' onclick="location.href='/main.html?devName=门机#01'">机构健康监测</div>
            <div class='tabItem ' url="structForcast/health-forecast.html">结构健康监测</div>
            <div class='tabItem' url="electricalForcast/health-forecast.html">电气健康监测</div>
            <div class='tabItem' onclick="location.href='/riskreport/'">健康诊断预报</div>
            <div class='tabItem' url="risk-management.html">动态风险评估</div>
        </div>
    </div>
    <div id="container">
        <div id="menuContainer">
            <div class="menuFunc">
                <div class="menuFuncName"><p>栏目管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link class="create" controller="category" action="create">创建栏目</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link class="list" controller="category" action="list">栏目列表</g:link></span></div>
                </div>
                <div class="menuFuncName"><p>内容管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link class="create" controller="content" action="create">创建内容</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link class="list" controller="content" action="list">内容列表</g:link></span></div>
                </div>
            </div>
        </div>
        <div id="mainContainer"><g:layoutBody/></div>
    </div>
</div>
</body>
</html>
