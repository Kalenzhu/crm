<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-投诉管理</title>
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
            data-options="pagination:true,fit:true,rownumbers:true,border:false,singleSelect:false,striped:true,
            url:'${pageContext.request.contextPath}/main/queryComplainDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
            	<th data-options="field:'ck',checkbox:true"></th>
                <th data-options="field:'title',width:100,align:'center'">投诉主题</th>
                <th data-options="field:'content',width:100,align:'center'">投诉内容</th>
                <th data-options="field:'create_date',width:100,align:'center'">投诉日期</th>
                <th data-options="field:'reply_content',width:120,align:'center'">客服回复内容</th>
                <th data-options="field:'user_id',width:100,align:'center'" formatter="getUserName">回复人</th>
                <th data-options="field:'reply_date',width:120,align:'center'">回复日期</th>
            </tr>
        </thead>
    </table>
    <div id="dg-toolbar" style="padding:5px;height:auto">
    	<div>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="operation('dist','${pageContext.request.contextPath}/main/doReply.do')"><s:text name="BUTTON.REPLY"></s:text></a>
        </div>
        <div>
                                投诉主题:<input type="text" id="query_title" name="form.name" style="width:100px">
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="query()"><s:text name="BUTTON.SEARCH"></s:text></a>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="resetQuery()"><s:text name="BUTTON.RESET"></s:text></a>
        </div>
    </div>
    
    
    
    <div id="dlg" class="easyui-dialog" style="padding:10px" 
    	data-options="width:650,height:180, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">  
	    <form id="dlgFm" action="" method="post">
	    	<input id="dlg_ids" type="hidden" name="complain.ids" value=""></input>
            <fieldset>
	    		<legend>内容填写区</legend>
	            <table style="border: 1">
	           	  	<tr>  
		                <td align="right">回复内容:</td>  
		                <td align="left">
		                	<input id="dlg_reply_content" style="width:200px;" name="complain.reply_content" type="text">
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
				"form.title" : $("#query_title").val()
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
				openDialog("dlg","回复投诉");
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
