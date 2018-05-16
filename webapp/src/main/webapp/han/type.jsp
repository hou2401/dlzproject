<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/11
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Bootstrap 核心css -->

    <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap TreeView css -->

    <link href="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">



    <!-- Bootstrap addTabs css -->

    <link href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">



    <!-- Bootstrap table css -->

    <link href="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">

    <!-- bootstrap-datetimepicker css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- bootstrap-dialog css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">
    <!-- bootstrap-fileinput css -->
    <link href="<%=request.getContextPath() %>/js/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">


</head>

<body>
<script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<!-- bootstrap 核心js文件 -->
<script src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- bootStrap TreeView -->
<script src="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
<!-- bootStrap addTabs -->
<script src="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.js"></script>
<!-- bootStrap table -->
<script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.js"></script>
<!-- bootStrap table 语言包中文-->
<script src="<%=request.getContextPath() %>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
<!-- bootstrap-datetimepicker -->
<script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- bootstrap-dialog -->
<script src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<!-- bootstrap-fileinput -->
<script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>



<table class="table" id="type"></table>

<%-- ------------------------------------------普通查询--------------------------------------------- --%>
<script>

    $("#type").bootstrapTable({
        url:'<%=request.getContextPath()%>/goods/queryType',
        pagination: true,                   //是否显示分页（*）
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 3,                     //每页的记录行数（*）
        pageList: [3, 5, 8, 10],        //可供选择的每页的行数（*）
        search: true,                      //是否显示表格搜索
        showColumns: true,                  //是否显示所有的列（选择显示的列）
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        height:530,//高度
        undefinedText:"-",//有数据为空时 显示的内容
        striped:true,//斑马线
        paginationPreText:"上一页",//设置上一页显示的文本
        paginationNextText:"下一页",//设置下一页显示的文本
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns:[[
            {field:'typeid',title:'类型编号',width:100},
            {field:'typename',title:'类型名称',width:100},
            {field:'hsy', title:'操作', width:10,
                formatter:function(value,row,index){
                    return  '<button  class="btn btn-primary"  data-toggle="modal" data-target="#myModal1" onclick="updatype('+row.typeid+')">修改</button>' +
                        '<button type="button" class="btn btn-danger"  onclick="deltype('+row.typeid+')" >删除</button>';


                }}
        ]]
    });

</script>

<%-- ------------------------------------------删除--------------------------------------------- --%>
<script>

    function deltype(typeid){
        if(confirm("确认删除吗?")){
            $.ajax({
                url:"<%=request.getContextPath()%>/type/deleteType",
                type:"post",
                data:{"typeid":typeid},
                dataType:"text",
                success:function (){

                    $("#type").bootstrapTable('refresh');



                },
                error:function (){
                    alert("未删除");
                    $("#type").bootstrapTable('refresh');

                }
            })
        }
    }

</script>


<script>

    //-============================----修改-----=============================================================$
    function updatype(typeid){
        BootstrapDialog.show({
            title:"修改页面",//标题
            message:$("<div></div>").load("<%=request.getContextPath()%>/type/queryById?typeid="+typeid),//弹框内容
            type:BootstrapDialog.TYPE_WARNING,//弹框的类型
            closable: true,
            draggable : true,
            buttons:[
                {
                    label:"确定",
                    cssClass:"btn-success",
                    action:function(dialog){
                        var formData = new FormData(document.getElementById("upForm"));
                        $.ajax({
                            url:"<%=request.getContextPath()%>/type/updateType",
                            type:"post",
                            data:formData,
                            dataType:"text",
                            async:false,
                            cache: false,
                            contentType: false,
                            processData: false,
                            success:function(result){
                                if(result=="success"){
                                    alert("成功");
                                    dialog.close();
                                    $("#type").bootstrapTable("refresh");
                                }else{
                                    alert("修改失败")
                                    $("#type").bootstrapTable("refresh");
                                }
                            }

                        })
                    }
                }
            ]
        })



    }

</script>
</body>
</html>
