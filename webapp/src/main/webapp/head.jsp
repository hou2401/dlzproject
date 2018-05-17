<%--
  Created by IntelliJ IDEA.
  User: HOU
  Date: 2018/5/4
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<jsp:include page="boots.jsp"></jsp:include>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>


    <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/asset/css/bootstrap.min.css">

    <!-- plugins -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/asset/css/plugins/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/asset/css/plugins/animate.min.css"/>
    <link href="<%=request.getContextPath()%>/js/asset/css/style.css" rel="stylesheet">
    <!-- end: Css -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/js/asset/img/logomi.png">
</head>

<body id="mimin" class="dashboard">
<!-- start: Header -->
<nav class="navbar navbar-default header navbar-fixed-top">
    <div class="col-md-12 nav-wrapper">
        <div class="navbar-header" style="width:100%;">
            <div class="opener-left-menu is-open">
                <span class="top"></span>
                <span class="middle"></span>
                <span class="bottom"></span>
            </div>
            <a href="" class="navbar-brand">
                <b>${sessionScope.user.uname}</b>
            </a>


            <ul class="nav navbar-nav navbar-right user-nav">
                <li class="user-name"><span>后台管理</span></li>
                <li class="dropdown avatar-dropdown">
                    <img src="<%=request.getContextPath()%>/js/asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true"/>
                <li ><a href="#" class="opener-right-menu"><span class="fa fa-coffee"></span></a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- end: Header -->

<div class="container-fluid mimin-wrapper">

    <!-- start:Left Menu -->

    <div id="left-menu">
        <div class="sub-left-menu scroll"  style="height: 100%;">
            <ul class="nav nav-list">
                <li><div class="left-bg"></div></li>
                <li class="time">
                    <h1 class="animated fadeInLeft">21:00</h1>
                    <p class="animated fadeInRight">Sat,October 1st 2029</p>
                </li>

            </ul>
            <div id="tree"></div>
        </div>



    </div>

</div>

<script type="text/javascript">


    function getTree(){
        var value;
        $.ajax({
            complete : function(xhr, status) {
                //拦截器实现超时跳转到登录页面
                // 通过xhr取得响应头
                var REDIRECT = xhr.getResponseHeader("REDIRECT");
                //如果响应头中包含 REDIRECT 则说明是拦截器返回的
                if (REDIRECT == "REDIRECT")
                {
                    var win = window;
                    while (win != win.top)
                    {
                        win = win.top;
                    }
                    //重新跳转到 login.html
                    win.location.href = xhr.getResponseHeader("CONTEXTPATH");
                }
            },
            url:"<%=request.getContextPath()%>/tree/getTree",
            type:"post",
            dataType:"json",
            async:false,
            success:function(data){
                value =data;
            }
        })
        return value;
    }


    $("#tree").treeview({
        data:getTree(),
        collapseIcon:"glyphicon glyphicon-star-empty",
        expandIcon:"glyphicon glyphicon-star",
        onhoverColor:"#F5F5F5",
        onNodeSelected: function(event, node) {
            if(node.url != null && node.url !=""){
                addTabs(node.text,node.url);
            }
        }
    })
    function addTabs(titleStr,urlStr){
        $.ajax({
            url:"<%=request.getContextPath()%>"+urlStr,
            success:function(info){
                $.addtabs.add({
                    id:titleStr,
                    title:titleStr,
                    content:info,
                })
            }

        })
    }

</script>
<!-- end: Left Menu -->

<!-- start:content -->
<div id="content" style="height: 100%;">
    <div  class="nav nav-tabs" ></div>
    <div  class="tab-content"></div>
</div>
<button id="mimin-mobile-menu-opener" class="animated rubberBand btn btn-circle btn-danger">
    <span class="fa fa-bars"></span>
</button>
<!-- end: Mobile -->



<!-- end: Content -->
<!-- start: Javascript -->
<script src="<%=request.getContextPath()%>/js/asset/js/jquery.ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/asset/js/bootstrap.min.js"></script>
<!-- plugins -->
<script src="<%=request.getContextPath()%>/js/asset/js/plugins/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/js/asset/js/plugins/chart.min.js"></script>
<script src="<%=request.getContextPath()%>/js/asset/js/plugins/jquery.nicescroll.js"></script>


<!-- custom -->
<script src="<%=request.getContextPath()%>/js/asset/js/main.js"></script>
<script type="<%=request.getContextPath()%>/js/text/javascript">
      (function(jQuery){
        var radarData = {
            labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(21,186,103,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 90, 81, 56, 55, 40]
                },
                {
                    label: "My Second dataset",
                    fillColor: "rgba(21,113,186,0.5)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [28, 48, 40, 19, 96, 27, 100]
                }
            ]
        };

        var barData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(21,186,103,0.5)",
                    strokeColor: "rgba(220,220,220,0.8)",
                    highlightFill: "rgba(220,220,220,0.75)",
                    highlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 80, 81, 56, 55, 40]
                },
                {
                    label: "My Second dataset",
                    fillColor: "rgba(21,113,186,0.5)",
                    strokeColor: "rgba(151,187,205,0.8)",
                    highlightFill: "rgba(151,187,205,0.75)",
                    highlightStroke: "rgba(151,187,205,1)",
                    data: [28, 48, 40, 19, 86, 27, 90]
                }
            ]
        };

        var lineChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "My First dataset",
                    fillColor: "rgba(21,186,103,0.5)",
                    strokeColor: "rgba(220,220,220,1)",
                    pointColor: "rgba(220,220,220,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [65, 59, 80, 81, 56, 55, 40]
                },
                {
                    label: "My Second dataset",
                    fillColor: "rgba(21,113,186,0.5)",
                    strokeColor: "rgba(151,187,205,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [28, 48, 40, 19, 86, 27, 90]
                }
            ]
        };


        var doughnutData = [
                {
                    value: 100,
                    color:"#4ED18F",
                    highlight: "#15BA67",
                    label: "Alfa"
                },
                {
                    value: 250,
                    color: "#15BA67",
                    highlight: "#15BA67",
                    label: "Beta"
                },
                {
                    value: 100,
                    color: "#5BAABF",
                    highlight: "#15BA67",
                    label: "Gamma"
                },
                {
                    value: 40,
                    color: "#94D7E9",
                    highlight: "#15BA67",
                    label: "Peta"
                },
                {
                    value: 120,
                    color: "#BBE0E9",
                    highlight: "#15BA67",
                    label: "X"
                }

            ];

             window.onload = function(){
                var ctx = $(".doughnut-chart")[0].getContext("2d");
                window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
                    responsive : true,
                    showTooltips: true
                });

                var ctx2 = $(".pie-chart")[0].getContext("2d");
                window.myPie = new Chart(ctx2).Pie(doughnutData, {
                    responsive : true,
                    showTooltips: true
                });

                var ctx3 = $(".line-chart")[0].getContext("2d");
                window.myLine = new Chart(ctx3).Line(lineChartData, {
                    responsive : true,
                    showTooltips: true
                });

                var ctx4 = $(".bar-chart")[0].getContext("2d");
                window.myBar = new Chart(ctx4).Bar(barData, {
                    responsive : true,
                    showTooltips: true
                });

                var ctx5 = $(".radar-chart")[0].getContext("2d");
                window.myRadar = new Chart(ctx5).Radar(radarData, {
                    responsive : true,
                    showTooltips: true
                });

                var ctx6 = $(".polar-chart")[0].getContext("2d");
                window.myPolar = new Chart(ctx6).PolarArea(doughnutData, {
                    responsive : true,
                    showTooltips: true
                });
            };
        })(jQuery);
     </script>


</body>
</html>
