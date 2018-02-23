<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <!--ExtJs框架开始-->
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="/Ext/ext-all.js"></script>
    <link rel="stylesheet" type="text/css" href="/Ext/resources/css/ext-all.css" />
    <!--ExtJs框架结束-->
    <script type="text/javascript">
        Ext.onReady(function () {
            //创建panel
            var panel = new Ext.Panel({
                title: 'Ajax与数据显示',
                width: 200,
                height: 200,
                frame: true
            });
            //创建数据显示模板
            var template = new Ext.XTemplate(
                '<table  id="template">',
                '<tr><td>编号:</td><td>{id}</td></tr>',
                '<tr><td>姓名:</td><td>{name}</td></tr>',
                '<tr><td>生日:</td><td>{brithday}</td></tr>',
                '<tr><td>身高:</td><td>{height}</td></tr>',
                '<tr><td>性别:</td><td>{sex}</td></tr>',
                '<tr><td valign="top">描述:</td><td>{discribe}</td></tr>',
                '</table>'
            );
            //获取数据
            Ext.Ajax.request({
                url: '/App_Ashx/Demo/Ajax.ashx',
                method: 'post',
                params: { id: 1 },
                success: function (response, options) {
                    for (i in options) {
                        alert('options参数名称:' + i);
                        alert('options参数[' + i + ']的值：' + options[i]);
                    }
                    var responseJson = Ext.util.JSON.decode(response.responseText);
                    template.compile();
                    template.overwrite(panel.body, responseJson);
                },
                failure: function () {
                    alert('系统出错，请联系管理人员！');
                }
            });
            //创建窗体
            var win = new Ext.Window({
                title: '窗口',
                id: 'window',
                width: 476,
                height: 374,
                resizable: true,
                modal: true,
                closable: true,
                maximizable: true,
                minimizable: true,
                items: [panel]
            });
            win.show();
        });
    </script>
</head>
<body>
<!--
说明：
(1)var template = new Ext.XTemplate():创建模板对象，常用于数据显示，也就是我们在开发中提到的“内容页或详细页”。
(2)'<tr><td>编号:</td><td>{id}</td></tr>':中间的{id}占位符要和我们在后台输出 json 对象对应。
(3)Ext.Ajax.request()：创建一个AJAX请求.
(4)url: '/App_Ashx/Demo/Ajax.ashx'：请求地址。method: 'post'，提交方式，params: { id: 1 }参数，我们在做内容页时，经常会这样使用“根据编号取出详细信息”，这个参数在本例中并没有实际意义，在这里只显示用法。
(5)success: function (response, options) {}成功时执行方法。
这里有两个参数.
response：服务端返回的数据，通过response.responseText来获得XMLHttpRequest的数据，并通过Ext.util.JSON.decode方法把字符串转换成json对象。
options：向服务端发送的对象。
我们在开发中，经常会遇到这样的问题，就是不知道参数是做什么用的，传的是什么，当我们 alert(parm)的时候，弹出的是[Object]或是[Object][Object]。
那么我们怎么样知道他到底传的是什么呢？我在上页的代码中写了这样的程序：
 for (i in options) {
                    alert('options参数名称:' + i);
                    alert('options参数[' + i + ']的值：' + options[i]);
 }
 对象我们不知道的对象 options 我们用 for 语句进行遍历，看看对象里存的是什么，这样就可以判断对象是什么了。
 for(){}：不知属性个数时,用于对某个对象的所以属性进行循环操作,返回字符串形式的属性名，获取属性值方式。
 那如果，我们的子对象还是 Object 怎么办？
 for (i in options) {
    alert('options参数名称:' + i);
    alert('options参数[' + i + ']的值：' + options[i]);
    //方式一，判断子对象类型，如果是object则继续遍历子对象
    if (typeof (options[i]) == 'object') {
        for (j in options[i]) {
            alert('子对象名称：' + j);
            alert('子对象值：' + options[i][j]);
        }
    }
    //方式二，options[i].toSource()，查看对象源码。
    //语法：object.toSource() 注：该方法在 Internet Explorer 中无效。
 }
(6)template.compile();编译模板。
(7)template.overwrite(panel.body, responseJson)：把数据填充到模板中。
-->
</body>
</html>