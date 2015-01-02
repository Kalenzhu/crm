package com.mpgl.vo;

/**
 * 销售过程管理Vo
 * 
 * @author 廖陈特
 * 
 */
public class MarketVo {

	private String id;

	private String buy_date;

	private String buy_money;

	private String accept_money;

	private String market_type;

	private String buy_stage;

	private String action_remark;

	private String user_id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public String getBuy_money() {
		return buy_money;
	}

	public void setBuy_money(String buy_money) {
		this.buy_money = buy_money;
	}

	public String getAccept_money() {
		return accept_money;
	}

	public void setAccept_money(String accept_money) {
		this.accept_money = accept_money;
	}

	public String getMarket_type() {
		return market_type;
	}

	public void setMarket_type(String market_type) {
		this.market_type = market_type;
	}

	public String getBuy_stage() {
		return buy_stage;
	}

	public void setBuy_stage(String buy_stage) {
		this.buy_stage = buy_stage;
	}

	public String getAction_remark() {
		return action_remark;
	}

	public void setAction_remark(String action_remark) {
		this.action_remark = action_remark;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
