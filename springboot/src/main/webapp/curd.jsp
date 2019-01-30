<%--
  Created by IntelliJ IDEA.
  User: wangchenyu
  Date: 2019/1/25
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="jquery/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery/themes/icon.css">
    <script type="text/javascript" src="jquery/jquery.min.js"></script>
    <script type="text/javascript" src="jquery/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">

        $(function(){
            //异步请求加载列表数据
            $('#dg').datagrid({
                url:'http://localhost:8880/srm/search1',
                title:"list",
                rownumbers:true,
                fitColumns:true,
                toolbar:"#tbar",
                pagination:true,
                pageSize:10,
                pageList:[5,10,15,20],
                columns:[[
                    {field:'authorityId',checkbox:true},
                    {field:'userId',title:'user_id',width:40},
                    {field:'authorityTypeCode',title:'authority_type_code',width:80},
                    {field:'includeAllFlag',title:'include_all_flag',width:60},
                    {field:'objectVersionNumber',title:'object_version_number',width:100},
                    {field:'creationDate',title:'creation_date',width:120,templet:function(d){
                        return new Date(d.creationDate).toLocaleString();
                    }},
                    {field:'createdBy',title:'created_by',width:50},
                    {field:'lastUpdatedBy',title:'last_updated_by',width:80},
                    {field:'lastUpdateDate',title:'last_update_date',width:120},
                ]]
            });
            //新增
            $("#add_btn").click(function(){
                //打开对话框
                opendialog();
            })
            //修改
            $("#edit_btn").click(function(){
                var array=$("#dg").datagrid('getSelections');
                if($("#dg").datagrid('getSelections').length==0){
                    $.messager.alert('操作提示','请选择一条记录','info');
                }else if($("#dg").datagrid('getSelections').length>1){
                    $.messager.alert('操作提示','只能选择一条记录','info');
                }else{
                    //异步向表单回填数据
                    $("#edit-user-info-form").form("load","http://localhost:8880/srm/list?id="+array[0].authorityId);
                    //打开对话框
                    opendialog();
                }
            })

            //删除
            $("#delete_btn").click(function(){
                if($("#dg").datagrid('getSelections').length==0){
                    $.messager.alert('操作提示','请选择要删除的记录数','info');
                }else{
                    $.messager.confirm('操作提示', '您确定要删除吗？', function(r){
                        if (r){
                            var uids="";
                            var array=$("#dg").datagrid('getSelections');
                            for(var i in array){
                                uids +=array[i].authorityId+",";
                            }
                            $.post('http://localhost:8880/srm/delete',{"uids":uids},function(data){
                                if(data==1){
                                    $.messager.alert('操作提示','删除成功','info');
                                    $("#dg").datagrid('reload');
                                }else if(data=0){
                                    $.messager.alert('操作提示','删除失败','error');
                                }
                            })
                        }
                    });
                }
            });
        })
        //打开对话框
        function opendialog(){
            $("#edit-user-info-dialog").dialog({
                closed : false,
                modal:true,
                buttons:[{
                    text:'保存',
                    iconCls:'icon-save',
                    handler:function(){
                        $("#edit-user-info-form").form('submit',{
                            url:'http://localhost:8880/srm/save-or-update',
                            onSubmit:function(){
                                return $("#edit-user-info-form").form('validate');
                            },
                            success:function(flag){
                                //判断
                                if (flag==1) {
                                    $.messager.alert('操作提示','操作成功！','info');
                                    $("#edit-user-info-dialog").dialog({closed : true});
                                    $("#edit-user-info-form").form('clear');
                                    //重新加载
                                    $('#dg').datagrid('load');
                                } else if(flag=0){
                                    $.messager.alert('操作提示','操作失败！','error');
                                }
                            }
                        })
                    }},{
                    text:'关闭',
                    iconCls:'icon-cancel',
                    handler:function(){
                        $("#edit-user-info-dialog").dialog({closed : true});
                        $("#edit-user-info-form").form('clear');
                    }}]
            })
        }
    </script>
</head>
<body>

<div id="tbar">
    <a href="javaScript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-add'" id="add_btn">新增</a>
    <a href="javaScript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit'" id="edit_btn">修改</a>
    <a href="javaScript:void(0)" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove'" id="delete_btn">删除</a>
</div>

<table id="dg"></table>


<div id="edit-user-info-dialog" data-options="closed:true,closable:false"
     class="easyui-dialog" title="编辑信息"
     style="width: 400px; height: auto;">
    <form action="" id="edit-user-info-form" method="post">
        <input type="hidden" name="authorityId">
        <table class="formTable">
            <tr>
                <td class="tdleft">user_id</td>
                <td class="tdright">
                    <input class="easyui-numberbox" name="userId"
                           data-options="required:true" />
            </tr>
            <tr>
                <td class="tdleft">authority_type_code</td>
                <td class="tdright">
                    <input class="easyui-validatebox" name="authorityTypeCode"
                           data-options="required:true" />
            </tr>
            <tr>
                <td class="tdleft">include_all_flag</td>
                <td class="tdright">
                    <input class="easyui-numberbox" name="includeAllFlag"
                           data-options="required:true,max:1"/>
            </tr>
            <tr>
                <td class="tdleft">object_version_number</td>
                <td class="tdright">
                    <input class="easyui-numberbox" name="objectVersionNumber"
                           data-options="required:true" />
            </tr>
            <tr>
                <td class="tdleft">creation_date</td>
                <td class="tdright">
                    <input class="easyui-datebox" name="creationDate"
                           data-options="required:true" />
            </tr>
            <tr>
                <td class="tdleft">created_by</td>
                <td class="tdright">
                    <input class="easyui-numberbox" name="createdBy"
                           data-options="required:true" />
            </tr>
            <tr>
                <td class="tdleft">last_updated_by</td>
                <td class="tdright">
                    <input class="easyui-numberbox" name="lastUpdatedBy"
                           data-options="required:true" />
            </tr>
            <tr>
                <td class="tdleft">last_update_date</td>
                <td class="tdright">
                    <input class="easyui-datebox" name="lastUpdateDate"
                           data-options="required:true" />
            </tr>
        </table>
    </form>
</div>
</body>
</html>
