<%--
  Created by IntelliJ IDEA.
  User: 再难遇
  Date: 2018/5/17
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>客服中心</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/chatMain.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/chatMain.css" />
</head>
<body>
<div id="divMain">
    <div class="divTop">
        <div class="divL">
            <h3>会话</h3>
            <div class="divShow" id="divContent"></div>
        </div>
        <div class="divR">
            <h3>当前在线人员</h3>
            <div class="divShow" id="divOnLine"></div>
        </div>
    </div>
    <div class="divBot">
        <table cellpadding="0" cellspacing="0">
            <tr><td colspan="2" id="divFace" class="pb"></td></tr>
            <tr>
                <td>
                    <textarea rows="3" cols="64" id="txtContent"></textarea>
                </td>
                <td class="p1">
                    <input type="button" id="btnSend" value="发送" class="btn"> </input>
                </td>
            </tr>
            <tr><td colspan="2" class="pt">发送内容不能为空 </td></tr>
        </table>
    </div>
    <span id="divMsg" class="clsTip">正在发送数据。。。</span>
</div>
</body>
</html>