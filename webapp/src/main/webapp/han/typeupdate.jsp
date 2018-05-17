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
    <input type="hidden" id="generaidsss" value="${type.generaid}">
    <input type="hidden" value="${type.typeid}"  name='typeid'>
    类型名称：<input type='text' value="${type.typename}" class="form-control" name='typename'/><br/>
    大类名称: <select  id="generaid" name="generaid" class="form-control">
                  <option value="">--请选择--</option>
             </select><br/>
</form>


<script>
    <%-- ------------------------------------------下拉查询--------------------------------------------- --%>
    var generasid=$("#generaidsss").val();
    $.ajax({
        url:"<%=request.getContextPath()%>/genera/queryGenera",
        type:"post",
        dataType:"json",
        success:function (mt){
            //给
            var option = "<option value=''>请选择</option>";
            $(mt).each(function (){
                if(generasid==this.generaid){
                    option += "<option value='"+this.generaid+"'selected>"+this.generaname+"</option>";
                }else{
                    option += "<option value='"+this.generaid+"'>"+this.generaname+"</option>";
                }
            });
            $("#generaid").html(option);
            $("#generaids").html(option);
        },
        error:function (){
            alert("查询下拉出错");
        }
    })

</script>
</body>
</html>
