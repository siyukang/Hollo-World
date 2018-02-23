<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="/Ext/ext-all.js"></script>
    <link rel="stylesheet"  type="text/css" href="/Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->

    <script type="text/javascript">
        Ext.onReady(function () {
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                html: '<div style="padding:10px">这是表单内容</div>',
            });
            var win = new Ext.Window({
                title: '窗口',
                width: 500,
                height: 500,
                html:'<div style="padding-left: 20px">这里窗体内容</div>',
                model: true,
                resizable: true,
                maximizable: true,
                minimizable: true,
                items: form
            });
            win.show();
        });
    </script>

</head>
<body>
<%--36 说明：
37 (1)var form = new Ext.form.FormPanel({}):创建一个新的form表单对象。
38 (2)title: '表单标题'：表单的标题，如果不加的话，不会出现上面的浅色表单标题栏。
39 (3)style: 'margin:10px':表单的样式，加了个外10px的外边距。
40 (4)html: '<div style="padding:10px">这里表单内容</div>'：表单内显示html的内容。--%>
</body>
</html>