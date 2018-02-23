<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--ext框架搭建start-->
    <title>按钮</title>
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="Ext/ext-all.js"></script>
    <link type="text/css" rel="stylesheet" href="Ext/resources/css/ext-all.css" />
    <!--ext框架搭建end-->
    <script type="text/javascript">
        Ext.onReady(function () {
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            var btnsubmitclick = function () {
                Ext.MessageBox.alert('提示','你点了确定提交按钮');
            }
            var btnresetclick = function () {
                Ext.MessageBox.alert('提示','你点了重置按钮');
            }
            var btnresetmouseover = function () {
                Ext.MessageBox.alert('提示','你在重置按钮的上方悬置');
            }
            var btnsubmit = new Ext.Button({
                text:'提交',
                handler:btnsubmitclick
            });
            var btnreset = new Ext.Button({
                text: '重置',
                listeners:{'mouseover': btnresetmouseover,'click':btnresetclick}
            });
            var txtusername = new Ext.form.TextField({
                width: 100,
                allowBlank: false,
                name: 'username',
                fieldLabel: '用户名称',
                blankText: '请输入用户名',
                maxLength: 16,
                maxLengthText: '用户名不得超过16位'
            });
            var txtpassword = new Ext.form.TextField({
                width:100,
                allowBlank: false,
                name: 'password',
                inputType: 'password',
                fieldLabel: '密码',
                blankText: '请输入密码',
                maxLength: 16,
                maxLengthText: '密码的长度不得超过16位'

            });
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '登录表单',
                style: 'margin:10px',
                html: '<div style="padding: 10px">这是表单内容</div>',
                items: [txtusername,txtpassword],
                buttons: [btnsubmit,btnreset]
            });
            var win = new Ext.Window({
                title:'窗口',
                width:500,
                height:500,
                html:'<div style="padding: 10px">这是窗体的内容</div>',
                modal: true,
                closable: true,
                resizable: true,
                maximizable: true,
                minimizable: true,
                buttonAlign: 'center',
                items: form
            });
            win.show();
        });
    </script>
</head>
<body>

</body>
</html>
