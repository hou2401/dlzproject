<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018-5-10
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%String path = request.getContextPath(); %>


<script type="text/javascript" src="js/jquery-3.2.1/jquery-3.2.1.js"></script>
xmlns="http://www.w3.org/1999/xhtml"><HEAD id=Head1>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<STYLE type=text/css>BODY {
    FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
TD {
    FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
</STYLE>

<META content="MSHTML 6.00.6000.16809" name=GENERATOR></HEAD>
<style type="text/css">
    .btn12
    {
        width:100px;
        height:40px;
        background:url("login_files/login_button.gif");

    }

</style>
<BODY>
<FORM id=form1 name=form1 onsubmit="javascript:return WebForm_OnSubmit();"
      action=login.aspx method=post>
    <DIV><INPUT id=__EVENTTARGET type=hidden name=__EVENTTARGET> <INPUT
            id=__EVENTARGUMENT type=hidden name=__EVENTARGUMENT> <INPUT id=__VIEWSTATE
                                                                        type=hidden
                                                                        value=/wEPDwUKLTMxMzU2OTkzM2QYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFA2J0bmF2stSMyj1cbWFEH2tzan/b7XAS
                                                                        name=__VIEWSTATE> </DIV>
    <SCRIPT type=text/javascript>
        <!--
        var theForm = document.forms['form1'];
        if (!theForm) {
            theForm = document.form1;
        }
        function __doPostBack(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }
        // -->
    </SCRIPT>

    <SCRIPT src="login_files/WebResource.axd" type=text/javascript></SCRIPT>

    <SCRIPT src="login_files/WebResource(1).axd" type=text/javascript></SCRIPT>

    <SCRIPT src="login_files/ScriptResource.axd" type=text/javascript></SCRIPT>

    <SCRIPT src="login_files/ScriptResource(1).axd" type=text/javascript></SCRIPT>

    <SCRIPT type=text/javascript>
        <!--
        function WebForm_OnSubmit() {
            if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
            return true;
        }
        // -->
    </SCRIPT>

    <SCRIPT type=text/javascript>
        //<![CDATA[
        Sys.WebForms.PageRequestManager._initialize('ScriptManager1', document.getElementById('form1'));
        Sys.WebForms.PageRequestManager.getInstance()._updateControls(['tUpdatePanel1'], [], [], 90);
        //]]>
    </SCRIPT>

    <DIV id=UpdatePanel1>
        <DIV id=div1
             style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>
        <DIV id=div2
             style="LEFT: 0px; POSITION: absolute; TOP: 0px; BACKGROUND-COLOR: #0066ff"></DIV>
        <SCRIPT language=JavaScript>
            var speed=20;
            var temp=new Array();
            var clipright=document.body.clientWidth/2,clipleft=0
            for (i=1;i<=2;i++){
                temp[i]=eval("document.all.div"+i+".style");
                temp[i].width=document.body.clientWidth/2;
                temp[i].height=document.body.clientHeight;
                temp[i].left=(i-1)*parseInt(temp[i].width);
            }
            function openit(){
                clipright-=speed;
                temp[1].clip="rect(0 "+clipright+" auto 0)";
                clipleft+=speed;
                temp[2].clip="rect(0 auto auto "+clipleft+")";
                if (clipright<=0)
                    clearInterval(tim);
            }
            tim=setInterval("openit()",100);
        </SCRIPT>

        <DIV>&nbsp;&nbsp; </DIV>
        <DIV>
            <TABLE cellSpacing=0 cellPadding=0 width=900 align=center border=0>
                <TBODY>
                <TR>
                    <TD style="HEIGHT: 105px"><IMG src="login_files/login_1.gif"
                                                   border=0></TD></TR>
                <TR>
                    <TD background=login_files/login_2.jpg height=300>
                        <TABLE height=300 cellPadding=0 width=900 border=0>
                            <TBODY>
                            <TR>
                                <TD colSpan=2 height=35></TD></TR>
                            <TR>
                                <TD width=360></TD>
                                <TD>
                                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                                        <TBODY>
                    <TR>
                    <TD style="HEIGHT: 28px" width=80>登 录 名：</TD>
                    <TD style="HEIGHT: 28px" width=150><INPUT id=txtName
                       style="WIDTH: 130px"  name=uname>
                    </TD>
                    <TD style="HEIGHT: 28px" width=370></TD>
                    </TR>

                <TR>

                    <TD style="HEIGHT: 28px">登录密码：</TD>
                    <TD style="HEIGHT: 28px"><INPUT id=txtPwd style="WIDTH: 130px"
                                                    type=password name=upass></TD>
                    <TD style="HEIGHT: 28px"></TD></TR>

                 <tr>
                     <TD style="HEIGHT: 28px">验证码：</TD>
                     <td>
                        <input type="text"  placeholder="验证码" name="validataCode" id="pcodeznn" style="WIDTH: 130px">



                     </td>
                     <td>
                         <img id="imgIdznn" src="<%=request.getContextPath()%>/ncyController/validateCode" />
                         <a href="javascript:void(0)" onclick="changeValidateImage()" style="color: #1D0E0E">看不清？换一张！</a>

                     </td>
                 </tr>

                <TD colspan="2" align="center">
                    <INPUT class="btn12" onclick="userlogin()">

                </TD>
                        </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
                <TR>
                    <TD><IMG src="login_files/login_3.jpg"
                             border=0></TD></TR></TBODY></TABLE></DIV></DIV>
            </table>
    <%--验证码验证--%>
    <script type="text/javascript">

        function changeValidateImage(){

            var imgObj = document.getElementById("imgIdznn");
            var imgSrc = imgObj.src + "?timestamp="+(new Date()).valueOf();
            imgObj.src = imgSrc;
        }

    </script>


    <SCRIPT type=text/javascript>
        <!--
        var Page_Validators =  new Array(document.getElementById("RequiredFieldValidator3"), document.getElementById("RequiredFieldValidator4"));
        // -->
    </SCRIPT>

    <SCRIPT type=text/javascript>
        function userlogin() {

            $.ajax({
                url:"<%=path%>/ncyController/login",
                type:"post",
                data:{"uname":$("#txtName").val(),"upass":$("#txtPwd").val(),"validataCode":$("#pcodeznn").val()},
                dataType:"json",
                success:function(data){
                    if(data.mas=="success"){

                        location.href="<%=path%>/head.jsp";
                    }else if(data.mas=="passworderror"){
                        alert("密码错误");
                        changeValidateImage();
                    }else if(data.mas=="usererror"){
                        alert("用户名错误");
                        changeValidateImage();
                    }else if(data.mas=="errorcode"){
                        alert("验证码错误");
                        changeValidateImage();

                    }
                }
            });
        }


    </SCRIPT>

    <DIV><INPUT id=__EVENTVALIDATION type=hidden
                value=/wEWBQKHmOW2AwLEhISFCwKd+7qdDgLChPy+DQKSoqqWDwNN1E3vW0gpbdtBgVWKbj2bcHhs
                name=__EVENTVALIDATION> </DIV>
    <SCRIPT type=text/javascript>
        <!--
        var Page_ValidationActive = false;
        if (typeof(ValidatorOnLoad) == "function") {
            ValidatorOnLoad();
        }

        function ValidatorOnSubmit() {
            if (Page_ValidationActive) {
                return ValidatorCommonOnSubmit();
            }
            else {
                return true;
            }
        }
        // -->
    </SCRIPT>

    <SCRIPT type=text/javascript>
        <!--
        Sys.Application.initialize();
        // -->
    </SCRIPT>
</FORM></BODY></HTML>
