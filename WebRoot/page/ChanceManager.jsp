<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-机会管理</title>
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
            data-options="pagination:true,fit:true,rownumbers:true,border:false,singleSelect:true,striped:true,
            url:'${pageContext.request.contextPath}/main/queryChanceDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
                <th data-options="field:'name',width:100,align:'center'">机会名称</th>
                <th data-options="field:'customer_id',width:100,align:'center'" formatter="getCustomerName">客户</th>
                <th data-options="field:'probability',width:100,align:'center'">发展概率</th>
                <th data-options="field:'start_date',width:120,align:'center'">开始日期</th>
                <th data-options="field:'end_date',width:100,align:'center'">结束日期</th>
                <th data-options="field:'contact_id',width:120,align:'center'" formatter="getContactName">联系人</th>
                <th data-options="field:'remark',width:100,align:'center'">备注</th>
            </tr>
        </thead>
    </table>
    <div id="dg-toolbar" style="padding:5px;height:auto">
    	<div>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="operation('add','${pageContext.request.contextPath}/main/doAddChance.do')"><s:text name="BUTTON.ADD"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="operation('edit','${pageContext.request.contextPath}/main/doUpdateChance.do')"><s:text name="BUTTON.EDIT"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'" onclick="operation('del','${pageContext.request.contextPath}/main/doDeleteChance.do')"><s:text name="BUTTON.DEL"></s:text></a>
        </div>
        <div>
                                机会名称:<input type="text" id="query_name" name="form.name" style="width:100px">
                                联系人:<input type="text" id="query_contact_id" name="form.name" style="width:100px" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'">
                                客户:<input type="text" id="query_customer_id" name="form.now_house_num" style="width:100px" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'">
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="query()"><s:text name="BUTTON.SEARCH"></s:text></a>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="resetQuery()"><s:text name="BUTTON.RESET"></s:text></a>
        </div>
    </div>
    
    
    <div id="dlg" class="easyui-dialog" style="padding:10px" 
    	data-options="width:650,height:400, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">  
	    <form id="dlgFm" action="" method="post">
	    	<input id="dlg_id" type="hidden" name="chance.id" value=""></input>
            <fieldset>
	    		<legend>基本信息</legend>
	            <table style="border: 1">
	           	  	<tr>  
		                <td align="right">名称:</td>  
		                <td align="left">
		                	<input id="dlg_name" type="text" maxlength="256" style="width:100px;" name="chance.name" ></input>
		                </td>  
		                <td align="right">联系人<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_contact_id" style="width:100px;" name="chance.contact_id" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'"></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">客户<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_customer_id" style="width:100px;" name="chance.customer_id" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'"></input>
		                </td>  
		                <td align="right">发展概率:</td>  
		                <td align="left">
		                	<input id="dlg_probability" type="text" maxlength="256" style="width:100px;" name="chance.probability" ></input>
		                </td>  
		            </tr> 
		            <tr>  
		                <td align="right">开始日期:</td>  
		                <td align="left">
		                	<input id="dlg_start_date" type="text" maxlength="256" onClick="WdatePicker()" style="width:100px;" name="chance.start_date" ></input>
		                </td>  
		                <td align="right">结束日期:</td>  
		                <td align="left">
		                	<input id="dlg_end_date" type="text" maxlength="256" style="width:100px;" onClick="WdatePicker()" name="chance.end_date" ></input>
		                </td>  
		            </tr> 
		            <tr>  
		                <td align="right">备注:</td>  
		                <td align="left" colspan="3">
		                	<textarea rows="5" cols="80" id="dlg_remark" name="chance.remark"></textarea>
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
  	var comboboxIds = ["query_contact_id","query_customer_id"];
  	var urls = ["form.comboboxKey=name&form.comboboxValue=id&form.comboboxTable=t_contact_info","form.comboboxKey=name&form.comboboxValue=id&form.comboboxTable=t_customer_info"];
  	var rootPath = "${pageContext.request.contextPath}/main/querySelectByJson.do?";
  	var comboboxIds2 = ["dlg_contact_id","dlg_customer_id"];
  	$(function(){
  		loadComBoboxs(comboboxIds,urls,rootPath);
  	});
  	
  	/**
	 * 查询
	 */
	function query() {
		$("#dg").datagrid({
			pageNumber : 1,
			queryParams : {
				"form.name" : $("#query_name").val(),
				"form.contact_id" : $("#query_contact_id").combobox("getValue"),
				"form.customer_id" : $("#query_customer_id").combobox("getValue"),
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
			loadComBoboxs(comboboxIds2,urls,rootPath);
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
							{"chance.id":row.id},
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
		loadComBoboxs(comboboxIds2,urls,rootPath);
		$.post(
			"${pageContext.request.contextPath}/main/queryChanceByJson.do",
			{"form.id":row.id},
			function(data){
				if(data != null) {
					$("#dlg_id").val(data.id);
					$("#dlg_contact_id").combobox("setValue",data.contact_id);
					$("#dlg_name").val(data.name);
					$("#dlg_customer_id").combobox("setValue",data.customer_id);
					$("#dlg_remark").val(data.remark);
					$("#dlg_probability").val(data.probability);
				}
			},"json"
		);
	}
  </script>
</html>
