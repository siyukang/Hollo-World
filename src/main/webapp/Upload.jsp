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
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';
            //创建div组件
            var imagebox = new Ext.BoxComponent({
                autoEl: {
                    style: 'width:150px;height:150px;margin:0px auto;border:1px solid #ccc; text-align:center;padding-top:20px;margin-bottom:10px',
                    tag: 'div',
                    id: 'imageshow',
                    html: '暂无图片'
                }
            });
            //创建文本上传域
            var file = new Ext.form.TextField({
                name: 'imgFile',
                fieldLabel: '文件上传',
                inputType: 'file',
                allowBlank: false,
                blankText: '请浏览图片'
            });
            //提交按钮处理方法
            var btnsubmitclick = function () {
                if (form.getForm().isValid()) {
                    form.getForm().submit({
                        waitTitle: "请稍候",
                        waitMsg: '正在上传...',
                        success: function (form, action) {
                            Ext.MessageBox.alert("提示", "上传成功！");
                            document.getElementById('imageshow').innerHTML = '<img style="width:150px;height:150px" src="' + action.result.path + '"/>';
                        },
                        failure: function () {
                            Ext.MessageBox.alert("提示", "上传失败！");
                        }
                    });
                }
            }
            //重置按钮"点击时"处理方法
            var btnresetclick = function () {
                form.getForm().reset();
            }
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                fileUpload: true,
                url: '/App_Ashx/Demo/Upload.ashx',
                title: '表单标题',
                style: 'margin:10px',
                items: [imagebox, file],
                buttons: [{
                    text: '保存',
                    handler: btnsubmitclick
                }, {
                    text: '重置',
                    handler: btnresetclick
                }]
            });
            //窗体
            var win = new Ext.Window({
                title: '窗口',
                width: 476,
                height: 374,
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
(1)var imagebox = new Ext.BoxComponent():创建一个新的html标记。
    官方解释如下：
    This may then be added to a Container as a child item.
    To create a BoxComponent based around a HTML element to be created at render time, use the autoEl config option which takes the form of a DomHelper specification:
(2) autoEl: {style: '',tag: 'div',id: 'imageshow', html: '暂无图片'}定义这个html标记的属性，如 标记为：div，id是多少等。
    官方实例为：
    var myImage = new Ext.BoxComponent({
    autoEl: {
        tag: 'img',
        src: '/images/my-image.jpg'
        }
    });
(3)var file = new Ext.form.TextField()：创建一个新的文件上传域。
(4)name: 'imgFile':名称，重要，因为service端要根据这个名称接收图片。
(5)inputType: 'file'：表单类型为文件类型。
(6)waitTitle: "请稍候",waitMsg: '正在上传...',：上传等待过程中的提示信息。
(7)document.getElementById('imageshow').innerHTML = '<img style="width:150px;height:150px" src="' + action.result.path + '"/>';这个是原生态的js，把imageshow的值换成图片。
-->
</body>
</html>