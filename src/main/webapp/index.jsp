<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--ext框架搭建start-->
    <title>登录窗体</title>
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="Ext/ext-all.js"></script>
    <script type="text/javascript" src="/Ext/ext-base.js"></script>
    <link type="text/css" rel="stylesheet" href="Ext/resources/css/ext-all.css" />
    <!--ext框架搭建end-->

    <script type="text/javascript">
        Ext.onReady(function () {
            var checksource = new
            var panel = new Ext.Panel({
                title: '动态复选框',
                width: 200,
                height: 200,
                frame: true,
                items: [checksource]
            });
            var win = new Ext.Window({
                title: '窗口',
                width: 500,
                height: 400,
                modal: true,
                resizable: true,
                closable: true,
                minimizable: true,
                maximizable: true,
                items: [panel]
            });
            win.show();
        })
    </script>
</head>
<body>
    <input/>
</body>
</html>