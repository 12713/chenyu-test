<%--
  Created by IntelliJ IDEA.
  User: wangchenyu
  Date: 2019/1/25
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>springbootdemo</title>
    <link rel="stylesheet" type="text/css" href="jquery/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery/themes/icon.css">
    <script type="text/javascript" src="jquery/jquery.min.js"></script>
    <script type="text/javascript" src="jquery/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery/easyui-lang-zh_CN.js"></script>

    <style type="text/css">
        .top{
            background-image: url(${path}/img/top_bg.jpg);
        }
        .middle{
            height: 60px;
            line-height: 64px;
        }
    </style>

    <script type="text/javascript">
        function addTab(url,title) {
            //判断title的选修卡是否存在
            if(!$("#tt").tabs('exists',title)){
                //创建标题为"title"选项卡
                // 添加一个未选中状态的选项卡面板
                $('#tt').tabs('add',{
                    title: title,
                    selected: true,
                    closable:true,
                    content:"<iframe src ="+url+" width=98% height=90% frameborder='0' >"
                });
            }else{
                //选中
                $("#tt").tabs('select',title);
                //更新
                var tab = $('#tt').tabs('getSelected');  // 获取选择的面板
                $('#tt').tabs('update', {
                    tab: tab,
                    options: {
                        title: title,
                        selected: true,
                        closable:true,
                        content:"<iframe src ="+url+" width=98% height=90% frameborder='0' >"
                    }
                });

            }
        }

    </script>
</head>
<body class="easyui-layout">
<!-- 顶部 -->
<div data-options="region:'north',split:false" class="top" style="height:65px;">
</div>
<!-- 左边 -->
<div data-options="region:'west',title:'菜单栏',split:true"
     style="width: 200px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true" style="width:300px;height:200px;">
        <div title="系统管理" style="overflow:auto;padding:10px;">
                <a id="btn" href="JavaScript:void(0)" class="easyui-linkbutton"
                   data-options="plain:true" onclick="addTab('curd.jsp','增删改查demo')">
                    增删改查demo
                </a><br/>
        </div>
    </div>
</div>
<!-- 中间 -->
<div data-options="region:'center',title:'操作区域'">
    <div id="tt" class="easyui-tabs" data-options="fit:true">
    </div>
</div>
</body>
</html>
