<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/16
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="upForm">
    <input type="hidden" value="${type.typeid}"  name='typeid'>
    类型名称：<input type='text' value="${type.typename}" class="form-control" name='typename'/><br/>

</form>
</body>
</html>
