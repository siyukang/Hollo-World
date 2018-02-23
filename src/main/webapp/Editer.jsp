<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="/Ext/ext-all.js"></script>
    <script src="/Ext/src/locale/ext-lang-zh_CN.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->
    <!--添加KeEditor的引用开始-->
    <script src="/kindeditor/kindeditor.js" type="text/javascript"></script>
    <!--添加KeEditor的引用结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            //创建文本上传域
            var exteditor = new Ext.form.HtmlEditor({
                fieldLabel: '员工描述'
            });
            //整合KE编辑器
            var keeditor = new Ext.form.TextArea({
                id: 'keeditor',
                fieldLabel: '员工描述',
                width: 700,
                height: 200
            });

            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                items: [exteditor, keeditor],
                listeners: {
                    'render': function () {
                        KE.show({
                            id: 'keeditor',
                            imageUploadJson: '/App_Ashx/Upload.ashx'
                        });
                        setTimeout("KE.create('keeditor');", 1000);
                    }
                }
            });
            //窗体
            var win = new Ext.Window({
                title: '窗口',
                width: 900,
                height: 700,
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
(1) var exteditor = new Ext.form.HtmlEditor():创建一个新的html编辑器。
(2) var keeditor = new Ext.form.TextArea()：创建一个新的TextArea。
(3) listeners: {
                'render': function () {
                    KE.show({
                        id: 'keeditor',
                        imageUploadJson: '/App_Ashx/Upload.ashx'
                    });
                    setTimeout("KE.create('keeditor');", 1000);
                }
            }
监听表单的 render 事件，创建 KE Editor.(2)，(3)中的id 要统一，否则无法显示。
imageUploadJson: '/App_Ashx/Upload.ashx'，keeditor上传图片的后台执行文件
-->
</body>
</html>