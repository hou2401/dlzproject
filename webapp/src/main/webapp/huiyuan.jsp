<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="c" %> 
  <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% String path = request.getContextPath(); %>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui/jquery.easyui.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-easyui/themes/icon.css"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/My97/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/themes/insdep/jquery.insdep-extend.min.js"></script>
</head>
<%@ page isELIgnored="false" %>
<body>      <!-- 查询用的拼接对应实体类中的名字 -->
<div  style="background:url(img/861b8df73ab8be4acd87fa8107bd6383.gif);height:600;text-align:center;">
<center>
<form id="add_Form" method="post" >
		 <input type="hidden" value="${xin.customerid}" name="customerid"/>
		 <br> <br>
		 <table>
		 	<tr>
		 		<td>订单id:</td>
		 		<td><input class="easyui-textbox" value="${xin.orderid}" name="orderid" style="width:300px"></td>
		 	</tr>
		 	<tr>
		 		<td>手机号 :</td>
		 		<td><input class="easyui-textbox" value="${xin.customerphone}" name="customerphone" style="width:300px"></td>
		 			
		 	</tr>
		 	<tr>
		 		<td>用户名称 :</td>
		 		<td><input class="easyui-textbox" value="${xin.customername}" name="customername" style="width:300px"></td>
		 	</tr>
			 <tr>
				 <td>类型 :</td>
				 <td><input class="easyui-textbox" value="${xin.customertype}" name="customertype" style="width:300px"></td>
			 </tr>
			 <tr>
				 <td>现有金额:</td>
				 <td><input class="easyui-textbox" value="${xin.customerjine}" name=customerjine" style="width:300px"></td>
			 </tr>
			   <tr>
		 		<td>时间 :</td>
		 		<td><input  id="dd" name="customershijian" value="${xin.customershijian}" type= "text" class= "easyui-datebox" required ="required"></td>
		 	</tr>
			 <tr>
				 <td>折扣 :</td>
				 <td><input class="easyui-textbox" value="${xin.customerzhekou}" name="customerzhekou" style="width:300px"></td>
			 </tr>
			 <tr>
				 <td>订单人姓名 :</td>
				 <td><input class="easyui-textbox" value="${xin.customerdingdan}" name="customerdingdan" style="width:300px"></td>
			 </tr>
			 <tr>
				 <td>地址 :</td>
				 <td><input class="easyui-textbox" value="${xin.customerdizhi}" name="customerdizhi" style="width:300px"></td>
			 </tr>
		 </table>
		 <font size="4" color="orange">皇冠会员<br>
		 @@找回男人的自信</font><br>
		 <a id="addBrandOffice" class="easyui-linkbutton" data-options="iconCls:'icon-add'">开通会员</a>
</form>
</center>
</div>
<script type="text/javascript">
$('#addBrandOffice').bind('click', function(){    
	$.ajax({                          //ajax方式提交新增的路径
		url:"<%=request.getContextPath()%>/zpsTree/addPerson",
		type:"post",
		data:$("#add_Form").serialize(),      //form的id
		dataType:"text",                         //返回的文本格式
		success:function (addFlag){
			if(addFlag == "addSuccess"){
				$('#dd').dialog('close');         //地v里的路径
				$('#showData').datagrid('reload');    //table 里的id
			}
		},
		error:function (){
			alert("新增出错"); //判断
		}
	})  
});
function myformatter(date){
		 var y = date.getFullYear();
		 var m = date.getMonth()+1;
		 var d = date.getDate();
		 return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		 function myparser(s){
		 if (!s) return new Date();
		 var ss = (s.split('-'));
		 var y = parseInt(ss[0],10);
		var m = parseInt(ss[1],10);
		 var d = parseInt(ss[2],10);
		 if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
		 return new Date(y,m-1,d);
		 }else{
		 return new Date();
		 }
		}
</script>
</body>
</html>