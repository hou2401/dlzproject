<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="c" %> 
  <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="boots.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ page isELIgnored="false" %>
<body>
	<form id="person" >
		<input type="hidden"  value="${com.customerid}" name="customerid" id="customerid"/>
		<table align="center">
			<tr>
				<td>订单id</td>
				<td>
					<input type="text" value="${com.orderid}"  class="form-control" name="orderid">
				</td>
			</tr>

			<tr>
				<td>手机号</td>
				<td><input type="text" value="${com.customerphone}"  class="form-control" name="customerphone"></td>
			</tr>

			<tr>
				<td>用户名称</td>
				<td>
					<input type="text" value="${com.customername}"  class="form-control" name="customername">
				</td>
			</tr>

			<tr>
				<td>用户类型</td>
				<td><input type="text" value="${com.customertype}"  class="form-control" name="customertype"></td>
			</tr>

			<tr>
				<td>现有金额</td>
				<td>
					<input type="text" value="${com.customerjine}"  class="form-control" name="customerjine">
				</td>
			</tr>

			<tr>
				<td>会员卡开通时间</td>
				<td><input type="text" value="${com.customershijian}"  class="form-control" name="customershijian"></td>
			</tr>

			<tr>
				<td>折扣</td>
				<td>
					<input type="text" value="${com.customerzhekou}"  class="form-control" name="customerzhekou">
				</td>
			</tr>

			<tr>
				<td>订单人姓名</td>
				<td><input type="text" value="${com.customerdingdan}"  class="form-control" name="customerdingdan"></td>
			</tr>

			<tr>
				<td>订单地址</td>
				<td>
					<input type="text" value="${com.customerdizhi}"  class="form-control" name="customerdizhi">
				</td>
			</tr>

			<tr>
				<td>会员id</td>
				<td><input type="text" value="${com.shipCarid}"  class="form-control" name="shipCarid"></td>
			</tr>

			<tr>
				<td>会员办理时间</td>
				<td>
					<input type="text" value="${com.shipCardDate}"  class="form-control" name="shipCardDate">
				</td>
			</tr>

			<tr>
				<td>会员优惠包</td>
				<td><input type="text" value="${com.shipCardYouHui}"  class="form-control" name="shipCardYouHui"></td>
			</tr>

			<tr>
				<td>会员包优惠开始时间</td>
				<td>
					<input type="text" value="${com.shipCardYouHuiDate}" class="form-control" id="time" name="shipCardYouHuiDate">
				</td>
			</tr>

		</table>
	</form>
	

	
	<script type="text/javascript">
	$("#time").datetimepicker({
		format:"yyyy年mm月dd日",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
	})
	
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
	        //maxFileCount:10,//最大同时上传文件数量
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
	            "<img src='" + imageurl + "' class='file-preview-image'>", ]
	        }, projectfileoptions);
	        $(this).fileinput(op);
	    } else {
	        $(this).fileinput(projectfileoptions);
	    }
	});
	
	
	//上传图片
	$("#file").uploadify({
		//插件自带  不可忽略的参数
	  	'swf': '${pageContext.request.contextPath}/uploadify/uploadify.swf',
		//前台请求后台上传文件的url  不可忽略的参数
		'uploader': '${pageContext.request.contextPath}/setTree/uploadFile.do',
	    //给div的进度条加背景  参数为<div>id属性值  不可忽略
	    'queueID': 'fileQueue',
	    //上传文件文件名   和file文件域的name属性一致   和后台接受的属性名对应
	    'fileObjName' : 'image',
	    //给上传按钮设置文字
	    'buttonText': '上传',
	    //如果为true 为自动上传  在选择文件后, 为false 那么它就要我们自己手动点上传按钮
	    'auto': true,
	    //可以同时选择多个文件 默认为true  不可忽略
	    'multi': true,
	    //上传后队列是否消失
	    'removeCompleted': true,
	    //队列消失时间
	    'removeTimeout' : 1,
	    //最大上传文件数量
	    'uploadLimit':  10,
	    //制定可以文件上传
	    'fileExt': '*.jpg;*.jpeg;*.gif;*.png;*.doc;*.docx;*.xls;*.xlsx;*.pdf;*.txt',
	    'onUploadSuccess' : function(file, data, response) {
	    	var html = '<img src='+data+' width="100" height="100">';
	    	$("#show").html(html);
	    	$("[name='p_photo']").val(data);

	    }
	})
	
	
	</script>
</body>
</html>