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
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';
            //用户名input
            var txtusername = new Ext.form.TextField({
                width: 140,
                allowBlank: false,
                maxLength: 20,
                name: 'username',
                fieldLabel: '用户名称',
                blankText: '请输入用户名',
                maxLengthText: '用户名不能超过20个字符'
            });
            var txtpassword = new Ext.form.TextField({
                width: 140,
                allowBlank: false,
                maxLength: 20,
                inputType: 'password',
                name: 'password',
                fieldLabel: '密码',
                blankText: '请输入密码',
                maxLengthText: '密码不能超过20个字符'
            });
            var form = new Ext.form.FormPanel({
                frame:true,
                title:'表单标题',
                style: 'margin:10px',
                html:'<div style="padding: 10px">这里是表单内容</div>',
                items:[txtusername,txtpassword]
            });
            var win = new Ext.Window({
                title:'窗口',
                width: 500,
                height: 500,
                html: '<div style="padding: 20px">这里是窗体内容</div>',
                model: true,
                reszable: true,
                maximizable: true,
                minimizable: true,
                items: form
            });
            win.show();
        });
    </script>

</head>
<body>
</body>
</html>