package com.mpgl.main.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mpgl.main.dao.MainDao;
import com.mpgl.main.service.MainService;
import com.mpgl.util.CommonUtil;
import com.mpgl.util.Constant;
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

public class MainServiceImpl implements MainService {

	private MainDao mainDao;

	public MainDao getMainDao() {
		return mainDao;
	}

	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}

	@Override
	public UserVo login(Form form) {
		UserVo user = null;
		List<UserVo> list = mainDao.login(form);
		if (list != null && list.size() > 0) {
			user = list.get(0);
		}
		return user;
	}

	@Override
	public RoleVo getRoleByUser(UserVo user) {
		RoleVo vo = null;
		List<RoleVo> list = mainDao.queryRoleByUser(user);
		if (list != null && list.size() > 0) {
			vo = list.get(0);
		}
		return vo;
	}

	@Override
	public List<MenuVo> getMenuByRole(RoleVo role) {
		List<MenuVo> list = mainDao.queryMenuByRole(role);
		if (list != null && list.size() > 0) {
			for (MenuVo menu : list) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("role_id", role.getId());
				map.put("menu_id", menu.getId());
				menu.setList(mainDao.querySubMenuByMenu(map));
			}
		}
		return list;
	}

	@Override
	public Map<String, Object> queryUserDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryUserList(form);
		int count = mainDao.queryUserListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryUser(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao.queryUserListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void addUser(UserVo vo) {
		mainDao.addUser(vo);
	}

	@Override
	public void updateUser(UserVo vo) {
		mainDao.updateUser(vo);
	}

	@Override
	public void deleteUser(UserVo vo) {
		mainDao.deleteUser(vo);
	}

	@Override
	public List<Map<String, Object>> queryDictionaryByKey(Form form) {
		return mainDao.queryDictionaryByKey(form);
	}

	@Override
	public List<Map<String, Object>> queryRoleList() {
		return mainDao.queryRoleList();
	}

	@Override
	public void updateUserPassword(Map<String, Object> map) {
		mainDao.updateUserPassword(map);
	}

	@Override
	public boolean checkUserName(UserVo user) {
		boolean isCheck = true;
		int count = mainDao.checkUserName(user);
		if (count > 0) {
			isCheck = false;
		}
		return isCheck;
	}

	@Override
	public Map<String, Object> queryCustomerDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryCustomerList(form);
		int count = mainDao.queryCustomerListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryCustomer(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao
				.queryCustomerListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void addCustomer(CustomerVo vo) {
		mainDao.addCustomer(vo);

	}

	@Override
	public void updateCustomer(CustomerVo vo) {
		mainDao.updateCustomer(vo);

	}

	@Override
	public void deleteCustomer(CustomerVo vo) {
		mainDao.deleteCustomer(vo);
	}

	@Override
	public Map<String, Object> queryContactDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryContactList(form);
		int count = mainDao.queryContactListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryContact(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao.queryContactListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void addContact(ContactVo vo) {
		mainDao.addContact(vo);

	}

	@Override
	public void updateContact(ContactVo vo) {
		mainDao.updateContact(vo);

	}

	@Override
	public void deleteContact(ContactVo vo) {
		mainDao.deleteContact(vo);

	}

	@Override
	public List<Map<String, Object>> queryCombobx(Form form) {
		return mainDao.queryCombobx(form);
	}

	@Override
	public Map<String, Object> queryChanceDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryChanceList(form);
		int count = mainDao.queryChanceListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryChance(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao.queryChanceListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void addChance(ChanceVo vo) {
		mainDao.addChance(vo);

	}

	@Override
	public void updateChance(ChanceVo vo) {
		mainDao.updateChance(vo);

	}

	@Override
	public void deleteChance(ChanceVo vo) {
		mainDao.deleteChance(vo);
	}

	@Override
	public void doDistribution(CustomerVo vo) {
		mainDao.doDistribution(vo);

	}

	@Override
	public Map<String, Object> queryComplainDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryComplainList(form);
		int count = mainDao.queryComplainListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryComplain(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao
				.queryComplainListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void replyComplain(ComplainVo vo) {
		mainDao.replyComplain(vo);
	}

	@Override
	public Map<String, Object> queryMessageDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryMessageList(form);
		int count = mainDao.queryMessageListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public void replyMessage(MessageVo vo) {
		mainDao.replyMessage(vo);
	}

	@Override
	public Map<String, Object> queryMaintainDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryMaintainList(form);
		int count = mainDao.queryMaintainListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryMaintain(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao
				.queryMaintainListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void addMaintain(MaintainVo vo) {
		mainDao.addMaintain(vo);
	}

	@Override
	public void updateMaintain(MaintainVo vo) {
		mainDao.updateMaintain(vo);
	}

	@Override
	public void deleteMaintain(MaintainVo vo) {
		mainDao.deleteMaintain(vo);
	}

	@Override
	public List<Map<String, Object>> queryCustomerAnalyze() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "潜在客户");
		map.put("data", mainDao.queryCustomerAnalyze());
		list.add(map);
		return list;
	}

	@Override
	public Map<String, Object> queryMarketDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryMarketList(form);
		int count = mainDao.queryMarketListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryMarket(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao.queryMarketListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void addMarket(MarketVo vo) {
		mainDao.addMarket(vo);
	}

	@Override
	public void updateMarket(MarketVo vo) {
		mainDao.updateMarket(vo);
	}

	@Override
	public void deleteMarket(MarketVo vo) {
		mainDao.deleteMarket(vo);
	}

	@Override
	public List<Map<String, Object>> queryBuyCarAnalyze() {
		String time = CommonUtil.systemDate();
		Form form = new Form();
		form.setDictionaryKey("STAGE");
		List<Map<String, Object>> list = mainDao.queryDictionaryByKey(form);
		for (Map<String, Object> map : list) {
			map.put("nowDate", time);
			map.put("name", map.get("dictionary_name"));
			map.put("data", mainDao.queryBuyCarAnalyze(map));
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> queryBuyCarAnalyze2() {
		String time = CommonUtil.systemDate();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowDate", time);
		map.put("name", "实际到账");
		map.put("column_name", "accept_money");
		map.put("data", mainDao.queryBuyCarAnalyze2(map));
		list.add(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("nowDate", time);
		map2.put("name", "购车价格");
		map2.put("column_name", "buy_money");
		map2.put("data", mainDao.queryBuyCarAnalyze2(map2));
		list.add(map2);
		return list;
	}

	@Override
	public Map<String, Object> queryRoleDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryRoleLists(form);
		int count = mainDao.queryRoleListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryRole(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao.queryRoleListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
			if(form == null) {
				map.put("select", "");
			} else {
				map.put("select", mainDao.queryRoleRefPage(form));
			}
			map.put("pages", mainDao.queryPageList());
		}
		return map;
	}

	@Override
	public void addRole(RoleVo vo) {
		int id = mainDao.addRole(vo);
		if(vo.getIds() != null) {
			for(String submenu_id : vo.getIds()) {
				vo.setSubmenu_id(submenu_id);
				mainDao.addRoleRefPage(vo);
			}
		}
	}

	@Override
	public void updateRole(RoleVo vo) {
		mainDao.updateRole(vo);
		mainDao.deleteRoleRefPage(vo);
		if(vo.getIds() != null) {
			for(String submenu_id : vo.getIds()) {
				vo.setSubmenu_id(submenu_id);
				mainDao.addRoleRefPage(vo);
			}
		}
	}

	@Override
	public void deleteRole(RoleVo vo) {
		mainDao.deleteRole(vo);
		mainDao.deleteRoleRefPage(vo);
	}

	@Override
	public Map<String, Object> queryMarketReturnDataGrid(Form form) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> list = mainDao.queryMarketReturnList(form);
		int count = mainDao.queryMarketReturnListCount(form);
		map.put(Constant.ROW_KEY, list);
		map.put(Constant.ROW_TOTAL, count);
		return map;
	}

	@Override
	public Map<String, Object> queryMarketReturn(Form form) {
		Map<String, Object> map = null;
		List<Map<String, Object>> list = mainDao.queryMarketReturnListBySingle(form);
		if (list != null && list.size() > 0) {
			map = list.get(0);
		}
		return map;
	}

	@Override
	public void addMarketReturn(MarketReturnVo vo) {
		mainDao.addMarketReturn(vo);
	}

	@Override
	public void updateMarketReturn(MarketReturnVo vo) {
		mainDao.updateMarketReturn(vo);
	}

	@Override
	public void deleteMarketReturn(MarketReturnVo vo) {
		mainDao.deleteMarketReturn(vo);
	}
}
