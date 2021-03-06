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



    <div id="chas">
        <form id="where">

            大类：<span id ="generaids"></span><br/>

            <input type="button" id="serchs" value="查询"/>
        </form>
    </div>



<table class="table" id="type"></table>

<%-- ------------------------------------------普通查询--------------------------------------------- --%>
<script>
    $("#serchs").click(function(){
        $("#type").bootstrapTable("refresh",{pageNumber:1});
    })


    $("#type").bootstrapTable({
        url:'<%=request.getContextPath()%>/goods/queryType',

        columns:[[
            {field:'typeid',title:'类型编号',width:100},
            {field:'typename',title:'类型名称',width:100},
            {field:'generaname',title:'大类',width:100},
            {field:'hsy', title:'操作', width:10,
                formatter:function(value,row,index){
                    return  '<button  class="btn btn-primary"  data-toggle="modal" data-target="#myModal1" onclick="updatype('+row.typeid+')">修改</button>' +
                        '<button type="button" class="btn btn-danger"  onclick="deltype('+row.typeid+')" >删除</button>';


                }}
        ]],
        pagination: true,                   //是否显示分页（*）
        sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
        pageSize: 3,                     //每页的记录行数（*）
        pageList: [3, 5, 8, 10],        //可供选择的每页的行数（*）
        search: true,                      //是否显示表格搜索
        strictSearch:true,
        showColumns: true,                  //是否显示所有的列（选择显示的列）
        showRefresh: true,                  //是否显示刷新按钮
        clickToSelect: true,                //是否启用点击选中行
        height:530,//高度
        undefinedText:"-",//有数据为空时 显示的内容
        striped:true,//斑马线
        paginationPreText:"上一页",//设置上一页显示的文本
        paginationNextText:"下一页",//设置下一页显示的文本
        uniqueId: "ID",                     //每一行的唯一标识，一般为主键列
        toolbar:"#chas",
        method:"post",
        contentType:"application/x-www-form-urlencoded",
        queryParams:function () {
            var sort=this.sortName;
            var order=this.sortOrder;
            var offset=(this.pageNumber-1)*this.pageSize;
            var limit=this.pageSize;

            return formToJson("where",limit,offset,sort,order);
        }

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

    //-----------------------------------------单选---------------------------------------------------
    $.ajax({
        url:"<%=request.getContextPath()%>/genera/queryGenera",
        type:"post",
        dataType:"json",
        success:function (data){
            var radioHtml = "";
            $(data).each(function (){
                radioHtml += "<input type='radio' name='generaid' value='"+this.generaid+"'/>"+this.generaname;
            });

            $("#generaids").html(radioHtml);
        },
        error:function (){
            alert("查询尺寸单选出错");
        }
    })

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
