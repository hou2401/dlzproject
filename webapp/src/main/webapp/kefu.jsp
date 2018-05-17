<%--
  Created by IntelliJ IDEA.
  User: 再难遇
  Date: 2018/5/17
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆</title>
    <style type="text/css">
        @CHARSET "UTF-8";
        /* 全局控制 */
        * {
            margin:0;
            padding:0;
        }

        body {
            font-size: 12px;
            font-family: "宋体";
            text-align: center;
        }

        a {
            color: #e3e3e3;
            text-decoration: none;
            padding: 2px;
        }

        a:hover {
            color: #e3e3e3;
            background-color: #606870;
        }

        ul {
            list-style: none;
            margin: 10px auto;
        }

        li {
            margin: 3px 1px;
            line-height: 24px;
            height: 24px;
        }

        li:hover {
            background-color: #eee;
        }

        button {
            line-height: 24px;
            height: 26px;
        }

        fieldset {
            height: 120px;
            width: 250px;
            padding: 5px;
        }

        label {
            width: 80px;
            float: left;
            text-align: right;
        }

        input {
            width: 150px;
        }
    </style>

    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.8.3.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/login.js"></script>
</head>
<body>
<fieldset><legend>登录</legend>

    <ul>
        <li><span>用户名:</span><input type="text" id="uname"></li>
        <li><span>密码:</span><input type="password" id="upass"></li>
        <li>
            <button id="btnLogin">登录</button>
            <button id="btnReset" type="reset">重置</button>
        </li>
    </ul>
    <span id="msg"></span>

</fieldset>
</body>

</html>