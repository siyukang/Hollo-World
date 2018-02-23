<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
    <!--ext框架搭建start-->
    <title>按钮</title>
    <script type="text/javascript" src="/Ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="Ext/ext-all.js"></script>
    <link type="text/css" rel="stylesheet" href="Ext/resources/css/ext-all.css" />
    <!--ext框架搭建end-->
    <script type="text/javascript">
        Ext.onReady(function () {
            var win = new Ext.Window({
                title: 'window',
                width: 500,
                height: 500,
                html: '&lt;div>这里是窗体内容&lt;/div>',
                resizable: true,
                modal: true,
                closable: true,
                maximizable: true,
                minimizable: true
            });
            win.show();
        })
    </script>
</head>
<body>
<%--3.window 组件常用的：属性、方法及事件

一、属性
plain：布尔类型，true表示强制与背景色保持协调，默认值为false。
resizable：布尔类型，用户是否可以调整窗体大小，默认值为true表示可以调整大小。
maxinizable：布尔类型，true表示显示最大化按钮，默认值为false。
maximized：布尔类型，true表示显示窗体时将窗体最大化，默认值为false。
closable：布尔类型，true表示显示关闭按钮，默认值为true。
bodyStyle：与边框的间距，如：bodyStyle:"padding:3px"。
buttonAlign：窗体中button的对齐方式(left、center、right)，默认值为right。
closeAction："close"释放窗体所占内存，"hide"隐藏窗体，建议使用"hide"。

二、方法
show：打开窗体。
hide：隐藏窗体。
close：关闭窗体。

三、事件
show：打开窗体时触法。
hide：隐藏窗体时触法。
close：关闭窗体时触法
说明：
30 (1)var win = new Ext.Window({}):创建一个新的Window窗体对象。
31 (2)title: '窗口'：窗体的标题。
32 (3)width: 476,height: 374：宽度及高度。
33 (4)html: '<div>这里是窗体内容</div>'：窗体内部显示的html内容。
34 (5)resizable: true：是否可以调整窗体的大小，这里设置为 true。
35 (6)modal: true：是否为模态窗体[什么是模态窗体？当你打开这个窗体以后，如果不能对其他的窗体进行操作，那么这个窗体就是模态窗体，否则为非模态窗体]。
36 (7)closable:true：是否可以关闭，也可以理解为是否显示关闭按钮。
37 (8)maximizable: true：是否可以最大化，也可以理解为是否显示最大化按钮。
38 (9)minimizable: true：是否可以最小化，也可以理解为是否显示最小化按钮。
39 (10)win.show()：窗体展示。
40 -->
--%>
</body>
</html>
