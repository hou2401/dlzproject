<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14
  Time: 19:43
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



<center>
    <div style="height: 250px;width: 300px ;">

        <form id="addForm" method="post">

            商品名称：<input type='text'   class="form-control" name='goodsname'/><br/>
            商品价格：<input type='text'  class="form-control" name='goodsprice'/><br/>
            商品类型：<select  id="typeid" name="typeid" class="form-control">
            <option value="">--请选择--</option>
        </select><br/>
            商品图片：<input type="file"  id="img" name="image" class="projectfile" multiple>
            商品时间：<input class="form-control"  name='goodstime' size="16" type="text" ><br/>
                         <input value="0"  name='goodsflag' type="hidden" >
            商品库存：<input type='text' class="form-control" name='goodskucun'  /><br/>

        </form>
        <input type="button" id="good" value="保存" class="btn btn-primary btn-lg">

    </div>

</center>



<script>

    projectfileoptions = {
        //在input框中设置 multiple可以上传多个文件
        uploadAsync: false, //默认异步上传
        //文件上传的路径，设置可实现拖拽
        uploadUrl:'url',//上传路径
        showUpload:false,//是否显示上传按钮
        showRemove:false,//是否显示移除按钮
        language:'zh',//中文语言
        allowedPreviewTypes:[ 'image'],//上传文件的类型
        allowedFileExtensions:['jpg', 'png', 'gif'],//上传文件的后缀名
        showCaption: true,//是否显示文件名
        maxFileSize : 2048,//上传文件的大小单位kb
        showPreview : true, //是否显示预览
        showClose:true,//是否显示关闭按钮
        showBrowse:true,//是否显示选择按钮
        maxFileCount:10,//最大同时上传文件数量
        dropZoneEnabled: true,//是否显示拖拽区域
        layoutTemplates:{
            actionUpload:'',    //设置为空可去掉上传按钮
            //actionDelete:''  //设置为空可去掉删除按钮
        }
    }

    $('input[class=projectfile]').each(function() {
        var imageurl = $(this).attr("value");
        if (imageurl) {
            var op = $.extend({
                initialPreview : [ // 预览图片的设置
                    "<img width='200px' src='" + imageurl + "' class='file-preview-image'>", ]
            }, projectfileoptions);
            $(this).fileinput(op);

        } else {
            $(this).fileinput(projectfileoptions);
        }

    });




    <%-- ------------------------------------------类型下拉查询--------------------------------------------- --%>

    $.ajax({
        url:"<%=request.getContextPath()%>/goods/queryType",
        type:"post",
        dataType:"json",
        success:function (mt){
            //给
            var option = "<option value=''>请选择</option>";
            $(mt).each(function (){
                option += "<option value='"+this.typeid+"'>"+this.typename+"</option>";
            });
            $("#typeid").html(option);
           // $("#typeids").html(option);
        },
        error:function (){
            alert("查询下拉出错");
        }
    })

</script>
<%-- ------------------------------------------日期--------------------------------------------- --%>
<script>
    $('[name="goodstime"]').datetimepicker({
        format : 'yyyy-mm-dd',
        weekStart : 1,
        todayBtn : 1,
        autoclose : 1,
        todayHighlight : 1,
        startView : 2,
        forceParse : 0,
        showMeridian : 1,
        language: 'zh-CN',//汉化
        minView: "month" //选择日期后，不会再跳转去选择时分秒
    });

</script>
<%-- ------------------------------------------新增--------------------------------------------- --%>
<script>

    $("#good").click(function(){

        var formData = new FormData(document.getElementById("addForm"));
        $.ajax({
            url:"<%=request.getContextPath()%>/goods/addGoods",
            type:"post",
            data:formData,
            dataType:"text",
            async:false,
            cache: false,
            contentType: false,
            processData: false,
            success:function(data){
                if(data=="success"){
                    alert("成功")
                    $("#hsys").bootstrapTable("refresh",{pageNumber:1});
                }else{

                    $("#hsys").bootstrapTable('refresh');
                }
            },
            error:function(){
                alert("新增失败")
            }

        })

    })

</script>
</body>
</html>
