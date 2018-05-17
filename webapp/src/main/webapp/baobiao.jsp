<%--
  Created by IntelliJ IDEA.
  User: HOU
  Date: 2018/5/17
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="<%=request.getContextPath() %>/js/highcharts.js"></script>
<script src="<%=request.getContextPath() %>/js/exporting.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.2.1/jquery-3.2.1.js"></script>
<body>
<div id="container" style="min-width: 310px; height: 400px; max-width: 800px; margin: 0 auto"></div>
<script type="text/javascript">
    $(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/tree/querychar",
            type:"POST",
            dataType:"JSON",
            success:function (res){
                console.log(res)
                aa(res)
            }
        })
    })
    function aa(res){
        Highcharts.chart('container', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'column'
            },
            title: {
                text: '财务报表'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}元</b>'
            },
            xAxis: {
                categories: ['收入', '退款', '利润'],
                title: {
                    text: null
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.y} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: '财务统计',
                colorByPoint: true,
                data:res
            }]
        });
    }
</script>
</body>
</html>
