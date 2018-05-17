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

    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/uploadify/uploadify.css"/>
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
<!-- 上传图片-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.js"></script>

<button type="button" class="btn btn-primary" id="generas"> 新增</button>

<table class="table" id="genera"></table>

<%-- ------------------------------------------普通查询--------------------------------------------- --%>
<script>

    $("#genera").bootstrapTable({
        url:'<%=request.getContextPath()%>/genera/queryGenera',
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
        sortName:"updatetime",//排序的字段
        sortOrder:"desc",//排序的方式 desc或asc
        paginationPreText:"上一页",//设置上一页显示的文本
        paginationNextText:"下一页",//设置下一页显示的文本
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        method:"post",
        contentType:"application/x-www-form-urlencoded",
        queryParams:function () {
            var sort=this.sortName;
            var order=this.sortOrder;
            var offset=(this.pageNumber-1)*this.pageSize;
            var limit=this.pageSize;
            return formToJson("where",limit,offset,sort,order);
        },
        columns:[[
            {field:'generaid',title:'编号',width:100},
            {field:'generaname',title:'名称',width:100}

        ]]
    });



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



<%-- ------------------------------------------新增--------------------------------------------- --%>
<script>
    $("#generas").click(function(){
    BootstrapDialog.show({
        type : BootstrapDialog.TYPE_SUCCESS,
        title : '新增 ',
        message : $("<div></div>").load("insert.jsp"),
        //size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
        buttons : [ {// 设置关闭按钮
            label : '关闭',
            action : function(dialogItself) {
                dialogItself.close();
            },
        },{
            label : '保存',
            action : function(dialogItself) {
                var formData = new FormData(document.getElementById("insertForm"));
                $.ajax({
                    url:"<%=request.getContextPath()%>/genera/addGenera",
                    type:"post",
                    data:formData,
                    dataType:"text",
                    async:false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success:function(data){
                        if(data=="success"){
                            alert("成功");
                            dialogItself.close();
                            $("#genera").bootstrapTable("refresh",{pageNumber:1});
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
    })
    });
</script>

</body>
</html>
