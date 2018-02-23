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
    <script type="text/javascript">
        Ext.onReady(function () {
            //数据源
            var jsonstore = new Ext.data.JsonStore({
                data: [
                    { id: 1, name: '张三', sex: '0', birthday: '2001/01/01' },
                    { id: 2, name: '李四', sex: '1', birthday: '2002/01/01' },
                    { id: 3, name: '王五', sex: '0', birthday: '2003/01/01' }
                ],
                fields: ['id', 'name', 'sex', { name: 'birthday', type: 'date', dateformat: 'Y/m/d'}]
            });
            //复选框列
            var sm = new Ext.grid.CheckboxSelectionModel();
            //渲染性别
            var sexrender = function (value, metaData, record, rowIndex, cloIndex, store) {
                if (value == '0') {
                    metaData.attr = 'style="font-weight:bold";'
                    return '男';
                }
                else
                    return '女';
            }
            //定义列
            var column = new Ext.grid.ColumnModel({
                columns: [
                    sm,
                    { header: '编号', dataIndex: 'id', sortable: true },
                    { header: '姓名', dataIndex: 'name' },
                    { header: '性别', dataIndex: 'sex', renderer: sexrender },
                    { header: '出生日期', dataIndex: 'birthday', renderer: Ext.util.Format.dateRenderer('Y-m-d') }
                ]
            });
            //添加按钮
            var tbtn = new Ext.Toolbar.Button({
                text: '查看选中项',
                listeners: {
                    'click': function () {
                        var row = grid.getSelectionModel().getSelections();
                        for (var i = 0; i < row.length; i++) {
                            alert(row[i].get('id'));
                        }
                    }
                }
            });
            //分页控件
            var pager = new Ext.PagingToolbar({
                pageSize: 2,
                store: jsonstore,
                listeners: {
                    "beforechange": function (bbar, params) {
                        var grid = bbar.ownerCt;
                        var store = grid.getStore();
                        var start = params.start;
                        var limit = params.limit;
                        alert(store.getCount());
                        return false;
                    }
                }
            });
            //列表
            var grid = new Ext.grid.GridPanel({
                sm: sm,
                title: 'GridPanel',
                height: 200,
                store: jsonstore,
                tbar: [tbtn],
                bbar: pager,
                colModel: column
            });
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                fileUpload: true,
                url: '/App_Ashx/Demo/Upload.ashx',
                title: '表单标题',
                style: 'margin:10px',
                items: [grid]
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
(1)var jsonstore = new Ext.data.JsonStore():创建一个新的数据源。
data: 数据项，如数据库中的存储一样
id   name   sex  brithday
1    张三   0    2001-01-01
2    李四   1    2002-01-01
3    王五   0    2003-01-01
fields: 列的定义,指出数据源应该有几列，每列的名称和数据类型等信息，如上所示，说明存在4列，列名分别为：id,name,sex,brithday。
(2) var sm = new Ext.grid.CheckboxSelectionModel()：创建一个复选框的列。
注意 sm 要在两个地方使用，一、要告诉列模型，上例的36行。二、要告诉列表，上例的72行。缺一不可。
(3)var column = new Ext.grid.ColumnModel():grid的列，这个是定义gird应该有几列。
如上所示：第一列为：sm[复选框]，第二列为：{ header: '编号', dataIndex: 'id', sortable: true }，header：显示在gird上面的标题，dataIndex：'id'对应数据源的映射关系，意思就是说，表头显示叫"编号"，而实际的数据对应的是数据源的id这一列。
{ header: '性别', dataIndex: 'sex', renderer: sexrender }：renderer渲染列，执行的方法为 sexrender
 var sexrender = function (value, metaData, record, rowIndex, cloIndex, store) {
            if (value == '0'){
                    metaData.attr = 'style="font-weight:bold";'
                    return '男';
                }
            else
                return '女';
 }
 参数说明：
 value:当前单元格的值。
 meetaData:设置元素<div>男</div>的样式表与属性值，如上所示：我加了个加粗显示的样式。这个参数包含两个属性：metaData.css与metaData.attr
 record：当前Record对象引用。
 rowIndex:当前单元格行的索引。
 colIndex:当前单元格列的索引。
 store:store的引用。
 我们最常用的就是 value，平时写的时候大多数只传value，例如： var sexrender = function(value){处理方法}
(4)var tbtn = new Ext.Toolbar.Button()：创建一个工具栏按钮，tbar可以添加多个按钮，处理不同的方法，如"添加","删除","修改"等。
(5)var row = grid.getSelectionModel().getSelections():获取选中项的行，row[i].get('id')获取行中的某一列。
(6)var grid = new Ext.grid.GridPanel()：声明一个新的gird。
            sm: sm,//选择列
            store: jsonstore,//数据源
            tbar: [tbtn],//顶部的按钮
            bbar: pager,//底部的分页
            colModel: column//列表头与列
(7)var pager = new Ext.PagingToolbar()：创建一个新的分页控件
            pageSize: 2,//页码大小为2
            store: jsonstore,分页的数据源
            listeners: {//由于没有链接后台数据库动态绑定数据库，这里在，点下一页时‘beforechange’事件做了个 return false
                "beforechange": function (bbar, params) {
                    var grid = bbar.ownerCt;
                    var store = grid.getStore();
                    var start = params.start;//起始数据的索引号
                    var limit = params.limit;//每页的大小
                    console.log("==下面是打印信息")
                    console.log(store.getCount());
                    console.log(start);
                    console.log(limit);
                    console.log("==打印结束。")
                    return false;
                }
            }
        });
-->
</body>
</html>