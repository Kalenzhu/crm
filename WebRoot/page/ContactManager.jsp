<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-联系人管理</title>
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
            url:'${pageContext.request.contextPath}/main/queryContactDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
                <th data-options="field:'name',width:100,align:'center'">联系人姓名</th>
                <th data-options="field:'sex',width:100,align:'center'" formatter="getSexName">性别</th>
                <th data-options="field:'age',width:100,align:'center'">年龄</th>
                <th data-options="field:'phone',width:120,align:'center'">联系电话</th>
                <th data-options="field:'address',width:100,align:'center'">地址</th>
                <th data-options="field:'fax',width:120,align:'center'">传真</th>
                <th data-options="field:'email',width:80,align:'center'">邮件</th>
                <th data-options="field:'department',width:80,align:'center'">部门</th>
                <th data-options="field:'customer_id',width:80,align:'center'" formatter="getCustomerName">客户</th>
                <th data-options="field:'conutry',width:100,align:'center'" formatter="getConutryName">国家</th>
                <th data-options="field:'province',width:100,align:'center'" formatter="getProvinceName">省份</th>
                <th data-options="field:'city',width:100,align:'center'" formatter="getCityName">城市</th>
                <th data-options="field:'city_code',width:100,align:'center'" formatter="getCityCodeName">区号</th>
                <th data-options="field:'remark',width:100,align:'center'">备注</th>
            </tr>
        </thead>
    </table>
    <div id="dg-toolbar" style="padding:5px;height:auto">
    	<div>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="operation('add','${pageContext.request.contextPath}/main/doAddContact.do')"><s:text name="BUTTON.ADD"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="operation('edit','${pageContext.request.contextPath}/main/doUpdateContact.do')"><s:text name="BUTTON.EDIT"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'" onclick="operation('del','${pageContext.request.contextPath}/main/doDeleteContact.do')"><s:text name="BUTTON.DEL"></s:text></a>
        </div>
        <div>
                                联系人名称:<input id="query_name" name="form.name" style="width:100px" type="text"/>
        	电话:<input type="text" id="query_phone" name="form.property_name" style="width:100px"/>
                                客户:<input  id="query_customer" name="form.now_house_num" style="width:100px" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'"> 
                               城市:<input id="query_city" name="form.house_num_position" style="width:100px" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'">
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="query()"><s:text name="BUTTON.SEARCH"></s:text></a>
           	<a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'" onclick="resetQuery()"><s:text name="BUTTON.RESET"></s:text></a>
        </div>
    </div>
    
    
    <div id="dlg" class="easyui-dialog" style="padding:10px" 
    	data-options="width:650,height:500, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">  
	    <form id="dlgFm" action="" method="post">
	    	<input id="dlg_id" type="hidden" name="contact.id" value=""></input>
            <fieldset>
	    		<legend>联系人基本信息</legend>
	            <table style="border: 1">
	           	  	<tr>  
		                <td align="right">名称:</td>  
		                <td align="left">
		                	<input id="dlg_name" type="text" maxlength="256" style="width:100px;" name="contact.name" ></input>
		                </td>  
		                <td align="right">性别<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_sex" style="width:100px;" name="contact.sex" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">年龄:</td>  
		                <td align="left">
		                	<input id="dlg_age" type="text" maxlength="256" style="width:100px;" name="contact.age" ></input>
		                </td>  
		                <td align="right">电话:</td>  
		                <td align="left">
		                	<input id="dlg_phone" type="text" maxlength="256" style="width:100px;" name="contact.phone" ></input>
		                </td>  
		            </tr> 
	          	</table>
	       </fieldset>
	        <br>
	       <fieldset>
    	  	   <legend>其他信息</legend>
	           <table style="border: 1">
		            <tr>  
		                <td align="right">地址:</td>  
		                <td align="left">
		                	<input id="dlg_address" type="text" maxlength="256" style="width:100px;" name="contact.address" ></input>
		                </td>  
		                <td align="right">传真:</td>  
		                <td align="left">
		                	<input id="dlg_fax" type="text" maxlength="256" style="width:100px;" name="contact.fax" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">邮箱:</td>  
		                <td align="left">
		                	<input id="dlg_email" type="text" maxlength="256" style="width:100px;" name="contact.email" ></input>
		                </td>  
		                <td align="right">部门:</td>  
		                <td align="left">
		                	<input id="dlg_department" type="text" maxlength="256" style="width:100px;" name="contact.department" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">国家<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_conutry" style="width:100px;" name="contact.conutry" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		                <td align="right">省份<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_province" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'" style="width:100px;" name="contact.province" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">城市<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_city" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'" style="width:100px;" name="contact.city" ></input>
		                </td>  
		                <td align="right">区号<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_city_code" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'" style="width:100px;" name="contact.city_code" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">客户<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_customer_id" class="easyui-combobox"
    							data-options="valueField:'valueField',textField:'textField'" style="width:100px;" name="contact.customer_id" ></input>
		                </td>  
		               	<td></td> 
		               	<td></td> 
		            </tr>    
		            <tr>  
		                <td align="right">备注:</td>  
		                <td align="left" colspan="3">
		                	<textarea rows="5" cols="80" id="dlg_remark" name="contact.remark"></textarea>
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
  	var queryIds = ["query_customer","query_city"];
  	var queryUrls = ["querySelectByJson.do?form.comboboxKey=name&form.comboboxValue=id&form.comboboxTable=t_customer_info", "queryDictionaryByJson.do?form.dictionaryKey=CITY"];
  	var queryPath = "${pageContext.request.contextPath}/main/";
  	var dlgIds = ["dlg_sex","dlg_conutry","dlg_province","dlg_city","dlg_city_code","dlg_customer_id"];
  	var dlgUrls = ["queryDictionaryByJson.do?form.dictionaryKey=SEX","queryDictionaryByJson.do?form.dictionaryKey=CONUTRY","queryDictionaryByJson.do?form.dictionaryKey=PROVINCE"
  			,"queryDictionaryByJson.do?form.dictionaryKey=CITY","queryDictionaryByJson.do?form.dictionaryKey=CITY_CODE","querySelectByJson.do?form.comboboxKey=name&form.comboboxValue=id&form.comboboxTable=t_customer_info"];
  	var dlgPath = "${pageContext.request.contextPath}/main/";
  	
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
				"form.name" : $("#query_name").val(),
				"form.phone" : $("#query_phone").val(),
				"form.customer_id" : $("#query_customer").combobox("getValue"),
				"form.city" : $("#query_city").combobox("getValue")
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
			loadComBoboxs(dlgIds,dlgUrls,dlgPath);
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
		loadComBoboxs(dlgIds,dlgUrls,dlgPath);
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
