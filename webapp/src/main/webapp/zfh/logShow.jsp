<%--
  Created by IntelliJ IDEA.
  User: 张飞虎
  Date: 2018/5/9
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- jquery -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1/jquery-3.2.1.js"></script>
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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/zfh/simpleff.css">
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

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div id="cha" style="margin-top: 8px">
    <form id="where" class="form-inline">
        <label for="name">日志名称：</label><input name="methodname" id="name"class="form-control" style="width: auto;">
        <div class="form-group">
            <label for="startTime">时间查询：</label> <input type="text"  class="form-control" id="startTime" name="startTime" style="width: auto;">
        </div>
        <div class="form-group">
           <label for="endTime">至</label> <input type="text"  class="form-control" id="endTime" name="endTime" style="width: auto;">
        </div>
        日志状态:<select id="state" class="form-control" name="state"  style="width: auto;">
        <option value="-1" selected>--请选择日志状态--
        <option value="1" >正常时日志
        <option value="2" >异常时日志
    </select>
        &nbsp;&nbsp;<button type="button" class="btn btn-primary" id="logquery">查询</button>
    </form>
</div>
<table id="table" class="table table-striped table-bordered" width="100%" cellspacing="0"></table>
<script type="text/javascript">

    $("#startTime").datetimepicker({
        format:"yyyy-mm-dd hh:mm:ss",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
    })
    $("#endTime").datetimepicker({
        format:"yyyy-mm-dd hh:mm:ss",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
    })
    $(function(){
        showData();
    })
    $("#logquery").click(function(){
        $('#table').bootstrapTable("refreshOptions",{pageNumber:1});
    });
    function showData(){
        $("#table").bootstrapTable(

            {
            url:"<%=request.getContextPath()%>/log/queryLog",//获取数据的请求路径
            columns:[
                {field:"cc",checkbox:true},
                {field:"startTime",title:"日志时间",width:200,align:"center"},
                {field:"methodWhere",title:"方法所在类",width:200,align:"center"},
                {field:"methodname",title:"请求方法",width:300,align:"center"},
                {field:"parameter",title:"请求参数",width:300,align:"center",formatter: function(value,row,index){
                    if(value==""){
                        return "-";
                    }else{
                        if(value.length>25){
                            return '<div class="icoFontlist" title="'+value+'" >'+value.substring(0,25)+'...</div>';
                        }else{
                            return value;
                        }
                    };
                }},
                {field:"state",title:"日志Exception",width:300,align:"center",
                    formatter: function(value,row,index){
                        if(row.state==1){
                            return "<font color='green'>NOexception</font>";
                        }else if(row.state==2){
                            if(row.exceptionInfo.length>30){
                                return '<div class="icoFontlist" title="'+row.exceptionInfo+'" style="size: 16">'+row.exceptionInfo.substring(0,30)+'...</div>';
                            }else{
                                return row.exceptionInfo;
                            }


                        };
                    }}

            ],
            pagination:true,//显示分页条
            pageNumber:1,//初始化 页数
            pageSize:10,//初始化 条数
            pageList:[5,10,15],//初始化 可选择的条数
            paginationLoop:false,//关闭分页的无限循环
            height:640,//高度
            undefinedText:"-",//有数据为空时 显示的内容
            striped:true,//斑马线
            sortName:"uage",//排序的字段
            sortOrder:"desc",//排序的方式 desc或asc
            //onlyInfoPagination:true,设置true时  只显示总条数
            //selectItemName:"name",
            //smartDisplay:false,
            //search:true,//启用搜索框
            //strictSearch:true,//设置精确匹配 还是模糊匹配     默认模糊匹配false
            //showFooter:true,//表格底部角
            showColumns:true,//显示选择展示列的按钮
            showRefresh:true,//刷新按钮
            showToggle:true,//切换显示格式
            showPaginationSwitch:true,//展示所有数据 和分页数据的切换按钮
            //detailView:true,//列的详细页
            /*  detailFormatter:function(index,row){
                 //格式化详细页
                 return '<a href="#">'+row.p_name+'</a>';
             }, */
            searchAlign:"left",//搜索框的显示位置
            paginationHAlign:"left",//分页按钮的显示位置
            paginationDetailHAlign:"right",//总页数 和条数的显示位置
            paginationPreText:"上一页",//设置上一页显示的文本
            paginationNextText:"下一页",//设置下一页显示的文本
            clickToSelect:true,//选中行  默认选中  单选或复选
            toolbar:"#cha",
            sidePagination:"server",
            method:"post",
           // searchOnEnterKey: true, //ENTER键搜索
            contentType:"application/x-www-form-urlencoded",
            queryParams:function(){
                var sort=this.sortName;
                var order=this.sortOrder;
                var offset=(this.pageNumber-1)*this.pageSize;
                var limit=this.pageSize;
                return formToJson("where",limit,offset,sort,order);
            }

        })
    }
    function formToJson(id,limit,offset,sort,order) {
        //序列化表当为数组对象
        var arr = $("#" + id).serializeArray();
        //准备拼接字符串
        var jsonStr = "";
        //拼接开始位置的{
        jsonStr += '{';
        //循环所有的
        for (var i = 0; i < arr.length; i++) {
            //拼接字符串     "name值":"value值",
            jsonStr += '"' + arr[i].name + '":"' + arr[i].value + '",'
        }
        //拼接上我们分页必要几个参数
        jsonStr +='"limit":"'+limit+'",';
        jsonStr +='"offset":"'+offset+'",';
        jsonStr +='"sort":"'+sort+'",';
        jsonStr +='"order":"'+order+'",';
        //去掉最后一个，
        jsonStr = jsonStr.substring(0, (jsonStr.length - 1));
        //拼接结束的}
        /*
        {
            “name”:"123",
            "age":"12"
        }
        */
        jsonStr += '}'
        var json = JSON.parse(jsonStr)
        return json
    }
</script>
</body>
</html>