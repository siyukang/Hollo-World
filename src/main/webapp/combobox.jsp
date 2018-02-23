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
        .x-form-unit
        {
            height: 22px;
            line-height: 22px;
            padding-left: 2px;
            display: inline-block;
            display: inline;
        }
    </style>
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
            //----------------------下拉列表开始----------------------//
            //创建数据源[数组数据源]
            var combostore = new Ext.data.ArrayStore({
                fields: ['id', 'name'],
                data: [[1, '团员'], [2, '党员'], [3, '其他']]
            });
            //创建Combobox
            var combobox = new Ext.form.ComboBox({
                fieldLabel: '政治面貌',
                store: combostore,
                displayField: 'name',
                valueField: 'id',
                triggerAction: 'all',
                emptyText: '请选择...',
                allowBlank: false,
                blankText: '请选择政治面貌',
                editable: false,
                mode: 'local'
            });
            //Combobox获取值
            combobox.on('select', function () {
                alert(combobox.getValue());
            })
            //----------------------下拉列表结束----------------------//
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                html: '<div style="padding:10px">这里表单内容</div>',
                items: [txtusername, txtpassword, numberfield, hiddenfield, datefield, radiogroup,
                    checkboxgroup, combobox],
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
(1)var combostore = new Ext.data.ArrayStore():创建一个新的数组数据源。
(2)fields: ['id', 'name']：数据源包含两列，列名分别为'id','name'。
(3)data: [[1, '团员'], [2, '党员'], [3, '其他']]:数据源对应的数据，例：id:1,name:团员。
(4)var combobox = new Ext.form.ComboBox()：创建一个新的下拉列表。
(5)store: combostore:数据源为上面创建的数据源，这个属性是combobox的必需属性。
(6)displayField: 'name',valueField: 'id'：combobox对应数据源的显示列与值列，这两个属性也是必须的。
(7)mode: 'local'：指定数据源为本地数据源，如果是本地创建的数据源，该属性也是必须的，如果数据源来自于服务器，
    设置为'remote'表示数据源来自于服务器，关于服务器交互后面我们会讲解。
(8)triggerAction: 'all'：请设置为”all”,否则默认 为”query”的情况下，你选择某个值后，再此下拉时，只出现匹配选项，
    如果设为all的话，每次下拉均显示全部选项。
(9)editable: false:默认情况下，combobox的内容是可以编辑的，该属性设置为false，
    使下拉列表只能选择不能编辑。
(10)combobox.on('select', function () {alert(combobox.getValue());}):选择时alert出下拉列表的值。
-->
</body>
</html>