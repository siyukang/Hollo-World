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
            //------ContainerLayout开始------//
            var box1 = new Ext.BoxComponent({
                autoEl: {
                    tag: 'div',
                    style: 'background:red;width:300px;height:30px',
                    html: 'box1'
                }
            });
            var box2 = new Ext.BoxComponent({
                autoEl: {
                    tag: 'div',
                    style: 'background:yellow;width:300px;height:30px',
                    html: 'box2'
                }
            });
            var box3 = new Ext.BoxComponent({
                autoEl: {
                    tag: 'div',
                    style: 'background:blue;width:300px;height:30px;color:#fff',
                    html: 'box3'
                }
            });
            var containerlayout = new Ext.Container({
                layout: 'form',
                items: [box1, box2, box3],
                renderTo: 'ContainerLayout'
            });
            //------ContainerLayout结束-----//
            //------FormLayout开始------//
            var formlayout = new Ext.Panel({
                title: 'FormLayout',
                layout: 'form',
                items: [
                    new Ext.form.TextField({ fieldLabel: '用户名' }),
                    new Ext.form.TextField({ fieldLabel: '密码' }),
                    new Ext.form.TextField({ fieldLabel: '重复密码' })
                ],
                renderTo: 'FormLayout'
            });
            //------FormLayout结束------//
            //------ColumnLayout开始------//
            var ColumnLayout = new Ext.Panel({
                width: 600,
                title: 'ColumnLayout',
                layout: 'column',
                items: [
                    new Ext.form.FormPanel({ title: '第一列', columnWidth: .33, labelWidth: 50, items: [
                        new Ext.form.TextField({ fieldLabel: '用户名' })]
                    }),
                    new Ext.form.FormPanel({ title: '第二列', columnWidth: .33, labelWidth: 50, items: [
                        new Ext.form.TextField({ fieldLabel: '密码' })]
                    }),
                    new Ext.form.FormPanel({ title: '第三列', columnWidth: .34, labelWidth: 80, items: [
                        new Ext.form.TextField({ fieldLabel: '重复密码' })]
                    })
                ],
                renderTo: 'ColumnLayout'
            });
            //------ColumnLayout结束------//
            //------BorderLayout开始------//
            var BorderLayout = new Ext.Panel({
                title: 'BorderLayout',
                layout: 'border',
                width: 1100,
                height: 300,
                items: [
                    new Ext.Panel({ title: '上北', region: 'north', html: '可以放个logo什么的' }),
                    new Ext.Panel({ title: '下南', region: 'south', html: '版权信息？', autoEl: 'center' }),
                    new Ext.Panel({ title: '中间', region: 'center', html: '主面板' }),
                    new Ext.Panel({ title: '左东', region: 'west', html: '树型菜单或是手风琴' }),
                    new Ext.Panel({ title: '右西', region: 'east', html: '常用功能或是去掉？' })
                ],
                renderTo: 'BorderLayout'
            });
            //------BorderLayout结束------//
            //------AccordionLayout开始------//
            var AccordionLayout = new Ext.Panel({
                title: 'AccordionLayout',
                layout: 'accordion',
                height: 200,
                items: [
                    new Ext.Panel({ title: '用户管理', items: [new Ext.BoxComponent({ autoEl: { tag: 'div', html: '用户管理'} })] }),
                    new Ext.Panel({ title: '角色管理', items: [new Ext.BoxComponent({ autoEl: { tag: 'div', html: '角色管理'} })] }),
                    new Ext.Panel({ title: '系统管理', items: [new Ext.BoxComponent({ autoEl: { tag: 'div', html: '系统管理'} })] })
                ],
                renderTo: 'AccordionLayout'
            });
            //------AccordionLayout结束------//
            //------FitLayout结束------//
            var FitLayout = new Ext.Panel({
                title: 'FitLayout',
                height: 100,
                renderTo: 'FitLayout',
                layout: 'fit',
                items: [
                    new Ext.Panel({ bodyStyle: 'background:red', html: '使用了fit布局,填充满' }),
                    new Ext.Panel({ bodyStyle: 'background:yellow', html: '这个panel不会显示，因为是fit布局' })
                ]
            });
            var NoFitLayout = new Ext.Panel({
                title: 'NoFitLayout',
                height: 100,
                renderTo: 'FitLayout',
                items: [
                    new Ext.Panel({ bodyStyle: 'background:yellow', html: '未使用了fit布局,没有填充满' })
                ]
            });
            //------FitLayout结束------//
            //------TableLayout开始------//
            var TableLayout = new Ext.Panel({
                title: 'TableLayout',
                layout: 'table',
                layoutConfig: { columns: 3 },
                defaults: {
                    width: 133,
                    height: 100,
                    autoEl: 'center'
                },
                defaultType: 'panel',
                items: [
                    { html: '行1列1' },
                    { html: '行1列2' },
                    { html: '行[1,2]列3', rowspan: 2, height: 180 },
                    { html: '行2列[1,2]', colspan: 2, width: 266 }
                ],
                renderTo: 'TableLayout'
            });
            //------TableLayout结束------//
        });
    </script>
</head>
<body>
<div id="ContainerLayout" style="float: left; width: 300px">ContainerLayout：垂直方式放置</div>

<div id="FormLayout" style="float: left; width: 240px; padding-left: 10px;"></div>

<div id="ColumnLayout" style="float: left; width: 500px; padding-left: 10px;"></div>

<div id="BorderLayout" style="padding: 10px 0px; clear: both"></div>

<div id="AccordionLayout" style="width: 300px; float: left; height: 200px"></div>

<div id="FitLayout" style="width: 300px; float: left; height: 200px; padding-left: 10px;"></div>

<div id="TableLayout" style="width: 400px; float: left; padding-left: 10px;"></div>
</body>
</html>