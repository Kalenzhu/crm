<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-客户资源分配管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
			var dict = <%=CommonUtil.JSONString(CommonUtil.getDict())%>;
			var cust = <%=CommonUtil.JSONString(CommonUtil.getTable("t_customer_info", "id", "name"))%>;
			var cont = <%=CommonUtil.JSONString(CommonUtil.getTable("t_contact_info", "id", "name"))%>;
	</script>
  </head>
  
  <body>
    <table id="dg" class="easyui-datagrid"
            data-options="pagination:true,fit:true,rownumbers:true,border:false,singleSelect:false,striped:true,
            url:'${pageContext.request.contextPath}/main/queryCustomerDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
            	<th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'name',width:100,align:'center'">客户名</th>
                <th data-options="field:'sex',width:100,align:'center'" formatter="getSexName">性别</th>
                <th data-options="field:'age',width:100,align:'center'">年龄</th>
                <th data-options="field:'phone',width:120,align:'center'">联系电话</th>
                <th data-options="field:'address',width:100,align:'center'">地址</th>
                <th data-options="field:'fax',width:120,align:'center'">传真</th>
                <th data-options="field:'email',width:80,align:'center'">邮件</th>
                <th data-options="field:'website',width:80,align:'center'">客户网站</th>
                <th data-options="field:'income',width:80,align:'center'">客户收入</th>
                <th data-options="field:'fraction',width:80,align:'center'">客户积分</th>
                <th data-options="field:'source',width:80,align:'center'">客户来源</th>
                <th data-options="field:'status',width:60,align:'center'">客户状态</th>
                <th data-options="field:'type',width:80,align:'center'" formatter="getCustomerTypeName">客户类型</th>
                <th data-options="field:'employees',width:100,align:'center'">员工数</th>
                <th data-options="field:'trade',width:100,align:'center'">行业</th>
                <th data-options="field:'province',width:100,align:'center'" formatter="getProvinceName">省份</th>
                <th data-options="field:'city',width:300,align:'center'" formatter="getCityName">城市</th>
                <th data-options="field:'city_code',width:300,align:'center'" formatter="getCityCodeName">区号</th>
                <th data-options="field:'remark',width:300,align:'center'">备注</th>
            </tr>
        </thead>
    </table>
    <div id="dg-toolbar" style="padding:5px;height:auto">
    	<div>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="operation('dist','${pageContext.request.contextPath}/main/doDistribution.do')"><s:text name="BUTTON.DIST"></s:text></a>
        </div>
        <div>
                                客户名称:<input type="text" id="query_name" name="form.name" style="width:100px">
        	电话:<input type="text" id="query_phone" name="form.property_name" style="width:100px">
                                客户类型:<input id="query_type" name="form.now_house_num" style="width:100px" class="easyui-combobox" data-options="valueField:'dictionary_value',textField:'dictionary_name',url:'${pageContext.request.contextPath}/main/queryDictionaryByJson.do?form.dictionaryKey=CUSTOMER_TYPE'">
                               城市:<input id="query_city" name="form.house_num_position" style="width:100px" class="easyui-combobox" data-options="valueField:'dictionary_value',textField:'dictionary_name',url:'${pageContext.request.contextPath}/main/queryDictionaryByJson.do?form.dictionaryKey=CITY'">
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="query()"><s:text name="BUTTON.SEARCH"></s:text></a>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="resetQuery()"><s:text name="BUTTON.RESET"></s:text></a>
        </div>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="padding:10px" 
    	data-options="width:650,height:180, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">  
	    <form id="dlgFm" action="" method="post">
	    	<input id="dlg_ids" type="hidden" name="customer.ids" value=""></input>
            <fieldset>
	    		<legend>分配人选</legend>
	            <table style="border: 1">
	           	  	<tr>  
		                <td align="right">系统用户<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_user_id" style="width:100px;" name="customer.user_id"  class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'"></input>
		                </td>  
		            </tr>  
	          	</table>
	       </fieldset>
	    </form>
	</div>  
	<div id="dlg-buttons">  
   		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'"  onclick="save()"><s:text name="BUTTON.SAVE"></s:text></a>  
   		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'"  onclick="javascript:$('#dlg').dialog('close')"><s:text name="BUTTON.CANCEL"></s:text></a>  
 	</div>  
  </body>
  <script type="text/javascript">
  
  	/**
	 * 查询
	 */
	function query() {
		$("#dg").datagrid({
			pageNumber : 1,
			queryParams : {
				"form.name" : $("#query_name").val(),
				"form.phone" : $("#query_phone").val(),
				"form.type" : $("#query_type").combobox("getValue"),
				"form.city": $("#query_city").combobox("getValue")
			}
		});
	}
	
	var url;
	function operation(type,url) {
		this.url = url;
		clearForm("dlgFm");
		switch(type) {
		case "dist" :
			var rows = $("#dg").datagrid("getSelections");
			if(rows.length > 0) {
				loadForm(rows);
				openDialog("dlg","分配客户资源");
			} else {
				alertMessageByCode("unSelect");
			}
			break;
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
							{"customer.id":row.id},
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
	function loadForm(rows) {
		$("#dlg_user_id").combobox({
			url:"${pageContext.request.contextPath}/main/querySelectByJson.do?form.comboboxKey=name&form.comboboxValue=id&form.comboboxTable=t_user_info"
		});
		var ids = "";
		for(var i=0; i<rows.length; i++) {
			if(i==0) {
			    ids += "'" + rows[i].id + "'";
			} else {
				ids += "," + "'" + rows[i].id + "'";
			}
		}
		$("#dlg_ids").val(ids);
	}
	
  </script>
</html>
