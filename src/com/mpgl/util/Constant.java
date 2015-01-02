package com.mpgl.util;

import java.text.SimpleDateFormat;

/**
 * 常量类
 * 
 * @author user
 * 
 */
public interface Constant {

	/**
	 * 项目根路径
	 */
	String PROJECT_ROOT = System.getProperty("user.dir");

	/**
	 * 模版文件夹路径
	 */
	String TEMPLATE_PATH = "template/";

	/**
	 * 默认日期格式
	 */
	SimpleDateFormat DEFAULT_DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * DataGrid数据集KEY
	 */
	String ROW_KEY = "rows";

	/**
	 * DataGrid数据集总条数
	 */
	String ROW_TOTAL = "total";

	/**
	 * SESSION中用户信息存放KEY
	 */
	String USER = "USER_INFO";

	/**
	 * SESSION登录错误信息存放Key
	 */
	String LOGIN = "LOGIN_ERROR";

	/**
	 * 状态码-错误
	 */
	String CODE_EOF = "400";

	/**
	 * 状态码-成功
	 */
	String CODE_WIN = "500";

	/**
	 * 无响应
	 */
	String CODE_NAN = "600";

	/**
	 * 导入数据 列名数组
	 * 
	 * @author user
	 * 
	 */
	public interface ImportColumn {
	}

	/**
	 * 导出数据 列名数组
	 * 
	 * @author user
	 * 
	 */
	public interface ExportColumn {
	}

}