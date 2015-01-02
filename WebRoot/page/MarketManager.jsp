<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-销售过程管理</title>
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
            url:'${pageContext.request.contextPath}/main/queryMarketDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
                <th data-options="field:'buy_date',width:100,align:'center'">购车日期</th>
                <th data-options="field:'buy_money',width:100,align:'center'">购车价格</th>
                <th data-options="field:'accept_money',width:100,align:'center'">实际到账</th>
                <th data-options="field:'market_type',width:120,align:'center'" formatter="getMarketTypeName">交易类型</th>
                <th data-options="field:'buy_stage',width:100,align:'center'" formatter="getStageName">购车阶段</th>
                <th data-options="field:'user_id',width:120,align:'center'" formatter="getUserName">负责人</th>
                <th data-options="field:'action_remark',width:80,align:'center'">相关销售活动计划</th>
            </tr>
        </thead>
    </table>
    <div id="dg-toolbar" style="padding:5px;height:auto">
    	<div>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="operation('add','${pageContext.request.contextPath}/main/doAddMarket.do')"><s:text name="BUTTON.ADD"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="operation('edit','${pageContext.request.contextPath}/main/doUpdateMarket.do')"><s:text name="BUTTON.EDIT"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'" onclick="operation('del','${pageContext.request.contextPath}/main/doDeleteMarket.do')"><s:text name="BUTTON.DEL"></s:text></a>
        </div>
        <div>
                                购车日期:<input type="text" id="query_buy_date" onClick="WdatePicker()" name="form.name" style="width:100px">
                                交易类型:<input id="query_buy_type" name="form.now_house_num" style="width:100px" class="easyui-combobox" data-options="valueField:'dictionary_value',textField:'dictionary_name',url:'${pageContext.request.contextPath}/main/queryDictionaryByJson.do?form.dictionaryKey=MARKET_TYPE'">
                                购车阶段:<input id="query_buy_stage" name="form.house_num_position" style="width:100px" class="easyui-combobox" data-options="valueField:'dictionary_value',textField:'dictionary_name',url:'${pageContext.request.contextPath}/main/queryDictionaryByJson.do?form.dictionaryKey=STAGE'">
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="query()"><s:text name="BUTTON.SEARCH"></s:text></a>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="resetQuery()"><s:text name="BUTTON.RESET"></s:text></a>
        </div>
    </div>
    
    
    <div id="dlg" class="easyui-dialog" style="padding:10px" 
    	data-options="width:650,height:400, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">  
	    <form id="dlgFm" action="" method="post">
	    	<input id="dlg_id" type="hidden" name="market.id" value=""></input>
            <fieldset>
	    		<legend>销售过程信息</legend>
	            <table style="border: 1">
	           	  	<tr>  
		                <td align="right">购车日期:</td>  
		                <td align="left">
		                	<input id="dlg_buy_date" onClick="WdatePicker()" type="text" maxlength="256" style="width:100px;" name="market.buy_date" ></input>
		                </td>  
		                <td align="right">负责人<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_user_id" style="width:100px;" name="market.user_id" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'"></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">购车价格:</td>  
		                <td align="left">
		                	<input id="dlg_buy_money" type="text" maxlength="256" style="width:100px;" name="market.buy_money" ></input>
		                </td>  
		                <td align="right">实际收款:</td>  
		                <td align="left">
		                	<input id="dlg_accept_money" type="text" maxlength="256" style="width:100px;" name="market.accept_money" ></input>
		                </td>  
		            </tr> 
		             <tr>  
		                <td align="right">销售阶段<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_buy_stage" style="width:100px;" name="market.buy_stage" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		                <td align="right">交易类型<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_market_type" style="width:100px;" name="market.market_type" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		            </tr>  
		             <tr>  
		                <td align="right">相关销售活动的记录:</td>  
		                <td align="left" colspan="3">
		                	<textarea rows="5" cols="80" id="dlg_action_remark" name="market.action_remark"></textarea>
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
  	var comboboxIds = ["dlg_user_id","dlg_buy_stage","dlg_market_type"];
  	var urls = ["querySelectByJson.do?form.comboboxKey=name&form.comboboxValue=id&form.comboboxTable=t_user_info","queryDictionaryByJson.do?form.dictionaryKey=STAGE","queryDictionaryByJson.do?form.dictionaryKey=MARKET_TYPE"];
  	var rootPath = "${pageContext.request.contextPath}/main/";
  	
  	/**
	 * 查询
	 */
	function query() {
		$("#dg").datagrid({
			pageNumber : 1,
			queryParams : {
				"form.buy_date" : $("#query_buy_date").val(),
				"form.market_type" : $("#query_buy_type").combobox("getValue"),
				"form.buy_stage" : $("#query_buy_stage").combobox("getValue")
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
			loadComBoboxs(comboboxIds,urls,rootPath);
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
							{"market.id":row.id},
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
		loadComBoboxs(comboboxIds,urls,rootPath);
		$.post(
			"${pageContext.request.contextPath}/main/queryMarketByJson.do",
			{"form.id":row.id},
			function(data){
				if(data != null) {
					$("#dlg_id").val(data.id);
					$("#dlg_buy_date").val(data.buy_date);
					$("#dlg_user_id").combobox("setValue",data.user_id);
					$("#dlg_buy_money").val(data.buy_money);
					$("#dlg_accept_money").val(data.accept_money);
					$("#dlg_buy_stage").combobox("setValue",data.buy_stage);
					$("#dlg_market_type").combobox("setValue",data.market_type);
					$("#dlg_action_remark").val(data.action_remark);
				}
			},"json"
		);
	}
  </script>
</html>
