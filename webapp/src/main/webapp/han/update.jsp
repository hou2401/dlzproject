<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/15
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

                <form id="upForm">
                    <input type="hidden" id="goodstypeidsss" value="${goods.typeid}">
                    <input type="hidden" value="${goods.goodsid}" name='goodsid'>
                    商品名称：<input type='text' value="${goods.goodsname}" class="form-control" name='goodsname'/><br/>
                    商品价格：<input type='text' value="${goods.goodsprice}"  class="form-control" name='goodsprice'/><br/>
                    商品类型：<select  id="typeid" name="typeid" class="form-control">
                                <option value="">--请选择--</option>
                            </select><br/>
                    商品图片： <input type="file" value="${goods.goodsimage}" id="img" name="image" class="projectfile" multiple>
                    商品时间：<input class="form-control" value="${goods.goodstime}" name='goodstime' size="16" type="text" ><br/>
                    <input  class="form-control" value="${goods.goodsflag}" type='hidden' name='goodsflag'/>
                    <input  class="form-control" value="${goods.createtime}" type='hidden' name='createtime'/>
                    <input  class="form-control" value="${goods.updatetime}" type='hidden' name='updatetime'/>
                    商品库存：<input class="form-control" value="${goods.goodskucun}" type='text' name='goodskucun'  /><br/>
                </form>





<script>
    <%-- ------------------------------------------类型下拉查询--------------------------------------------- --%>
    var goodstypeid=$("#goodstypeidsss").val();
    $.ajax({
        url:"<%=request.getContextPath()%>/goods/queryType",
        type:"post",
        dataType:"json",
        success:function (mt){
            //给
            var option = "<option value=''>请选择</option>";
            $(mt).each(function (){
                if(goodstypeid==this.typeid){
                    alert(this.typeid);
                option += "<option value='"+this.typeid+"'selected>"+this.typename+"</option>";
                }else{
                    option += "<option value='"+this.typeid+"'>"+this.typename+"</option>";
                }
            });
            $("#typeid").html(option);
            $("#typeids").html(option);
        },
        error:function (){
            alert("查询下拉出错");
        }
    })

</script>


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
</body>
</html>
