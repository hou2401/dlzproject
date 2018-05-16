<%--
  Created by IntelliJ IDEA.
  User: 温少
  Date: 2018/5/15
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <title>Title</title>
</head>
<body>
<form  id="qa">
<input type="text" value="${rid}" name="rid"   id="rid"> <br/>
</form>
</body>
<script  type="text/javascript">

    $(function(){
        var rid=$("#rid").val();

        $.ajax({
            url:"<%=request.getContextPath()%>/wen/getpower",
            data:{"rid":rid},
            type:"post",
            dataType:"json",
            success:function(data){
                var htm="";
                for (var i = 0; i < data.roles.length; i++) {
                    var count=0;

                    for (var j = 0; j < data.list.length; j++) {
                        if(data.list[j].pid==data.roles[i].id){

                            htm+="<input type='checkbox' checked  name='pid' value='"+data.roles[i].id+"'>"+data.roles[i].text +"<br/>"
                            count=1;

                            break;
                        }
                    }
                    if(count!=1){
                        htm+="<input type='checkbox'  name='pid' value='"+data.roles[i].id+"'>"+data.roles[i].text+"<br/>"

                    }
                }

                $("#qa").append(htm);

            },error:function(){
                alert("报错");
            }

        })
    })

</script>
</html>
