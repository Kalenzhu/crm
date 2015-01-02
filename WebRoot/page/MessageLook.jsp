<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-消息查看管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
			var dict = <%=CommonUtil.JSONString(CommonUtil.getDict())%>;
			var cust = <%=CommonUtil.JSONString(CommonUtil.getTable("t_customer_info", "id", "name"))%>;
			var cont = <%=CommonUtil.JSONString(CommonUtil.getTable("t_contact_info", "id", "name"))%>;
			var users = <%=CommonUtil.JSONString(CommonUtil.getTable("t_user_info", "id", "name"))%>;
	</script>
  </head>
  
  <body>
    <table id="dg" class="easyui-datagrid"
            data-options="pagination:true,fit:true,rownumbers:true,border:false,singleSelect:true,striped:true,
            url:'${pageContext.request.contextPath}/main/queryMessageLookDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
                <th data-options="field:'customer_id',width:100,align:'center'" formatter="getCustomerName">客户</th>
                <th data-options="field:'content',width:100,align:'center'">消息内容</th>
                <th data-options="field:'user_id',width:100,align:'center'" formatter="getUserName">用户</th>
                <th data-options="field:'create_date',width:120,align:'center'">消息创建日期</th>
            </tr>
        </thead>
    </table>
    <div id="dg-toolbar" style="padding:5px;height:auto">
        <div>
                                客户:<input  id="query_customer" name="form.now_house_num" style="width:100px" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'"> 
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="query()"><s:text name="BUTTON.SEARCH"></s:text></a>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="resetQuery()"><s:text name="BUTTON.RESET"></s:text></a>
        </div>
    </div>
 	
  </body>
  <script type="text/javascript">
  	var queryIds = ["query_customer"];
  	var queryUrls = ["querySelectByJson.do?form.comboboxKey=name&form.comboboxValue=id&form.comboboxTable=t_customer_info"];
  	var queryPath = "${pageContext.request.contextPath}/main/";
  	
  	$(function(){
  		loadComBoboxs(queryIds,queryUrls,queryPath);
  	});
  	
  	/**
	 * 查询
	 */
	function query() {
		$("#dg").datagrid({
			pageNumber : 1,
			queryParams : {
				"form.customer_id" : $("#query_customer").combobox("getValue")
			}
		});
	}
	
	var url;
	function operation(type,url) {
		this.url = url;
		clearForm("dlgFm");
		switch(type) {
		case "add" :
			openDialog("dlg","新增");
			break;
		case "edit" :
			var row = $("#dg").datagrid("getSelected");
			if(row) {
				loadForm(row);
				openDialog("dlg","修改");
			} else {
				alertMessageByCode("unSelect");
			}
			break;
		case "del" :
			var row = $("#dg").datagrid("getSelected");
			if(row) {
				$.messager.confirm("确认框","你确定要删除该行数据吗?", function(r) {
					if(r) {
						$.post(
							url,
							{"contact.id":row.id},
							function(code) {
								alertMessageByCode(code);
								reloadDataGrid("dg");
							},"json"
						); 
					}
				});
			} else {
				alertMessageByCode("unSelect");
			}
			break;
		}
	}
	
	/**
	 * 保存表单
	 */
	function save() {
		$("#dlgFm").form("submit", {
			url : url,
			onSubmit : function() {
				return $(this).form("validate");
			},
			success : function(code) {
				alertMessageByCode($.parseJSON(code));
				reloadDataGrid("dg");
				$("#dlg").dialog("close");
			}
		});
	}
	
	/**
	 * 为表单加载数据
	 * @param row
	 */
	function loadForm(row) {
		$.post(
			"${pageContext.request.contextPath}/main/queryContactByJson.do",
			{"form.id":row.id},
			function(data){
				if(data != null) {
					$("#dlg_id").val(data.id);
					$("#dlg_city").combobox("setValue",data.city);
					$("#dlg_name").val(data.name);
					$("#dlg_customer_id").combobox("setValue",data.customer_id);
					$("#dlg_department").val(data.department);
					$("#dlg_sex").combobox("setValue",data.sex);
					$("#dlg_age").val(data.age);
					$("#dlg_phone").val(data.phone);
					$("#dlg_address").val(data.address);
					$("#dlg_fax").val(data.fax);
					$("#dlg_email").val(data.email);
					$("#dlg_remark").val(data.remark);
					$("#dlg_conutry").combobox("setValue",data.conutry);
					$("#dlg_province").combobox("setValue",data.province);
					$("#dlg_city_code").combobox("setValue",data.city_code);
				}
			},"json"
		);
	}
  </script>
</html>
