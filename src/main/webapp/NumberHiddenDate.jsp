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

    <script type="text/javascript">
        Ext.onReady(function () {
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';
            var btnresetclick = function () {
                form.getForm().reset();
                Ext.Msg.alert("重置","你已经重置了登录")
            };
            var btnsubmitclick = function () {
                if (form.getForm().isValid()) {
                    Ext.MessageBox.alert("提交","你现在正在提交");
                };
            };
//            重置按钮input
            var btnreset = new Ext.Button({
                text: '重置',
                handler: btnresetclick
            });
//            提交按钮input
            var btnsubmit = new Ext.Button({
                text: '提交',
                handler: btnsubmitclick
            });
//            用户名input
            var txtusername = new Ext.form.TextField({
                width: 100,
                allowBlank: false,
                maxLength:8,
                maxLengthText: '用户名不能超过8位',
                blankText: '请输入用户名',
                fieldLabel: '用户名',
                name: 'username'
            });
//            密码input
            var txtpassword = new Ext.form.TextField({
                width:100,
                allowBlank: false,
                maxLength: 8,
                maxLengthText: '密码不能超过八位',
                name: 'password',
                inputType: 'password',
                fieldLabel: '密 码',
                blankText: '请输入用户名'
            });
            //----------------------数字字段开始----------------------//
            var numberfield = new Ext.form.NumberField({
                width: 100,
                decimalPrecision: 1,
                minValue: 0.01,
                maxValue: 200,
                unitText: ' cm',
                allowBlank: false,
                fieldLabel: '身 高',
                blankText: '请输入身高'
            });
            //----------------------数字字段结束----------------------//
            //----------------------隐藏字段开始----------------------//
            var hiddenfield = new Ext.form.Hidden({
                name: 'userid',
                value: '1'
            });
            //----------------------隐藏字段结束----------------------//
            //----------------------日期字段开始----------------------//
            var datefield = new Ext.form.DateField({
                fieldLabel: '出生日期',
                format:'Y-m-d',
                editable: false,
                allowBlank: false,
                blankText: '请选择日期'
            });
            //----------------------日期字段结束----------------------//
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                html: '<div style="padding: 10px">这里是表单标题内容</div>',
                items:[txtusername,txtpassword,numberfield,hiddenfield,datefield],
                buttons:[btnsubmit,btnreset]
            });
            var win = new Ext.Window({
                title: '窗口',
                width: 333,
                height: 444,
                html: '<div style="padding: 10px;">这里是窗口内容</div>',
                modal: true,
                resizable: true,
                closable: true,
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
<!--
说明：
(1)var numberfield = new Ext.form.NumberField():创建一个新的NumberField数字文本框对象。
(2)99行，decimalPrecision: 1：设置小数点后面的位数，当位数超过时系统会自动截断。
(3)100行，minValue: 0.01：设置数字文本框最小值。
(4)101行，maxValue: 200:设置最大值。
(5)102行，unitText: ' cm'：注意，这个属性并非 Extjs文本框自带的属性，因为我们要在“身高”的后面加上
          单位，所以在23行---43行对文本框进行了重写，重写时添加了属性"unitText"，并且在样式表中加了样式"x-form-unit"。
(6)var hiddenfield = new Ext.form.Hidden()：创建一个新的Hidden对象，隐藏字段用作参数占位符，
          一般用来保存一些不希望用户直接看到的参数，并发送到服务器，例如：用户ID等。
(7)109行，name: 'userid'：Hidden对象的名称，这个名称是在服务端接收值的名称。发送参数格式如下：userid:1。
(8)110行，value: '1'：发送的值。
(9)var datefield = new Ext.form.DateField()：创建一个新的Datefield日期对象,Extjs的日期为英文类型，
          所以要加入翻译成中文的js，代码第8行位置。
(10)116行，format: 'Y-m-d'：日期格式。
(11)117行，editable: false：设置为不可编辑。
-->
</body>
</html>
