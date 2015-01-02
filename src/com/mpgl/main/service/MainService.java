package com.mpgl.main.service;

import java.util.List;
import java.util.Map;

import com.mpgl.vo.ChanceVo;
import com.mpgl.vo.ComplainVo;
import com.mpgl.vo.ContactVo;
import com.mpgl.vo.CustomerVo;
import com.mpgl.vo.Form;
import com.mpgl.vo.MaintainVo;
import com.mpgl.vo.MarketReturnVo;
import com.mpgl.vo.MarketVo;
import com.mpgl.vo.MenuVo;
import com.mpgl.vo.MessageVo;
import com.mpgl.vo.RoleVo;
import com.mpgl.vo.UserVo;

/**
 * 核心Service接口
 * 
 * @author 廖陈特
 * 
 */
public interface MainService {

	/**
	 * 用户登录
	 * 
	 * @param form
	 * @return UserVo 用户信息
	 */
	UserVo login(Form form);

	/**
	 * 检测用户账户是否存在
	 * 
	 * @param user
	 * @return
	 */
	boolean checkUserName(UserVo user);

	/**
	 * 修改用户密码
	 * 
	 * @param map
	 */
	void updateUserPassword(Map<String, Object> map);

	/**
	 * 获取用户的角色
	 * 
	 * @param user
	 * @return
	 */
	RoleVo getRoleByUser(UserVo user);

	/**
	 * 获取角色的菜单权限
	 * 
	 * @param role
	 * @return
	 */
	List<MenuVo> getMenuByRole(RoleVo role);

	/**
	 * 根据KEY查询字典表数据
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryDictionaryByKey(Form form);

	/**
	 * 查询单个用户信息
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryUser(Form form);

	/**
	 * 查询用户列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryUserDataGrid(Form form);

	/**
	 * 查询客户列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryMarketDataGrid(Form form);

	/**
	 * 查询单个客户
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryMarket(Form form);

	void addMarket(MarketVo vo);

	void updateMarket(MarketVo vo);

	void deleteMarket(MarketVo vo);

	/**
	 * 查询客户列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryCustomerDataGrid(Form form);

	/**
	 * 查询单个客户
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryCustomer(Form form);

	void addCustomer(CustomerVo vo);

	void updateCustomer(CustomerVo vo);

	void deleteCustomer(CustomerVo vo);

	/**
	 * 分配客户资源
	 * 
	 * @param vo
	 */
	void doDistribution(CustomerVo vo);

	/**
	 * 查询联系人列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryContactDataGrid(Form form);

	/**
	 * 查询单个联系人
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryContact(Form form);

	void addContact(ContactVo vo);

	void updateContact(ContactVo vo);

	void deleteContact(ContactVo vo);

	/**
	 * 查询机会列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryChanceDataGrid(Form form);

	/**
	 * 查询单个联系人
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryChance(Form form);

	void addChance(ChanceVo vo);

	void updateChance(ChanceVo vo);

	void deleteChance(ChanceVo vo);

	/**
	 * 查询维修回访列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryMaintainDataGrid(Form form);

	/**
	 * 查询单个维修回访信息
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryMaintain(Form form);

	void addMaintain(MaintainVo vo);

	void updateMaintain(MaintainVo vo);

	void deleteMaintain(MaintainVo vo);
	
	/**
	 * 查询维修回访列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryMarketReturnDataGrid(Form form);
	
	/**
	 * 查询单个维修回访信息
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryMarketReturn(Form form);
	
	void addMarketReturn(MarketReturnVo vo);
	
	void updateMarketReturn(MarketReturnVo vo);
	
	void deleteMarketReturn(MarketReturnVo vo);

	/**
	 * 查询角色列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryRoleDataGrid(Form form);

	/**
	 * 查询单个角色信息
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryRole(Form form);

	void addRole(RoleVo vo);

	void updateRole(RoleVo vo);

	void deleteRole(RoleVo vo);

	/**
	 * 查询投诉列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryComplainDataGrid(Form form);

	/**
	 * 查询单个投诉信息
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryComplain(Form form);

	/**
	 * 回复投诉
	 * 
	 * @param vo
	 */
	void replyComplain(ComplainVo vo);

	/**
	 * 查询消息列表
	 * 
	 * @param form
	 * @return
	 */
	Map<String, Object> queryMessageDataGrid(Form form);

	/**
	 * 消息回复
	 * 
	 * @param vo
	 */
	void replyMessage(MessageVo vo);

	/**
	 * 查询角色列表
	 * 
	 * @return
	 */
	List<Map<String, Object>> queryRoleList();

	/**
	 * 新增用户
	 * 
	 * @param vo
	 */
	void addUser(UserVo vo);

	/**
	 * 修改用户
	 * 
	 * @param vo
	 */
	void updateUser(UserVo vo);

	/**
	 * 删除用户
	 * 
	 * @param vo
	 */
	void deleteUser(UserVo vo);

	/**
	 * 查询下拉框数据
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryCombobx(Form form);

	/**
	 * 查询潜在客户分析数据
	 * 
	 * @return
	 */
	List<Map<String, Object>> queryCustomerAnalyze();

	/**
	 * 查询购车分析数据
	 * 
	 * @return
	 */
	List<Map<String, Object>> queryBuyCarAnalyze();

	/**
	 * 查询购车分析数据2
	 * 
	 * @return
	 */
	List<Map<String, Object>> queryBuyCarAnalyze2();

}
