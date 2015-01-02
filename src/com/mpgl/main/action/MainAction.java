package com.mpgl.main.action;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import com.mpgl.base.BaseAction;
import com.mpgl.main.service.MainService;
import com.mpgl.poi.ExcelUtil;
import com.mpgl.util.CommonUtil;
import com.mpgl.util.Constant;
import com.mpgl.vo.ChanceVo;
import com.mpgl.vo.ComplainVo;
import com.mpgl.vo.ContactVo;
import com.mpgl.vo.CustomerVo;
import com.mpgl.vo.MaintainVo;
import com.mpgl.vo.MarketReturnVo;
import com.mpgl.vo.MarketVo;
import com.mpgl.vo.MenuVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.RoleVo;
import com.mpgl.vo.UserVo;

/**
 * 核心Action
 * 
 * @author 廖陈特
 * 
 */
@SuppressWarnings({ "serial" })
public class MainAction extends BaseAction {

	/**
	 * 日志
	 */
	private static Logger log = Logger.getLogger(MainAction.class);

	/**
	 * 核心Service
	 */
	private MainService mainService;
	
	private String error;

	/* 用户相关属性 */

	/**
	 * UserVo
	 */
	private UserVo user;

	/**
	 * 单个用户数据
	 */
	private Map<String, Object> userMap;

	/**
	 * DataGrid用户数据
	 */
	private Map<String, Object> userGrid;

	/**
	 * CustomerVo
	 */
	private CustomerVo customer;

	/**
	 * DataGrid客户数据
	 */
	private Map<String, Object> customerGrid;

	/**
	 * 单个客户数据
	 */
	private Map<String, Object> customerMap;

	/**
	 * ContactVo
	 */
	private ContactVo contact;

	/**
	 * DataGrid联系人数据
	 */
	private Map<String, Object> contactGrid;

	/**
	 * 单个联系人数据
	 */
	private Map<String, Object> contactMap;

	/**
	 * 
	 */
	private ChanceVo chance;

	/**
	 * 
	 */
	private Map<String, Object> chanceGrid;

	/**
	 * 
	 */
	private Map<String, Object> chanceMap;

	/**
	 * 
	 */
	private ComplainVo complain;

	/**
	 * 
	 */
	private Map<String, Object> complainGrid;

	/**
	 * 
	 */
	private Map<String, Object> complainMap;

	/**
	 * 
	 */
	private MaintainVo maintain;

	/**
	 * 
	 */
	private Map<String, Object> maintainGrid;

	/**
	 * 
	 */
	private Map<String, Object> maintainMap;

	/**
	 * 
	 */
	private MarketVo market;

	/**
	 * 
	 */
	private Map<String, Object> marketMap;

	/**
	 * 
	 */
	private Map<String, Object> marketGrid;
	
	/**
	 * 
	 */
	private MarketReturnVo marketReturn;
	
	/**
	 * 
	 */
	private Map<String, Object> marketReturnMap;
	
	/**
	 * 
	 */
	private Map<String, Object> marketReturnGrid;

	/**
	 * 
	 */
	private RoleVo role;

	/**
	 * 
	 */
	private Map<String, Object> roleMap;

	/**
	 * 
	 */
	private Map<String, Object> roleGrid;

	/**
	 * 
	 */
	private MessageVo message;

	/**
	 * 
	 */
	private Map<String, Object> messageGrid;

	/**
	 * 字典表数据
	 */
	private List<Map<String, Object>> dictionaryList;

	/**
	 * 下拉列表数据
	 */
	private List<Map<String, Object>> comboboxs;

	/**
	 * Combobox角色列表数据
	 */
	private List<Map<String, Object>> roleCombobox;

	/* 文件上传用到的相关属性 */

	private File excel;

	private String excelFileName;

	private String excelContentType;

	/* 导出文件相关属性 */
	/**
	 * 返回的文件输入流
	 */
	private InputStream ins;

	/**
	 * 文件名
	 */
	private String fileName;

	/**
	 * 状态码
	 */
	private String code = Constant.CODE_EOF;

	/**
	 * 跳转到欢迎界面
	 * 
	 * @return
	 */
	public String goWelcome() {
		return SUCCESS;
	}

	/*-----------登录相关--------------*/
	/**
	 * 跳转到登录界面
	 * 
	 * @return
	 */
	public String goLogin() {
		session.remove(Constant.LOGIN);
		return SUCCESS;
	}

	/**
	 * 登出
	 * 
	 * @return
	 */
	public String goLoginOut() {
		session.remove(Constant.LOGIN);
		session.remove(Constant.USER);
		return SUCCESS;
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	public String login() {
		user = mainService.login(form);
//		if (user == null) {
//			session.put(Constant.LOGIN, "用户名或者密码错误!");
//			return INPUT;
//		}
		if(user==null) {
			error = "ERROR.LOGIN";
			return INPUT;
		}
		session.put(Constant.USER, user);
		RoleVo role = mainService.getRoleByUser(user);
		List<MenuVo> menus = mainService.getMenuByRole(role);
		role.setMenuList(menus);
		user.setRoleVo(role);
		return SUCCESS;
	}

	/*-----------销售管理相关--------------*/
	/**
	 * 跳转客户资源分配管理界面
	 * 
	 * @return
	 */
	public String goCustomerDistributionManager() {
		return SUCCESS;
	}

	/**
	 * 查询客户资源列表
	 * 
	 * @return
	 */
	public String queryCustomerDistributionDataGridByJson() {
		customerGrid = mainService.queryCustomerDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 分配客户资源
	 * 
	 * @return
	 */
	public String doDistribution() {
		mainService.doDistribution(customer);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 查询单个客户资源信息
	 * 
	 * @return
	 */
	public String queryCustomerDistributionByJson() {
		marketMap = mainService.queryCustomer(this.form);
		return SUCCESS;
	}

	/**
	 * 跳转销售过程管理界面
	 * 
	 * @return
	 */
	public String goMarketManager() {
		return SUCCESS;
	}

	/**
	 * 查询销售过程列表
	 * 
	 * @return
	 */
	public String queryMarketDataGridByJson() {
		marketGrid = mainService.queryMarketDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询单个销售过程信息
	 * 
	 * @return
	 */
	public String queryMarketByJson() {
		marketMap = mainService.queryMarket(this.form);
		return SUCCESS;
	}

	/**
	 * 新增销售过程数据
	 * 
	 * @return
	 */
	public String doAddMarket() {
		mainService.addMarket(market);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 更新销售过程数据
	 * 
	 * @return
	 */
	public String doUpdateMarket() {
		mainService.updateMarket(market);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除销售过程数据
	 * 
	 * @return
	 */
	public String doDeleteMarket() {
		mainService.deleteMarket(market);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 跳转客户管理界面
	 * 
	 * @return
	 */
	public String goCustomerManager() {
		return SUCCESS;
	}

	/**
	 * 查询客户列表
	 * 
	 * @return
	 */
	public String queryCustomerDataGridByJson() {
		customerGrid = mainService.queryCustomerDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询单个客户信息
	 * 
	 * @return
	 */
	public String queryCustomerByJson() {
		customerMap = mainService.queryCustomer(this.form);
		return SUCCESS;
	}

	/**
	 * 新增客户数据
	 * 
	 * @return
	 */
	public String doAddCustomer() {
		UserVo user = (UserVo) session.get(Constant.USER);
		customer.setUser_id(user.getId());
		mainService.addCustomer(customer);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 更新客户数据
	 * 
	 * @return
	 */
	public String doUpdateCustomer() {
		UserVo user = (UserVo) session.get(Constant.USER);
		customer.setUser_id(user.getId());
		mainService.updateCustomer(customer);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除客户数据
	 * 
	 * @return
	 */
	public String doDeleteCustomer() {
		mainService.deleteCustomer(customer);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 跳转联系人管理界面
	 * 
	 * @return
	 */
	public String goContactManager() {
		return SUCCESS;
	}

	/**
	 * 查询联系人列表
	 * 
	 * @return
	 */
	public String queryContactDataGridByJson() {
		contactGrid = mainService.queryContactDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询单个联系人信息
	 * 
	 * @return
	 */
	public String queryContactByJson() {
		contactMap = mainService.queryContact(this.form);
		return SUCCESS;
	}

	/**
	 * 新增联系人数据
	 * 
	 * @return
	 */
	public String doAddContact() {
		mainService.addContact(contact);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 更新联系人数据
	 * 
	 * @return
	 */
	public String doUpdateContact() {
		mainService.updateContact(contact);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除联系人数据
	 * 
	 * @return
	 */
	public String doDeleteContact() {
		mainService.deleteContact(contact);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 跳转机会管理界面
	 * 
	 * @return
	 */
	public String goChanceManager() {
		return SUCCESS;
	}

	/**
	 * 查询机会列表
	 * 
	 * @return
	 */
	public String queryChanceDataGridByJson() {
		chanceGrid = mainService.queryChanceDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询单个机会信息
	 * 
	 * @return
	 */
	public String queryChanceByJson() {
		chanceMap = mainService.queryChance(this.form);
		return SUCCESS;
	}

	/**
	 * 新增机会数据
	 * 
	 * @return
	 */
	public String doAddChance() {
		mainService.addChance(chance);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 更新机会数据
	 * 
	 * @return
	 */
	public String doUpdateChance() {
		mainService.updateChance(chance);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除机会数据
	 * 
	 * @return
	 */
	public String doDeleteChance() {
		mainService.deleteChance(chance);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/*-----------系统管理相关--------------*/
	/**
	 * 跳转用户管理界面
	 * 
	 * @return
	 */
	public String goUserManager() {
		return SUCCESS;
	}

	/**
	 * 新增用户数据
	 * 
	 * @return
	 */
	public String doAddUser() {
		if (mainService.checkUserName(user)) {
			user.setCreate_time(Constant.DEFAULT_DATE_FORMAT.format(new Date()));
			mainService.addUser(user);
			code = Constant.CODE_WIN;
		} else {
			code = "用户帐号已存在";
		}
		return SUCCESS;
	}

	/**
	 * 更新用户数据
	 * 
	 * @return
	 */
	public String doUpdateUser() {
		user.setUpdate_time(Constant.DEFAULT_DATE_FORMAT.format(new Date()));
		mainService.updateUser(user);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除用户数据
	 * 
	 * @return
	 */
	public String doDeleteUser() {
		mainService.deleteUser(user);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 查询单个用户信息[JSON]
	 * 
	 * @return
	 */
	public String queryUserByJson() {
		userMap = mainService.queryUser(this.form);
		return SUCCESS;
	}

	/**
	 * 查询用户列表[JSON]
	 * 
	 * @return
	 */
	public String queryUserDataGridByJson() {
		userGrid = mainService.queryUserDataGrid(this.getForm());
		return SUCCESS;
	}

	/*---服务管理---*/
	/**
	 * 跳转维修回访页面
	 * 
	 * @return
	 */
	public String goMaintainManager() {
		return SUCCESS;
	}

	/**
	 * 查询单个维修回访信息
	 * 
	 * @return
	 */
	public String queryMaintainByJson() {
		maintainMap = mainService.queryMaintain(this.form);
		return SUCCESS;
	}

	/**
	 * 查询维修回访列表
	 * 
	 * @return
	 */
	public String queryMaintainDataGridByJson() {
		maintainGrid = mainService.queryMaintainDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 新增维修回访
	 * 
	 * @return
	 */
	public String doAddMaintain() {
		maintain.setReturn_date(CommonUtil.systemDate());
		mainService.addMaintain(maintain);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 修改维修回访
	 * 
	 * @return
	 */
	public String doUpdateMaintain() {
		maintain.setReturn_date(CommonUtil.systemDate());
		mainService.updateMaintain(maintain);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除维修回访
	 * 
	 * @return
	 */
	public String doDeleteMaintain() {
		mainService.deleteMaintain(maintain);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}
	
	/**
	 * 跳转销售回访页面
	 * 
	 * @return
	 */
	public String goMarketReturnManager() {
		return SUCCESS;
	}

	/**
	 * 查询单个销售回访信息
	 * 
	 * @return
	 */
	public String queryMarketReturnByJson() {
		marketReturnMap = mainService.queryMarketReturn(this.form);
		return SUCCESS;
	}

	/**
	 * 查询销售回访列表
	 * 
	 * @return
	 */
	public String queryMarketReturnDataGridByJson() {
		marketReturnGrid = mainService.queryMarketReturnDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 新增销售回访
	 * 
	 * @return
	 */
	public String doAddMarketReturn() {
		marketReturn.setReturn_date(CommonUtil.systemDate());
		mainService.addMarketReturn(marketReturn);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 修改销售回访
	 * 
	 * @return
	 */
	public String doUpdateMarketReturn() {
		marketReturn.setReturn_date(CommonUtil.systemDate());
		mainService.updateMarketReturn(marketReturn);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除销售回访
	 * 
	 * @return
	 */
	public String doDeleteMarketReturn() {
		mainService.deleteMarketReturn(marketReturn);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 跳转投诉管理界面
	 * 
	 * @return
	 */
	public String goComplainManager() {
		return SUCCESS;
	}

	/**
	 * 查询投诉列表
	 * 
	 * @return
	 */
	public String queryComplainDataGridByJson() {
		complainGrid = mainService.queryComplainDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询单个投诉信息
	 * 
	 * @return
	 */
	public String queryComplainByJson() {
		complainMap = mainService.queryComplain(this.form);
		return SUCCESS;
	}

	/**
	 * 回复投诉
	 * 
	 * @return
	 */
	public String doReply() {
		UserVo user = (UserVo) session.get(Constant.USER);
		complain.setUser_id(user.getId());
		complain.setReply_date(CommonUtil.systemDate());
		mainService.replyComplain(complain);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/*---日常工具---*/
	/**
	 * 跳转消息回复页面
	 * 
	 * @return
	 */
	public String goMessageReply() {
		return SUCCESS;
	}

	/**
	 * 跳转消息查看界面
	 * 
	 * @return
	 */
	public String goMessageLook() {
		return SUCCESS;
	}

	/**
	 * 查询消息列表
	 * 
	 * @return
	 */
	public String queryMessageLookDataGridByJson() {
		UserVo user = (UserVo) session.get(Constant.USER);
		this.getForm().setUser_id(user.getId());
		messageGrid = mainService.queryMessageDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 回复消息管理
	 * 
	 * @return
	 */
	public String doReplyMessage() {
		UserVo user = (UserVo) session.get(Constant.USER);
		message.setUser_id(user.getId());
		message.setReply_date(CommonUtil.systemDate());
		mainService.replyMessage(message);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 决策分析图标数据 Map
	 */
	private Map<String, Object> reportMap = new HashMap<String, Object>();

	/**
	 * 决策分析图标数据
	 */
	private List<Map<String, Object>> reportList = new ArrayList<Map<String, Object>>();

	/* 决策分析 */
	/**
	 * 跳转客户分析页面
	 * 
	 * @return
	 */
	public String goCustomerAnalyze() {
		return SUCCESS;
	}

	/**
	 * 查询客户分析数据
	 * 
	 * @return
	 */
	public String queryCustomerAnalyze() {
		reportList = mainService.queryCustomerAnalyze();
		return SUCCESS;
	}

	/**
	 * 跳转销售回访分析页面
	 * 
	 * @return
	 */
	public String goMarketAnalyze() {
		return SUCCESS;
	}

	/**
	 * 跳转购车分析页面
	 * 
	 * @return
	 */
	public String goBuyCarAnalyze() {
		return SUCCESS;
	}

	/**
	 * 查询购车分析数据
	 * 
	 * @return
	 */
	public String queryBuyCarAnalyze() {
		reportList = mainService.queryBuyCarAnalyze();
		return SUCCESS;
	}

	/**
	 * 查询购车分析数据2
	 * 
	 * @return
	 */
	public String queryBuyCarAnalyze2() {
		reportList = mainService.queryBuyCarAnalyze2();
		return SUCCESS;
	}

	/**
	 * 跳转服务回访分析页面
	 * 
	 * @return
	 */
	public String goServiceCarAnalyze() {
		return SUCCESS;
	}

	/**
	 * 查询角色列表[JSON]
	 * 
	 * @return
	 */
	public String queryRoleListByJson() {
		roleCombobox = mainService.queryRoleList();
		return SUCCESS;
	}

	/**
	 * 跳转角色管理界面
	 * 
	 * @return
	 */
	public String goRoleManager() {
		return SUCCESS;
	}

	/**
	 * 查询角色列表
	 * 
	 * @return
	 */
	public String queryRoleDataGridByJson() {
		roleGrid = mainService.queryRoleDataGrid(this.getForm());
		return SUCCESS;
	}

	/**
	 * 查询单个角色信息
	 * 
	 * @return
	 */
	public String queryRoleByJson() {
		roleMap = mainService.queryRole(this.form);
		return SUCCESS;
	}

	/**
	 * 新增角色数据
	 * 
	 * @return
	 */
	public String doAddRole() {
		mainService.addRole(role);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 更新角色数据
	 * 
	 * @return
	 */
	public String doUpdateRole() {
		mainService.updateRole(role);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 删除角色数据
	 * 
	 * @return
	 */
	public String doDeleteRole() {
		mainService.deleteRole(role);
		code = Constant.CODE_WIN;
		return SUCCESS;
	}

	/**
	 * 查询字典表数据[JSON]
	 * 
	 * @return
	 */
	public String queryDictionaryByJson() {
		dictionaryList = mainService.queryDictionaryByKey(form);
		return SUCCESS;
	}

	/**
	 * 查询SELECT控件数据
	 * 
	 * @return
	 */
	public String querySelectByJson() {
		comboboxs = mainService.queryCombobx(form);
		return SUCCESS;
	}

	/**
	 * 查询用户密码
	 * 
	 * @return
	 */
	public String doQueryPwd() {
		user = (UserVo) session.get(Constant.USER);
		return SUCCESS;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 */
	public String doUpdatePassword() {
		try {
			UserVo user = (UserVo) session.get(Constant.USER);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", user.getId());
			map.put("password", this.getForm().getPassword());
			mainService.updateUserPassword(map);
			user.setPassword(this.getForm().getPassword());
			code = Constant.CODE_WIN;
		} catch (Exception e) {
			log.error("修改密码错误:", e);
			code = Constant.CODE_EOF;
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public MainService getMainService() {
		return mainService;
	}

	public void setMainService(MainService mainService) {
		this.mainService = mainService;
	}

	public UserVo getUser() {
		return user;
	}

	public void setUser(UserVo user) {
		this.user = user;
	}

	public File getExcel() {
		return excel;
	}

	public void setExcel(File excel) {
		this.excel = excel;
	}

	public String getExcelFileName() {
		return excelFileName;
	}

	public void setExcelFileName(String excelFileName) {
		this.excelFileName = excelFileName;
	}

	public String getExcelContentType() {
		return excelContentType;
	}

	public void setExcelContentType(String excelContentType) {
		this.excelContentType = excelContentType;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Map<String, Object> getUserGrid() {
		return userGrid;
	}

	public void setUserGrid(Map<String, Object> userGrid) {
		this.userGrid = userGrid;
	}

	public List<Map<String, Object>> getRoleCombobox() {
		return roleCombobox;
	}

	public void setRoleCombobox(List<Map<String, Object>> roleCombobox) {
		this.roleCombobox = roleCombobox;
	}

	public Map<String, Object> getUserMap() {
		return userMap;
	}

	public void setUserMap(Map<String, Object> userMap) {
		this.userMap = userMap;
	}

	public List<Map<String, Object>> getDictionaryList() {
		return dictionaryList;
	}

	public void setDictionaryList(List<Map<String, Object>> dictionaryList) {
		this.dictionaryList = dictionaryList;
	}

	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		MainAction.log = log;
	}

	public InputStream getIns() {
		return ins;
	}

	public void setIns(InputStream ins) {
		this.ins = ins;
	}

	public String getFileName() {
		try {
			fileName = new String(fileName.getBytes(), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			log.error("导出文件名转码错误", e);
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Map<String, Object> getCustomerGrid() {
		return customerGrid;
	}

	public void setCustomerGrid(Map<String, Object> customerGrid) {
		this.customerGrid = customerGrid;
	}

	public CustomerVo getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerVo customer) {
		this.customer = customer;
	}

	public Map<String, Object> getCustomerMap() {
		return customerMap;
	}

	public void setCustomerMap(Map<String, Object> customerMap) {
		this.customerMap = customerMap;
	}

	public ContactVo getContact() {
		return contact;
	}

	public void setContact(ContactVo contact) {
		this.contact = contact;
	}

	public Map<String, Object> getContactGrid() {
		return contactGrid;
	}

	public void setContactGrid(Map<String, Object> contactGrid) {
		this.contactGrid = contactGrid;
	}

	public Map<String, Object> getContactMap() {
		return contactMap;
	}

	public void setContactMap(Map<String, Object> contactMap) {
		this.contactMap = contactMap;
	}

	public ChanceVo getChance() {
		return chance;
	}

	public void setChance(ChanceVo chance) {
		this.chance = chance;
	}

	public Map<String, Object> getChanceGrid() {
		return chanceGrid;
	}

	public void setChanceGrid(Map<String, Object> chanceGrid) {
		this.chanceGrid = chanceGrid;
	}

	public Map<String, Object> getChanceMap() {
		return chanceMap;
	}

	public void setChanceMap(Map<String, Object> chanceMap) {
		this.chanceMap = chanceMap;
	}

	public List<Map<String, Object>> getComboboxs() {
		return comboboxs;
	}

	public void setComboboxs(List<Map<String, Object>> comboboxs) {
		this.comboboxs = comboboxs;
	}

	public Map<String, Object> getComplainGrid() {
		return complainGrid;
	}

	public void setComplainGrid(Map<String, Object> complainGrid) {
		this.complainGrid = complainGrid;
	}

	public Map<String, Object> getComplainMap() {
		return complainMap;
	}

	public void setComplainMap(Map<String, Object> complainMap) {
		this.complainMap = complainMap;
	}

	public ComplainVo getComplain() {
		return complain;
	}

	public void setComplain(ComplainVo complain) {
		this.complain = complain;
	}

	public MessageVo getMessage() {
		return message;
	}

	public void setMessage(MessageVo message) {
		this.message = message;
	}

	public Map<String, Object> getMessageGrid() {
		return messageGrid;
	}

	public void setMessageGrid(Map<String, Object> messageGrid) {
		this.messageGrid = messageGrid;
	}

	public MaintainVo getMaintain() {
		return maintain;
	}

	public void setMaintain(MaintainVo maintain) {
		this.maintain = maintain;
	}

	public Map<String, Object> getMaintainGrid() {
		return maintainGrid;
	}

	public void setMaintainGrid(Map<String, Object> maintainGrid) {
		this.maintainGrid = maintainGrid;
	}

	public Map<String, Object> getMaintainMap() {
		return maintainMap;
	}

	public void setMaintainMap(Map<String, Object> maintainMap) {
		this.maintainMap = maintainMap;
	}

	public Map<String, Object> getReportMap() {
		return reportMap;
	}

	public void setReportMap(Map<String, Object> reportMap) {
		this.reportMap = reportMap;
	}

	public List<Map<String, Object>> getReportList() {
		return reportList;
	}

	public void setReportList(List<Map<String, Object>> reportList) {
		this.reportList = reportList;
	}

	public MarketVo getMarket() {
		return market;
	}

	public void setMarket(MarketVo market) {
		this.market = market;
	}

	public Map<String, Object> getMarketMap() {
		return marketMap;
	}

	public void setMarketMap(Map<String, Object> marketMap) {
		this.marketMap = marketMap;
	}

	public Map<String, Object> getMarketGrid() {
		return marketGrid;
	}

	public void setMarketGrid(Map<String, Object> marketGrid) {
		this.marketGrid = marketGrid;
	}

	public RoleVo getRole() {
		return role;
	}

	public void setRole(RoleVo role) {
		this.role = role;
	}

	public Map<String, Object> getRoleMap() {
		return roleMap;
	}

	public void setRoleMap(Map<String, Object> roleMap) {
		this.roleMap = roleMap;
	}

	public Map<String, Object> getRoleGrid() {
		return roleGrid;
	}

	public void setRoleGrid(Map<String, Object> roleGrid) {
		this.roleGrid = roleGrid;
	}

	public MarketReturnVo getMarketReturn() {
		return marketReturn;
	}

	public void setMarketReturn(MarketReturnVo marketReturn) {
		this.marketReturn = marketReturn;
	}

	public Map<String, Object> getMarketReturnMap() {
		return marketReturnMap;
	}

	public void setMarketReturnMap(Map<String, Object> marketReturnMap) {
		this.marketReturnMap = marketReturnMap;
	}

	public Map<String, Object> getMarketReturnGrid() {
		return marketReturnGrid;
	}

	public void setMarketReturnGrid(Map<String, Object> marketReturnGrid) {
		this.marketReturnGrid = marketReturnGrid;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}
}
