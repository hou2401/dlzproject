<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/15
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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

<center>
    <div style="height: 200px;width: 300px ;">

        <form id="addForm" method="post">

            类型名称：<input type='text'  class="form-control" name='typename'/><br/>
            属于：<select  id="generaid" name="generaid" class="form-control">
                     <option value="">--请选择--</option>
                    </select><br/>
        </form>

        <input type="button" id="subs" value="保存" class="btn btn-primary btn-lg">

    </div>

</center>



<%-- ------------------------------------------新增--------------------------------------------- --%>
<script>

    $("#subs").click(function(){

        var formData = new FormData(document.getElementById("addForm"));
        $.ajax({
            url:"<%=request.getContextPath()%>/type/addType",
            type:"post",
            data:formData,
            dataType:"text",
            async:false,
            cache: false,
            contentType: false,
            processData: false,
            success:function(data){
                if(data=="success"){

                    $("#type").bootstrapTable("refresh",{pageNumber:1});
                }else{
                    alert("成功")
                    $("#type").bootstrapTable('refresh');
                }
            },
            error:function(){
                alert("新增失败")
            }

        })

    })

</script>

<script>

    <%-- ------------------------------------------下拉查询--------------------------------------------- --%>

    $.ajax({
        url:"<%=request.getContextPath()%>/genera/queryGenera",
        type:"post",
        dataType:"json",
        success:function (mt){
            //给
            var option = "<option value=''>请选择</option>";
            $(mt).each(function (){
                option += "<option value='"+this.generaid+"'>"+this.generaname+"</option>";
            });
            $("#generaid").html(option);
        },
        error:function (){
            alert("查询下拉出错");
        }
    })


</script>

</body>
</html>
