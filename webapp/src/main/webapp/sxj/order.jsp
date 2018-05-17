<%--
  Created by IntelliJ IDEA.
  User: 施晓军
  Date: 2018/5/9
  Time: 17:45
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
            text-align:center;

        }
        .layout{
            padding-top: 60px;
            position: relative;
            text-align:center;

        }

    </style>
</head>

<body>
<button class="btn btn-default" type="button" style="height:40px;width:120px;background:darkviolet;" onclick="ExcelOrder()">导出订单信息</button>
<table class="table" id="order-table" border="1"></table>

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
        $("#order-table").bootstrapTable("refresh",{'pageNumber':1});
    }
    $(function(){
        $("#order-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/orderController/queryOrder",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 数据条数选择框
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            pagination:true,//开启分页
            paginationLoop:false,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:4,//每页条数
            pageList:[4,6,8],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            search:true,//是否显示搜索框
            height:480,
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            columns: [{
                checkbox:true,
            },{
                field: 'customernumber',
                title: '订单编号',
                idField:true,
                width: 100
            },{
                field: 'paytime',
                title: '创建时间',
                width: 100
            },{
                field: 'customername',
                title: '买家信息',
                width: 100
            },{
                field: 'customerphone',
                title: '电话',
                width: 100
            },{
                field: 'customerdizhi',
                title: '收货地址',
                width: 100
            },{
                field: 'goodsname',
                title: '商品信息',
                width: 100
            },{
                field: 'goodstotalprice',
                title: '购买总价',
                width: 100
            },{
                field: 'paycount',
                title: '购买数量',
                width: 100
            },{
                field: 'goodsimage',
                title: '商品图片',
                width: 100,
                formatter : function(value, row, index) {
                     var path="";

                    var  path='<img src="'+value+'" width="70px">'

                    return path;

                }
            },{
                field: 'orderstate',
                title: '订单状态',
                width: 100,
                formatter : function(value, row, index) {
                    if(value==1){
                        return "<input type='button' class='btn btn-primary' value='未支付'>"
                    }
                    if(value==2){
                        return "<input type='button' class='btn btn-warning' value='已支付'>"
                    }
                    if(value==3){
                        return "<input type='button' class='btn btn-danger' value='退货'" +
                            "onclick='tuihuo(\""+row.customernumber+"\","+row.ordersubmitstate+")'>"
                    }
                    if(value==4){
                        return "<input type='button' class='btn btn-inverse' value='退货中'>"
                    }
                    if(value==5){
                        return "<input type='button' class='btn btn-success' value='退货成功'>"
                    }
                }
            },{
                field: 'ordersubmitstate',
                title: '提交状态',
                width: 100,
                formatter : function(value, row, index) {
                    if(value==0){
                        return "<input type='button' class='btn btn-warning' value='用户下单'>"
                    }
                    if(value==1){
                        return "<input type='button' class='btn btn-primary' value='提交财务' onclick='subjectmoney" +
                            "(\""+row.customernumber+"\","+row.goodstotalprice+","+row.orderstate+")'>"
                    }
                    if(value==2){
                        return "<input type='button' class='btn btn-warning' value='已提交'>"
                    }

                }
            },{
            field: 'ordermodificationtime',
                title: '修改时间',
                width: 100
        }]
        })
    })
    //Poi批量导出excel
    function ExcelOrder() {
        var rows = $("#order-table").bootstrapTable('getSelections');
        //获取被选中的所有数据的订单号
        var customernumber = "";
        for(var i=0; i<rows.length; i++){

            customernumber+=","+rows[i].customernumber;
            alert(customernumber)
        }
         location.href="<%=request.getContextPath()%>/orderController/exportExcel?customernumber="+customernumber.substring(1);
    }
    //订单退款
    function tuihuo(customernumber,ordersubmitstate){

        if(ordersubmitstate==2){
            $.ajax({
                url:"<%=request.getContextPath()%>/orderController/updateOrderState",
                type:"post",
                data:{"customernumber":customernumber},
                dataType:"text",
                success:function (){

                    $("#order-table").bootstrapTable('refresh');

                }
            })
        }else{
            alert("请提交财务")
        }

    }
     //提交财务 修改状态
    function subjectmoney(customernumber,goodstotalprice,orderstate) {

        $.ajax({
            url:"<%=request.getContextPath()%>/orderController/updateOrderSubmitState",
            type:"post",
            data:{"customernumber":customernumber,"goodstotalprice":goodstotalprice},
            dataType:"text",
            success:function (){

                $("#order-table").bootstrapTable('refresh');
            }
        })
    }
 </script>

</body>
</html>
