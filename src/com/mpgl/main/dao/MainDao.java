package com.mpgl.main.dao;

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
import com.mpgl.vo.SubMenuVo;
import com.mpgl.vo.UserVo;

/**
 * 核心DAO接口
 * 
 * @author 廖陈特
 * 
 */
public interface MainDao {

	/**
	 * 用户登录-查询信息
	 * 
	 * @param form
	 * @return
	 */
	List<UserVo> login(Form form);

	/**
	 * 校验用户账户是否存在
	 * 
	 * @param vo
	 * @return
	 */
	int checkUserName(UserVo vo);

	/**
	 * 修改用户密码
	 * 
	 * @param map
	 */
	void updateUserPassword(Map<String, Object> map);

	/**
	 * 查询用户的角色列表
	 * 
	 * @param user
	 * @return
	 */
	List<RoleVo> queryRoleByUser(UserVo user);

	/**
	 * 查询角色拥有的菜单列表
	 * 
	 * @param role
	 * @return
	 */
	List<MenuVo> queryMenuByRole(RoleVo role);

	/**
	 * 查询菜单的子菜单列表
	 * 
	 * @param map
	 * @return
	 */
	List<SubMenuVo> querySubMenuByMenu(Map<String, Object> map);

	/**
	 * 查询字典表数据
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryDictionaryByKey(Form form);

	/**
	 * 查询用户列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryUserList(Form form);

	/**
	 * 查询不分页数据
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryUserListBySingle(Form form);

	/**
	 * 查询用户列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryUserListCount(Form form);

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
	 * 查询销售过程列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryMarketList(Form form);

	/**
	 * 查询销售过程列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryMarketListCount(Form form);

	/**
	 * 查询销售过程客户
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryMarketListBySingle(Form form);

	void addMarket(MarketVo vo);

	void updateMarket(MarketVo vo);

	void deleteMarket(MarketVo vo);

	/**
	 * 查询客户列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryCustomerList(Form form);

	/**
	 * 查询客户列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryCustomerListCount(Form form);

	/**
	 * 查询单个客户
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryCustomerListBySingle(Form form);

	void addCustomer(CustomerVo vo);

	void updateCustomer(CustomerVo vo);

	void deleteCustomer(CustomerVo vo);

	void doDistribution(CustomerVo vo);

	/**
	 * 查询联系人列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryContactList(Form form);

	/**
	 * 查询联系人列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryContactListCount(Form form);

	/**
	 * 查询单个联系人
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryContactListBySingle(Form form);

	void addContact(ContactVo vo);

	void updateContact(ContactVo vo);

	void deleteContact(ContactVo vo);

	/**
	 * 查询机会列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryChanceList(Form form);

	/**
	 * 查询机会列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryChanceListCount(Form form);

	/**
	 * 查询单个机会
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryChanceListBySingle(Form form);

	void addChance(ChanceVo vo);

	void updateChance(ChanceVo vo);

	void deleteChance(ChanceVo vo);

	/**
	 * 查询维修回访列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryMaintainList(Form form);

	/**
	 * 查询维修回访列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryMaintainListCount(Form form);

	/**
	 * 查询单个维修回访
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryMaintainListBySingle(Form form);

	void addMaintain(MaintainVo vo);

	void updateMaintain(MaintainVo vo);

	void deleteMaintain(MaintainVo vo);
	/**
	 * 查询销售回访列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryMarketReturnList(Form form);
	
	/**
	 * 查询销售回访列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryMarketReturnListCount(Form form);
	
	/**
	 * 查询单个销售回访
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryMarketReturnListBySingle(Form form);
	
	void addMarketReturn(MarketReturnVo vo);
	
	void updateMarketReturn(MarketReturnVo vo);
	
	void deleteMarketReturn(MarketReturnVo vo);

	/**
	 * 查询投诉列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryComplainList(Form form);

	/**
	 * 查询投诉列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryComplainListCount(Form form);

	/**
	 * 查询单个投诉
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryComplainListBySingle(Form form);

	/**
	 * 查询角色列表
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryRoleLists(Form form);

	/**
	 * 查询角色列表条数
	 * 
	 * @param form
	 * @return
	 */
	int queryRoleListCount(Form form);

	/**
	 * 查询单个角色
	 * 
	 * @param form
	 * @return
	 */
	List<Map<String, Object>> queryRoleListBySingle(Form form);

	int addRole(RoleVo vo);

	void updateRole(RoleVo vo);

	void deleteRole(RoleVo vo);
	
	void addRoleRefPage(RoleVo vo);
	
	void deleteRoleRefPage(RoleVo vo);

	/**
	 * 查询页面列表
	 * 
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> queryPageList();

	/**
	 * 查询页面与角色关联列表
	 * 
	 * @param map
	 * @return
	 */
	List<Integer> queryRoleRefPage(Form form);

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
	List<Map<String, Object>> queryMessageList(Form form);

	/**
	 * 查询消息列表个数
	 * 
	 * @param form
	 * @return
	 */
	int queryMessageListCount(Form form);

	/**
	 * 消息回复
	 * 
	 * @param vo
	 */
	void replyMessage(MessageVo vo);

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
	List<Integer> queryCustomerAnalyze();

	/**
	 * 查询购车分析数据
	 * 
	 * @return
	 */
	List<Integer> queryBuyCarAnalyze(Map<String, Object> map);

	/**
	 * 查询购车分析数据
	 * 
	 * @return
	 */
	List<Integer> queryBuyCarAnalyze2(Map<String, Object> map);
}
