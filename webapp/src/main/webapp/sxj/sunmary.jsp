<%--
  Created by IntelliJ IDEA.
  User: 施晓军
  Date: 2018/5/11
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- Bootstrap 插件 css -->
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

    <style type="text/css">
        .navbar{
            height: 60px;
            background: black;

        }
        .layout{
            padding-top: 60px;
            position: relative;

        }

    </style>
</head>
<body>
<table class="table" id="summary-table" border="1"></table>
<!--jQuery核心js  -->
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
<script type="text/javascript">
    function search(){
        $("#summary-table").bootstrapTable("refresh",{'pageNumber':1});
    }
    $(function(){
        $("#summary-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/financeController/querySunmary",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 数据条数选择框
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            search:true,//是否显示搜索框
            height:50,
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            columns: [{
                field: 'tradingvolume',
                title: '成交金额',
                idField:true,
                width: 100
            },{
                field: 'refundamount',
                title: '退款金额',
                idField:true,
                width: 100
            },{
                field: 'actualamount',
                title: '实际金额',
                width: 100
            },{
                field: 'financenewdate',
                title: '更新时间',
                width: 100
            }/*,{
                field: 'asd',
                title: '操作',
                width: 100,
                formatter : function(value, row, index) {
                    var element =
                        "<div class='btn-group'>"+
                        "<button type='button' class='btn btn-success dropdown-toggle btn-xs'"+
                        "data-toggle='dropdown'>"+
                        "操作 <span class='caret'></span>"+
                        "</button><ul class='dropdown-menu' role='menu'>"+
                        "<li><a href='javascript:queryOrderXq("+row.orderid+")'>详情</a></li>"+
                        "<li><a href='javascript:queryProductXq("+row.orderid+")'>产品详情</a></li>"+
                        "<li><a href='javascript:querySkXq("+row.orderid+")'>收款详情</a></li></ul></div>"
                    return element;
                }
            }*/]
        })
     })


</script>

</body>
</html>
