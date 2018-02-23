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
            //初始化标签中的Ext:Qtip属性。
            Ext.QuickTips.init();
            Ext.form.Field.prototype.msgTarget = 'side';

            //----------------------下拉列表开始----------------------//
            //创建市数据源
            var combocitystore = new Ext.data.Store({
                //设定读取的地址
                proxy: new Ext.data.HttpProxy({ url: '/App_Ashx/Demo/City.ashx' }),
                //设定读取的格式
                reader: new Ext.data.JsonReader({ root: 'data' },
                    [{ name: 'id' }, { name: 'name'}])
            });
            //创建区数据源
            var comboareastore = new Ext.data.Store({
                //设定读取的地址
                proxy: new Ext.data.HttpProxy({ url: '/App_Ashx/Demo/Area.ashx' }),
                reader: new Ext.data.JsonReader({ root: 'data' },
                    [{ name: 'id' }, { name: 'name'}])
            });
            //创建市Combobox
            var comboboxcity = new Ext.form.ComboBox({
                id: 'comboboxcity',
                fieldLabel: '市',
                width: 120,
                store: combocitystore,
                displayField: 'name',
                valueField: 'id',
                triggerAction: 'all',
                emptyText: '请选择...',
                allowBlank: false,
                blankText: '请选择市',
                editable: false,
                mode: 'local', //该属性和以下方法为了兼容ie8
                listeners: {
                    'render': function () {
                        combocitystore.load();
                    }
                }
            });

            //创建区Combobox
            var comboareacity = new Ext.form.ComboBox({
                fieldLabel: '区',
                width: 120,
                store: comboareastore,
                displayField: 'name',
                valueField: 'id',
                triggerAction: 'all',
                emptyText: '请选择...',
                allowBlank: false,
                blankText: '请选择区',
                editable: false
            });
            //联动的实现
            comboboxcity.on('select', function () {
                comboareastore.baseParams.id = comboboxcity.getValue();
                comboareacity.setValue('');
                comboareastore.load();
            })
            //----------------------下拉列表结束----------------------//
            //表单
            var form = new Ext.form.FormPanel({
                frame: true,
                title: '表单标题',
                style: 'margin:10px',
                items: [comboboxcity, comboareacity]
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
(1)var combocitystore = new Ext.data.Store():创建一个新的数据源。
(2)proxy: new Ext.data.HttpProxy({ url: '/App_Ashx/Demo/City.ashx' })：数据代理为http代理，地址为/App_Ashx/Demo/City.ashx。
(3)reader: new Ext.data.JsonReader({ root: 'data' },[{ name: 'id' }, { name: 'name'}]):读取json返回值根节点为data，对象列为id和name。
这里要结合client与service观察,我在service端的输出如下：{data:[{id:1,name:'北京'},{id:2,name:'上海'}]}
(4)comboboxcity.on('select', function () {}：市选择变化时触发事件。
(5)comboareastore.baseParams.id = comboboxcity.getValue()：注意，前面的comboareastore是区的数据源，
当市变化时，我们给区的数据源加上个向service端发送的参数。
(6)comboareacity.setValue('')：把区的下拉列表设置为空，由于非空验证，Ext会提示用户“请选择区”，这个地方也可以把加载出来的第一个区
显示在区的下拉列表中，具体请自行实现吧。
(7)comboareastore.load()：区的数据源重新加载。
-->



<%--
using System;
using System.Collections.Generic;
using System.Collections;
using System.IO;
using System.Web;
using System.Globalization;
using LitJson;

namespace HZYT.ExtJs.WebSite.App_Ashx
{
    /// <summary>
    /// Upload 的摘要说明
    /// </summary>
    public class Upload : IHttpHandler
    {
        //文件保存目录路径
        private string savePath = App_Code.Constant.UPLOADIMAGEPATH;
        //文件保存目录URL
        private string saveUrl = App_Code.Constant.UPLOADIMAGEPATH;
        //定义允许上传的文件扩展名
        private String fileTypes = "gif,jpg,jpeg,png,bmp";
        //最大文件大小
        private int maxSize = 1000000;

        private HttpContext context;

        public void ProcessRequest(HttpContext context)
        {
            this.context = context;

            HttpPostedFile imgFile = context.Request.Files["imgFile"];
            if (imgFile == null)
            {
                showError("请选择文件。");
            }

            String dirPath = context.Server.MapPath(savePath);
            if (!Directory.Exists(dirPath))
            {
                showError("上传目录不存在。");
            }

            String fileName = imgFile.FileName;
            String fileExt = Path.GetExtension(fileName).ToLower();
            ArrayList fileTypeList = ArrayList.Adapter(fileTypes.Split(','));

            if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
            {
                showError("上传文件大小超过限制。");
            }

            if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(fileTypes.Split(','), fileExt.Substring(1).ToLower()) == -1)
            {
                showError("上传文件扩展名是不允许的扩展名。");
            }

            String newFileName = DateTime.Now.ToString("yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;
            String filePath = dirPath + newFileName;

            imgFile.SaveAs(filePath);

            String fileUrl = saveUrl + newFileName;

            Hashtable hash = new Hashtable();
            hash["error"] = 0;
            hash["url"] = fileUrl;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(hash));
            context.Response.End();
        }

        private void showError(string message)
        {
            Hashtable hash = new Hashtable();
            hash["error"] = 1;
            hash["message"] = message;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(hash));
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}
--%>
</body>
</html>