<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="/Ext/ext-all.js"></script>
    <link rel="stylesheet" type="text/css" href="/Ext/resources/css/ext-all.css" />
    <style type="text/css">
        .nodeicon
        {
            background-image: url(image/user.gif) !important;
        }
    </style>
    <!--ExtJs框架结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            //树的节点数据源
            var node = {
                text: '根',
                expanded: true,
                leaf: false,
                children: [
                    { text: '根下节点一[user图标]', leaf: true, iconCls: 'nodeicon' },
                    { text: '根下节点二', leaf: true },
                    { text: '根下节点三', leaf: false, children: [
                        { text: '节点三子节点一', leaf: true },
                        { text: '节点三子节点二', leaf: false, expanded: true, children: [
                            { text: '节点三子节点二节点一', leaf: true },
                            { text: '节点三子节点二节点二', leaf: true }
                        ]
                        }
                    ]
                    }
                ]
            };
            //树面板(本地数据源)
            var treelocal = new Ext.tree.TreePanel({
                title: 'TreePanelLocal',
                //rootVisible: false,
                root: node
            });
            //树面板(服务器数据源)
            var treeservice = new Ext.tree.TreePanel({
                title: 'TreePanelService',
                root: { text: '根', expanded: true },
                //rootVisible: false,
                loader: new Ext.tree.TreeLoader({
                    url: '/App_Ashx/Demo/Tree.ashx'
                })
            });
            //单表
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                items: [treelocal, treeservice],
                buttons: [{
                    text: '获取选中项',
                    handler: function () {
                        selectNode = treelocal.getSelectionModel().getSelectedNode();
                        alert('TreePanelLocal：' + (selectNode == null ? treelocal.root.text : selectNode.text));
                    }
                }]
            });
            //窗体
            var win = new Ext.Window({
                title: '窗口',
                width: 476,
                height: 574,
                resizable: true,
                modal: true,
                closable: true,
                maximizable: true,
                minimizable: true,
                items: form
            });
            win.show();
        });
    </script>
</head>
<body>
<!--
说明：
(1)var tree = new Ext.tree.TreePanel():创建一个新的TreePanel表单对象。
(2)root: node：根节点。
(3)expanded: true:是否展开子节点，默认为false，如“根下节点三”。
(4)leaf: true：是否为叶子节点，这个要注意下，如果设置为false但没有 children 那么会产生一直读取子节点的展示。
(5)//rootVisible: false：有时候我们不想显示根节点，可以通过rootVisible设置他的可见性。在本例中我没有隐藏根。
(6)loader: new Ext.tree.TreeLoader({
                url: '/App_Ashx/Demo/Tree.ashx'
            })
树的数据载入组件，通过url寻找service端返回的json,并且自动转换成 TreeNode。
(7)iconCls: 'nodeicon'：ExtJs自带的图标显示为“文件夹”或是“列表”，通过 iconCls 可以列换树型菜单的图标。
(8)selectNode = treelocal.getSelectionModel().getSelectedNode()：获取选中项。
-->
</body>
</html>