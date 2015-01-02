<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="CommonPage.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title><s:text name="COMMON_TITLE"></s:text>-客户管理</title>
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
            url:'${pageContext.request.contextPath}/main/queryCustomerDataGridByJson.do',method:'post',toolbar:'#dg-toolbar'">
        <thead>
            <tr>
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
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="operation('add','${pageContext.request.contextPath}/main/doAddCustomer.do')"><s:text name="BUTTON.ADD"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="operation('edit','${pageContext.request.contextPath}/main/doUpdateCustomer.do')"><s:text name="BUTTON.EDIT"></s:text></a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'" onclick="operation('del','${pageContext.request.contextPath}/main/doDeleteCustomer.do')"><s:text name="BUTTON.DEL"></s:text></a>
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
    	data-options="width:670,height:500, iconCls:'icon-base', buttons: '#dlg-buttons', modal:true, closed:true, closable:true">  
	    <form id="dlgFm" action="" method="post" >
	    	<input id="dlg_id" type="hidden" name="customer.id" value=""></input>
            <fieldset>
	    		<legend>客户基本信息</legend>
	            <table style="border: 1">
	           	  	<tr>  
		                <td align="right">客户名称:</td>  
		                <td align="left">
		                	<input id="dlg_name" type="text" maxlength="256" style="width:100px;" name="customer.name" ></input>
		                </td>  
		                <td align="right">性别<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_sex" style="width:100px;" name="customer.sex" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">年龄:</td>  
		                <td align="left">
		                	<input id="dlg_age" type="text" maxlength="256" style="width:100px;" name="customer.age" ></input>
		                </td>  
		                <td align="right">电话:</td>  
		                <td align="left">
		                	<input id="dlg_phone" type="text" maxlength="256" style="width:100px;" name="customer.phone" ></input>
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
		                	<input id="dlg_address" type="text" maxlength="256" style="width:100px;" name="customer.address" ></input>
		                </td>  
		                <td align="right">传真:</td>  
		                <td align="left">
		                	<input id="dlg_fax" type="text" maxlength="256" style="width:100px;" name="customer.fax" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">邮箱:</td>  
		                <td align="left">
		                	<input id="dlg_email" type="text" maxlength="256" style="width:100px;" name="customer.email" ></input>
		                </td>  
		                <td align="right">客户网站:</td>  
		                <td align="left">
		                	<input id="dlg_website" type="text" maxlength="256" style="width:100px;" name="customer.website" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">客户收入:</td>  
		                <td align="left">
		                	<input id="dlg_income" type="text" maxlength="256" style="width:100px;" name="customer.income" ></input>
		                </td>  
		                <td align="right">客户积分:</td>  
		                <td align="left">
		                	<input id="dlg_fraction" type="text" maxlength="256" style="width:100px;" name="customer.fraction" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">客户来源:</td>  
		                <td align="left">
		                	<input id="dlg_source" type="text" maxlength="256" style="width:100px;" name="customer.source" ></input>
		                </td>  
		                <td align="right">客户状态:</td>  
		                <td align="left">
		                	<input id="dlg_status" type="text" maxlength="256" style="width:100px;" name="customer.status" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">客户类型<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_type" style="width:100px;" name="customer.type" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		                <td align="right">员工数:</td>  
		                <td align="left">
		                	<input id="dlg_employees" type="text" maxlength="256" style="width:100px;" name="customer.employees" ></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">行业:</td>  
		                <td align="left">
		                	<input id="dlg_trade" type="text" maxlength="256" style="width:100px;" name="customer.trade" ></input>
		                </td>  
		                <td align="right">省份<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_province" style="width:100px;" name="customer.province" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">城市<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_city" style="width:100px;" name="customer.city" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		                <td align="right">区号<font class="ck">*</font>:</td>  
		                <td align="left">
		                	<input id="dlg_city_code" style="width:100px;" name="customer.city_code" class="easyui-combobox"
    							data-options="valueField:'dictionary_value',textField:'dictionary_name'"></input>
		                </td>  
		            </tr>  
		            <tr>  
		                <td align="right">备注:</td>  
		                <td align="left" colspan="3">
		                	<textarea rows="5" cols="80" id="dlg_remark" name="customer.remark"></textarea>
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
  	var comboboxIds = ["dlg_type","dlg_province","dlg_city","dlg_city_code","dlg_sex"];
  	var urls = ["CUSTOMER_TYPE","PROVINCE","CITY","CITY_CODE","SEX"];
  	var rootPath = "${pageContext.request.contextPath}/main/queryDictionaryByJson.do?form.dictionaryKey=";
  	
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
	function loadForm(row) {
		loadComBoboxs(comboboxIds,urls,rootPath);
		$.post(
			"${pageContext.request.contextPath}/main/queryCustomerByJson.do",
			{"form.id":row.id},
			function(data){
				if(data != null) {
					$("#dlg_id").val(data.id);
					$("#dlg_city").combobox("setValue",data.city);
					$("#dlg_name").val(data.name);
					$("#dlg_type").combobox("setValue",data.type);
					$("#dlg_status").val(data.status);
					$("#dlg_sex").combobox("setValue",data.sex);
					$("#dlg_age").val(data.age);
					$("#dlg_phone").val(data.phone);
					$("#dlg_address").val(data.address);
					$("#dlg_fax").val(data.fax);
					$("#dlg_email").val(data.email);
					$("#dlg_remark").val(data.remark);
					$("#dlg_website").val(data.website);
					$("#dlg_income").val(data.income);
					$("#dlg_fraction").val(data.fraction);
					$("#dlg_source").val(data.source);
					$("#dlg_employees").val(data.employees);
					$("#dlg_trade").val(data.trade);
					$("#dlg_province").combobox("setValue",data.province);
					$("#dlg_city_code").combobox("setValue",data.city_code);
				}
			},"json"
		);
	}
	
  </script>
</html>
