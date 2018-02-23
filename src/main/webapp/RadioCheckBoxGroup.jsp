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

        Ext.override(Ext.form.TextField, {
            unitText: '',
            onRender: function (ct, position) {
                Ext.form.TextField.superclass.onRender.call(this, ct, position);
                // 如果单位字符串已定义 则在后方增加单位对象
                if (this.unitText != '') {
                    this.unitEl = ct.createChild({
                        tag: 'div',
                        html: this.unitText
                    });
                    this.unitEl.addClass('x-form-unit');
                    // 增加单位名称的同时 按单位名称大小减少文本框的长度 初步考虑了中英文混排 未考虑为负的情况
                    this.width = this.width - (this.unitText.replace(/[^\x00-\xff]/g, "xx").length * 6 + 2);
                    // 同时修改错误提示图标的位置
                    this.alignErrorIcon = function () {
                        this.errorIcon.alignTo(this.unitEl, 'tl-tr', [2, 0]);
                    };
                }
            }
        });

        Ext.onReady(function () {
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            //提交按钮处理方法
            var btnsubmitclick = function () {
                Ext.MessageBox.alert('提示', '你点了确定按钮!');
            }
            //重置按钮"点击时"处理方法
            var btnresetclick = function () {
                Ext.MessageBox.alert('提示', '你点了重置按钮!');
            }
            //重置按钮"鼠标悬停"处理方法
            var btnresetmouseover = function () {
                Ext.MessageBox.alert('提示', '你鼠标悬停在重置按钮之上!');
            }
            //提交按钮
            var btnsubmit = new Ext.Button({
                text: '提交',
                handler: btnsubmitclick
            });
            //重置按钮
            var btnreset = new Ext.Button({
                text: '重置',
                listeners: {
                    'mouseover': btnresetmouseover,
                    'click': btnresetclick
                }
            });
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
            //密码input
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
            var numberfield = new Ext.form.NumberField({
                fieldLabel: '身高',
                width: 80,
                decimalPrecision: 1,
                minValue: 0.01,
                maxValue: 200,
                unitText: ' cm',
                allowBlank: false,
                blankText: '请输入身高'
            });

            var hiddenfield = new Ext.form.Hidden({
                name: 'userid',
                value: '1'
            });

            var datefield = new Ext.form.DateField({
                fieldLabel: '出生日期',
                format: 'Y-m-d',
                editable: false,
                allowBlank: false,
                blankText: '请选择日期'
            });
            //----------------------单选组开始----------------------//
            var radiogroup = new Ext.form.RadioGroup({
                fieldLabel: '性别',
                width: 100,
                items: [{
                    name: 'sex',
                    inputValue: '0',
                    boxLabel: '男',
                    checked: true
                }, {
                    name: 'sex',
                    inputValue: '1',
                    boxLabel: '女'
                }]
            });
            //获取单选组的值
            radiogroup.on('change', function (rdgroup, checked) {
                alert(checked.getRawValue());
            });
            //----------------------单选组结束----------------------//
            //----------------------复选组开始----------------------//
            var checkboxgroup = new Ext.form.CheckboxGroup({
                fieldLabel: '兴趣爱好',
                width: 170,
                items: [{
                    boxLabel: '看书',
                    inputValue: '0'
                }, {
                    boxLabel: '上网',
                    inputValue: '1'
                }, {
                    boxLabel: '听音乐',
                    inputValue: '2'
                }]
            });
            //获取复选组的值
            checkboxgroup.on('change', function (cbgroup, checked) {
                for (var i = 0; i < checked.length; i++) {
                    alert(checked[i].getRawValue());
                }
            });
            //----------------------复选组结束----------------------//
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                html: '<div style="padding:10px">这里表单内容</div>',
                items: [txtusername, txtpassword, numberfield, hiddenfield, datefield, radiogroup, checkboxgroup],
                buttons: [btnsubmit, btnreset]
            });
            //窗体
            var win = new Ext.Window({
                title: '窗口',
                width: 476,
                height: 374,
                html: '<div>这里是窗体内容</div>',
                resizable: true,
                modal: true,
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
(1)var radiogroup = new Ext.form.RadioGroup():创建一个新的单选按钮组。
(2)name: 'sex'：单选按钮组是按照 name 属性来区分的，同一组中的单选按钮才能单选，
    如果name属性设置错误，该按钮将会被认为是其他组。
(3)inputValue: '0'：选择框的值。
(4)boxLabel: '男':选择框后面的文字说明。
(5)checked.getRawValue()：获取选择框的选中值，由于单选框只有一个选中值，可以直接获取，
    而复选框可以多选，所以要循环取出。
-->
</body>
</html>