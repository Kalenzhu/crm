<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-潜在客户分析</title>
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
  	
  </body>
  <script type="text/javascript">
  $(function () { 
  	var url ="${pageContext.request.contextPath}/main/queryCustomerAnalyze.do";
	$.post(url,
	{},
	function(datas) {
		draw(datas);
	},"json");
  });		

  function draw(datas) {
  	$('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '潜在客户分析'
        },
        xAxis: {
            categories: ['收入1-5000元', '收入5000-10000元', '收入10000元以上']
        },
        yAxis: {
            title: {
                text: '人数'
            }
        },
        series: datas
    });
  }
  </script>
</html>
