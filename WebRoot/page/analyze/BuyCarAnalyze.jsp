<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-购车分析</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=path%>/js/hightchart/highcharts.js"></script>
	<script type="text/javascript" src="<%=path%>/js/hightchart/themes/gray.js"></script>
  </head>
  
  <body>
  
  <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto; top: 200px;"></div>
  <br>
  <hr>
  <br>
  <div id="container2" style="min-width: 310px; height: 400px;top: 800px;"></div>	
  </body>
  <script type="text/javascript">
  $(function () { 
  	var url ="${pageContext.request.contextPath}/main/queryBuyCarAnalyze.do";
	$.post(url,
	{},
	function(datas) {
		draw(datas);
	},"json");
	url = "${pageContext.request.contextPath}/main/queryBuyCarAnalyze2.do";
	$.post(url,
	{},
	function(datas) {
		draw2(datas);
	},"json");
  });		

  function draw(datas) {
  	$('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '购车分析'
        },
        xAxis: {
            categories: ['近1个月内购车', '近3个月内购车', '近6个月内购车', '近12个月内购车']
        },
        yAxis: {
            title: {
                text: '数量'
            }
        },
        series: datas
    });
  }
  function draw2(datas) {
  	$('#container2').highcharts({
            title: {
                text: '购车价格分析',
                x: -20 //center
            },
            subtitle: {
                text: '分析各个月份内购车总价与实际到账的情况',
                x: -20
            },
            xAxis: {
                categories: ['近1个月内购车', '近3个月内购车', '近6个月内购车', '近12个月内购车']
            },
            yAxis: {
                title: {
                    text: '金额(元)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '元'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: datas
        });
  }
  </script>
</html>
