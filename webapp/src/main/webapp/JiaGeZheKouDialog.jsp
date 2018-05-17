<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><br/><br/>	
	<form id = "PuTongZheKouFormId">
		<input type = "hidden" name = "myPuTongId">
		普通会员折扣：<input name = "myPuTongZheKou" style="width:200px">&nbsp;&nbsp;&nbsp;
		<input type = "button" id = "puTongZheKouButton" value = "提交">
	</form><br/><br/>
	<form id = "BoJinZheKouFormId">
		<input type = "hidden" name = "myBoJinId">
		铂金会员折扣：<input name = "myBoJinZheKou" style="width:200px">&nbsp;&nbsp;&nbsp;
		<input type = "button" id = "BoJinZheKouButton" value = "提交">
	</form><br/><br/>
	<form id = "ZuanShiZheKouFormId">
		<input type = "hidden" name = "myZuanShiId">
		钻石会员折扣：<input name = "myZuanShiZheKou" style="width:200px">&nbsp;&nbsp;&nbsp; 
		<input type = "button" id = "ZuanShiZheKouButton" value = "提交">
	</form>
<script>
	$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/zpsTree/queryAllZheKou",
			type:"post",
			data:"",
			dataType:"json",
			success:function(result){
				$("[name = 'myPuTongId']").val(result.myPuTongId);
				$("[name = 'myPuTongZheKou']").val(result.myPuTongZheKou);
				$("[name = 'myBoJinId']").val(result.myBoJinId);
				$("[name = 'myBoJinZheKou']").val(result.myBoJinZheKou);
				$("[name = 'myZuanShiId']").val(result.myZuanShiId);
				$("[name = 'myZuanShiZheKou']").val(result.myZuanShiZheKou);
			},
			error:function(){
				$.messager.alert('提示','折扣查询失败,请查看后台代码！！！');    
			}
		})
	})

	$("#puTongZheKouButton").click(function(){
		var puTong = $("[name = 'myPuTongZheKou']").val();
		if(puTong <= 0.5){
			$.messager.alert('提示',"折扣不可等于或小于 0.5！！！");    
			return false;
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/zpsTree/updateZheKou",
			type:"post",
			data:{"zheKouId":$("[name = 'myPuTongId']").val() ,"zheKou":$("[name = 'myPuTongZheKou']").val()},
			dataType:"text",
			success:function(result){
				if(result == "success"){
					$.messager.alert('提示',"普通会员折扣修改成功！！！"); 
					$("[name = 'myPuTongZheKou']").prop("disabled", true)
					$("#puTongZheKouButton").prop("disabled", true);
				}else{
					$.messager.alert('提示',"普通会员已过期！！！"); 
				}
			},
			error:function(){
				$.messager.alert('提示',"普通会员折扣修改失败,请查看后台代码！！！");    
			}
		})
	})
	
	$("#BoJinZheKouButton").click(function(){
		var boJin = $("[name = 'myBoJinZheKou']").val();
		if(boJin <= 0.5){
			$.messager.alert('提示',"折扣不可等于或小于 0.5！！！");    
			return false;
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/zpsTree/updateZheKou",
			type:"post",
			data:{"zheKouId":$("[name = 'myBoJinId']").val() ,"zheKou":$("[name = 'myBoJinZheKou']").val()},
			dataType:"text",
			success:function(result){
				if(result == "success"){
					$.messager.alert('提示',"铂金会员折扣修改成功！！！"); 
					$("[name = 'myBoJinZheKou']").prop("disabled", true)
					$("#BoJinZheKouButton").prop("disabled", true);
				}else{
					$.messager.alert('提示',"铂金会员折扣修改失败！！！"); 
				}
			},
			error:function(){
				$.messager.alert('提示',"普通会员折扣修改失败,请查看后台代码！！！");    
			}
		})		
	})
	
	$("#ZuanShiZheKouButton").click(function(){
		var zuanShi = $("[name = 'myZuanShiZheKou']").val();
		if(zuanShi <= 0.5){
			$.messager.alert('提示',"折扣不可等于或小于 0.5！！！");    
			return false;
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/zpsTree/updateZheKou",
			type:"post",
			data:{"zheKouId":$("[name = 'myZuanShiId']").val() ,"zheKou":$("[name = 'myZuanShiZheKou']").val()},
			dataType:"text",
			success:function(result){
				if(result == "success"){
					$.messager.alert('提示',"钻石会员折扣修改成功！！！"); 
					$("[name = 'myZuanShiZheKou']").prop("disabled", true)
					$("#ZuanShiZheKouButton").prop("disabled", true);
				}else{
					$.messager.alert('提示',"钻石会员折扣修改失败！！！"); 
				}
			},
			error:function(){
				$.messager.alert('提示',"钻石会员折扣修改失败,请查看后台代码！！！");    
			}
		})		
	})







</script>









</body>
</html>