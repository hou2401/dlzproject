<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class = "yanZhengFromId">
		<br/><br/>
		用户名：<input name = "nowUserName" class="easyui-textbox" style="width:300px"><br/><br/> 
	
		密码：<input name = "nowPassWord" type = "passWord" style="width:300px"><br/><br/> 
		
		<%--验证码：<input type="text" name="imageCode"/>&nbsp;&nbsp;--%>
		<%--<img src="<%=request.getContextPath()%>/authImage" onclick="F5(this)"/>--%>

	</form>

<%--<script type="text/javascript">
	function F5(obj){
		obj.src="<%=request.getContextPath()%>/authImage?"+Math.random();
	}
	
</script>--%>
	
</body>
</html>