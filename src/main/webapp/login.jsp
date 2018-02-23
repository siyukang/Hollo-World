<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--ext框架搭建start-->
    <title>登录窗体</title>
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="Ext/ext-all.js"></script>
    <link type="text/css" rel="stylesheet" href="Ext/resources/css/ext-all.css" />
    <!--ext框架搭建end-->

    <style type="text/css">
        .loginicon
        {
            background-image: url(image/login.gif) !important;
        }
    </style>
    <script type="text/javascript">
        Ext.onReady(function () {
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            var btnsubmitclick = function () {
                if (form.getForm().isValid()) {
                    Ext.Msg.alert('提示','你现在正在登录');
                }
            }
            var btnresetclick = function () {
                form.getForm().reset();
            };
            var btnsubmit = new Ext.Button({
                text: '提交',
                handler: btnsubmitclick
            });
            var btnreset = new Ext.Button({
                text: '重置',
                handler:btnresetclick
            });
            var txtusername = new Ext.form.TextField({
                width:100,
                name:'username',
                allowBlank: false,
                fieldLabel:'用户名',
                blankText:'请输入用户名',
                maxLength:16,
                maxLengthText: '输入的用户名不得超过16位'
            });
            var txtpassword = new Ext.form.TextField({
                width: 100,
                allowBlank: false,
                inputType: 'password',
                name: 'password',
                fieldLabel: '密 码',
                blankText: '请输入密码',
                maxLength: 16,
                maxLengthText: '密码不得超过16位'
            });
            var txtcheckcode = new Ext.form.TextField({
                id: 'checkcode',
                allowBlank: false,
                width: 100,
                fieldLabel: '验证码',
                blankText: '请输入验证码',
                maxLength: 4,
                maxLengthText: '验证码不得超过4位'
            });
            var form = new Ext.form.FormPanel({
                url:'>>>>>>>>>>>>>跳转的页面',
                labelAlign: 'right',
                labelWidth: 45,
                frame: true,
                cls: 'loginform',
                buttonAlign: 'center',
                bodyStyle: 'padding:6px,0px,0px,15px',
                items:[txtusername,txtpassword,txtcheckcode],
                buttons:[btnsubmit,btnreset]
            });
            var win = new Ext.Window({
                title: '窗体',
                iconCls: 'loginicon',
                width: 333,
                height: 333,
                resizable: false,
                shadow: true,
                modal: true,
                closable: false,
                animCollapse: true,
                items: form
            });
            win.show();
            var  checkcode = new Ext.getDom('checkcode');
            var checkimage = new Ext.get(checkcode.parentNode);
            checkimage.createChild({
                tag: 'img',
                src: 'image/checkcode.gif',
                align: 'absbottom',
                style: 'padding-left:23px;cursor:pointer;'
            });
        });
    </script>
</head>
<body>

</body>
</html>
