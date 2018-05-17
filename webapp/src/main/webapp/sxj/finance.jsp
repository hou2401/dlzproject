<%--
  Created by IntelliJ IDEA.
  User: 施晓军
  Date: 2018/5/10
  Time: 19:18
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
<table class="table" id="finance-table" border="1"></table>
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

    $(function(){
        $("#finance-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/financeController/queryFinance",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 数据条数选择框
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            search:true,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:false,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:3,//每页条数
            pageList:[4,6,8],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            columns: [{
                field: 'customernumber',
                title: '订单编号',
                idField:true,
                width: 100
            },{
                field: 'customername',
                title: '客户名称',
                idField:true,
                width: 100
            },{
                field: 'goodsname',
                title: '商品名称',
                width: 100
            },{
                field: 'goodsprice',
                title: '退款金额',
                width: 100
            },{
                field: 'customerphone',
                title: '客户电话',
                width: 100
            },{
                field: 'financedate',
                title: '申请退款时间',
                width: 100
            },{
                field: 'financestate',
                title: '退款状态',
                width: 100,
                formatter : function(value, row, index) {
                    if(value==0){
                        return "<input type='button' class='btn btn-primary' value='退款' onclick='tuihuo("+row.customernumber+","+row.financeid+","+row.goodsprice+")'>"
                    }
                    if(value==1){
                        return "<input type='button' class='btn btn-warning' value='已退款'>"
                    }
                }
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

    function tuihuo(customernumber,financeid,goodsprice){

        $.ajax({
            url:"<%=request.getContextPath()%>/financeController/updateOrderState",
            type:"post",
            data:{"customernumber":customernumber,"financeid":financeid,"goodsprice":goodsprice},
            dataType:"text",
            success:function (){
                $("#finance-table").bootstrapTable("refresh",{'pageNumber':1});
            }

        })
    }
</script>

</body>
</html>
