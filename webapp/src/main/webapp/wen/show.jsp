<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/9
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<button type="button" class="btn btn-success" id="adduser">新增账户</button>
<table id="user"></table>

<script>
    $("#adduser").click(function(){
        BootstrapDialog.show({
            type : BootstrapDialog.TYPE_SUCCESS,
            title : '新增 ',
            message : $("<div></div>").load("wen/adduser.jsp"),
            //size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
            buttons : [ {// 设置关闭按钮
                label : '关闭',
                action : function(dialogItself) {
                    dialogItself.close();
                },
            },{
                label : '保存',
                action : function(dialogItself) {
                    var formData = new FormData(document.getElementById("adduserform"));
                    $.ajax({
                        url:"<%=request.getContextPath()%>/wen/addUser",
                        type:"post",
                        data:formData,
                        dataType:"json",
                        async:false,
                        cache: false,
                        contentType: false,
                        processData: false,
                        success:function(data){
                            if(data.success=="success"){
                                alert("成功");
                                dialogItself.close();
                                $("#user").bootstrapTable("refresh");
                            }else{
                                alert("失败")
                            }
                        },
                        error:function(){
                            alert("新增失败")
                        }

                    })
                }
            }
            ]
        });
    })

    $("#user").bootstrapTable({
        url:'<%=request.getContextPath()%>/wen/queryuser',
        pagination: true,                   //是否显示分页（*）
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 3,                     //每页的记录行数（*）
        pageList: [1, 2, 4, 5],        //可供选择的每页的行数（*）
        search: true,                      //是否显示表格搜索
        showColumns: true,                  //是否显示所有的列（选择显示的列）
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        columns:[[
            {field:'uid',title:'用户编号',width:'5%' },
            {field:'user',title:'使用者',width:'5%' },
            {field:'uname',title:'用户名',width:'5%' },
            {field:'upass',title:'密码',width:'5%' },
            {field:'flag',title:'账号状态',width:'5%',formatter:function(value,row,index){
                if(value==1){
                    return "正常";
                }else{
                    return "锁定";
                }
            }},
            {field:'s',title:'操作 ',width:'10%',formatter:function(value,row,index){
                return "<input type='button'  value='锁定' onclick='javascript:upde(\""+row.uid+"\")'>";
            }}
        ]]
    });
    function upde(id){

        $.ajax({
            url:"<%=request.getContextPath()%>/wen/updateflag",
            type:"post",
            data:{"uid":id},
            dataType:"text",
            success:function(data){

                    alert("锁定成功！");
                    $("#user").bootstrapTable('refresh');



            },
            error:function () {
                alert("锁定失败！");
            }

        })
    }

</script>


</body>
</html>

