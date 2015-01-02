/*
SQLyog v10.2 
MySQL - 5.5.15 : Database - crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm`;

/*Table structure for table `t_chance_info` */

DROP TABLE IF EXISTS `t_chance_info`;

CREATE TABLE `t_chance_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '机会名称',
  `customer_id` varchar(256) DEFAULT NULL COMMENT '客户ID',
  `probability` varchar(256) DEFAULT NULL COMMENT '发展概率',
  `start_date` varchar(256) DEFAULT NULL COMMENT '开始日期',
  `end_date` varchar(256) DEFAULT NULL COMMENT '结束日期',
  `contact_id` varchar(256) DEFAULT NULL COMMENT '联系人ID',
  `remark` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_chance_info` */

insert  into `t_chance_info`(`id`,`name`,`customer_id`,`probability`,`start_date`,`end_date`,`contact_id`,`remark`) values (3,'沙听海语','8','90','','','5',''),(4,'不得反日货RFBDKW','8','40','','','6',''),(6,'BSKJDVNJ','11','30','','','5','');

/*Table structure for table `t_complain_info` */

DROP TABLE IF EXISTS `t_complain_info`;

CREATE TABLE `t_complain_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL COMMENT '投诉主题',
  `content` varchar(256) DEFAULT NULL COMMENT '投诉内容',
  `create_date` varchar(256) DEFAULT NULL COMMENT '投诉创建日期',
  `reply_content` varchar(256) DEFAULT NULL COMMENT '回复内容',
  `user_id` int(11) DEFAULT NULL COMMENT '回复人ID',
  `reply_date` varchar(256) DEFAULT NULL COMMENT '回复日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_complain_info` */

insert  into `t_complain_info`(`id`,`title`,`content`,`create_date`,`reply_content`,`user_id`,`reply_date`) values (1,'title','content','create_date','eeee',1,'2014-04-10');

/*Table structure for table `t_contact_info` */

DROP TABLE IF EXISTS `t_contact_info`;

CREATE TABLE `t_contact_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `sex` varchar(256) DEFAULT NULL COMMENT '性别',
  `age` varchar(256) DEFAULT NULL COMMENT '年龄',
  `department` varchar(256) DEFAULT NULL COMMENT '部门',
  `conutry` varchar(256) DEFAULT NULL COMMENT '国家',
  `province` varchar(256) DEFAULT NULL COMMENT '省份',
  `city` varchar(256) DEFAULT NULL COMMENT '城市',
  `city_code` varchar(256) DEFAULT NULL COMMENT '区号',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `phone` varchar(256) DEFAULT NULL COMMENT '电话',
  `fax` varchar(256) DEFAULT NULL COMMENT '传真',
  `email` varchar(256) DEFAULT NULL COMMENT '邮件',
  `remark` varchar(256) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_contact_info` */

insert  into `t_contact_info`(`id`,`name`,`sex`,`age`,`department`,`conutry`,`province`,`city`,`city_code`,`address`,`phone`,`fax`,`email`,`remark`,`customer_id`) values (4,'马秋欢','2','80','','1','1','1','1','','12334567','','','',12),(5,'王静','1','23','','1','1','1','1','','12344565677','','','',11),(6,'王伟','2','80','','1','1','1','1','','34659346754392758','','','',9);

/*Table structure for table `t_customer_info` */

DROP TABLE IF EXISTS `t_customer_info`;

CREATE TABLE `t_customer_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '客户名',
  `sex` varchar(256) DEFAULT NULL COMMENT '性别',
  `age` varchar(256) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(256) DEFAULT NULL COMMENT '电话',
  `address` varchar(256) DEFAULT NULL COMMENT '住址',
  `fax` varchar(256) DEFAULT NULL COMMENT '传真',
  `email` varchar(256) DEFAULT NULL COMMENT '邮件',
  `remark` varchar(256) DEFAULT NULL,
  `website` varchar(256) DEFAULT NULL COMMENT '客户网站',
  `income` varchar(256) DEFAULT NULL COMMENT '客户收入',
  `fraction` varchar(256) DEFAULT NULL COMMENT '客户积分',
  `source` varchar(256) DEFAULT NULL COMMENT '状态',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `status` varchar(256) DEFAULT NULL COMMENT '客户状态',
  `type` varchar(256) DEFAULT NULL COMMENT '客户类型',
  `employees` varchar(256) DEFAULT NULL COMMENT '员工数',
  `trade` varchar(256) DEFAULT NULL COMMENT '行业',
  `city` varchar(256) DEFAULT NULL COMMENT '城市',
  `province` varchar(256) DEFAULT NULL COMMENT '省份',
  `city_code` varchar(256) DEFAULT NULL COMMENT '区号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_info` */

insert  into `t_customer_info`(`id`,`name`,`sex`,`age`,`phone`,`address`,`fax`,`email`,`remark`,`website`,`income`,`fraction`,`source`,`user_id`,`status`,`type`,`employees`,`trade`,`city`,`province`,`city_code`) values (5,'liaoct','1','24','15651775791','','','','','','12345','','',1,'','2','','','1','1','2'),(6,'季玉德','1','27','17892700123','','','','','','11223','','',1,'','3','','','2','2','1'),(7,'周海燕','2','24','13873004371','','','','','','5500','','',1,'','3','','','2','2','1'),(8,'秦燕','2','27','15274073043','','','','','','7000','','',1,'','4','','','1','2','2'),(9,'刘元龙','1','60','13872004371','','','','','','6000','','',1,'','2','','','1','2','1'),(10,'饶沙','2','27','15276586209','','','','','','6000','','',1,'','2','','','2','1','1'),(11,'李秀丽','2','50','15274073043','','','','','','2000','','',1,'','1','','','1','1','2'),(12,'换换','2','40','15951775791','','','','','','90000','','',1,'','4','','','1','2','1'),(13,'王君健','2','30','13874097890','','','','','','8000','','',1,'','1','','','2','1','2');

/*Table structure for table `t_dictionary_info` */

DROP TABLE IF EXISTS `t_dictionary_info`;

CREATE TABLE `t_dictionary_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dictionary_key` varchar(64) NOT NULL COMMENT '数据字典键值',
  `dictionary_value` varchar(256) DEFAULT NULL COMMENT '数据字典数值',
  `dictionary_name` varchar(256) DEFAULT NULL COMMENT '数据字典名称',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `t_dictionary_info` */

insert  into `t_dictionary_info`(`id`,`dictionary_key`,`dictionary_value`,`dictionary_name`,`description`) values (15,'CUSTOMER_TYPE','1','潜在客户','客户类型'),(16,'CUSTOMER_TYPE','2','休眠客户','客户类型'),(17,'CUSTOMER_TYPE','3','已购车客户','客户类型'),(19,'CUSTOMER_TYPE','4','总部下发客户','客户类型'),(20,'CONUTRY','1','中国','国家'),(21,'PROVINCE','1','北京','省份'),(22,'PROVINCE','2','上海','省份'),(23,'CITY','1','长沙','城市'),(24,'CITY','2','南京','城市'),(25,'CITY_CODE','1','10010','区号'),(26,'CITY_CODE','2','10086','区号'),(27,'SEX','1','男',NULL),(28,'SEX','2','女',NULL),(29,'STAGE','1','预定','销售阶段'),(30,'STAGE','2','已交订金','销售阶段'),(31,'STAGE','3','已交全额','销售阶段'),(32,'STAGE','4','已提车','销售阶段'),(33,'STAGE','5','回馈服务体验','销售阶段'),(34,'STAGE','6','交易结束','销售阶段'),(35,'MARKET_TYPE','1','个人销售机会','交易类型'),(36,'MARKET_TYPE','2','推荐销售机会','交易类型'),(37,'MARKET_TYPE','3','总部下发销售机会','交易类型'),(38,'ISLOCK','1','是','是否锁定'),(39,'ISLOCK','0','否','是否锁定');

/*Table structure for table `t_maintain_info` */

DROP TABLE IF EXISTS `t_maintain_info`;

CREATE TABLE `t_maintain_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_date` varchar(256) DEFAULT NULL COMMENT '回访日期',
  `return_title` varchar(256) DEFAULT NULL COMMENT '回访主题',
  `return_content` varchar(256) DEFAULT NULL COMMENT '回访内容',
  `project_description` varchar(256) DEFAULT NULL COMMENT '维修项目描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_maintain_info` */

insert  into `t_maintain_info`(`id`,`return_date`,`return_title`,`return_content`,`project_description`) values (2,'2014-04-14','111','11','111122');

/*Table structure for table `t_market_info` */

DROP TABLE IF EXISTS `t_market_info`;

CREATE TABLE `t_market_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy_date` varchar(256) DEFAULT NULL COMMENT '购车日期',
  `buy_money` varchar(256) DEFAULT NULL COMMENT '购车价格',
  `accept_money` varchar(256) DEFAULT NULL COMMENT '实际到账',
  `market_type` varchar(256) DEFAULT NULL COMMENT '交易类型',
  `buy_stage` varchar(256) DEFAULT NULL COMMENT '购车进行阶段',
  `action_remark` varchar(256) DEFAULT NULL COMMENT '相关销售活动的记录',
  `user_id` varchar(256) DEFAULT NULL COMMENT '负责人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_market_info` */

insert  into `t_market_info`(`id`,`buy_date`,`buy_money`,`accept_money`,`market_type`,`buy_stage`,`action_remark`,`user_id`) values (2,'2014-02-02','400000','200000','1','3','124124','1'),(3,'2014-04-11','212','12','1','1','1212','1');

/*Table structure for table `t_marketreturn_info` */

DROP TABLE IF EXISTS `t_marketreturn_info`;

CREATE TABLE `t_marketreturn_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_date` varchar(256) DEFAULT NULL COMMENT '回访日期',
  `return_title` varchar(256) DEFAULT NULL COMMENT '回访主题',
  `return_content` varchar(256) DEFAULT NULL COMMENT '回访内容',
  `project_description` varchar(256) DEFAULT NULL COMMENT '销售回访项目描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_marketreturn_info` */

/*Table structure for table `t_menu_info` */

DROP TABLE IF EXISTS `t_menu_info`;

CREATE TABLE `t_menu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL COMMENT '菜单名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `t_menu_info` */

insert  into `t_menu_info`(`id`,`name`) values (1,'销售管理'),(2,'服务管理'),(3,'决策分析'),(4,'日常工具'),(5,'系统管理');

/*Table structure for table `t_message_info` */

DROP TABLE IF EXISTS `t_message_info`;

CREATE TABLE `t_message_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `content` varchar(256) DEFAULT NULL COMMENT '内容',
  `create_date` varchar(256) DEFAULT NULL COMMENT '创建日期',
  `reply_content` varchar(256) DEFAULT NULL COMMENT '回复内容',
  `reply_date` varchar(256) DEFAULT NULL COMMENT '回复日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_message_info` */

insert  into `t_message_info`(`id`,`customer_id`,`user_id`,`content`,`create_date`,`reply_content`,`reply_date`) values (1,8,1,'adasd',NULL,'111','2014-04-18');

/*Table structure for table `t_role_info` */

DROP TABLE IF EXISTS `t_role_info`;

CREATE TABLE `t_role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `t_role_info` */

insert  into `t_role_info`(`id`,`name`) values (1,'管理员'),(2,'总经理'),(3,'销售经理'),(4,'销售顾问'),(5,'客服经理'),(6,'客服顾问');

/*Table structure for table `t_role_submenu_rec` */

DROP TABLE IF EXISTS `t_role_submenu_rec`;

CREATE TABLE `t_role_submenu_rec` (
  `submenu_id` int(11) NOT NULL COMMENT '子菜单ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`submenu_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与子菜单关联表';

/*Data for the table `t_role_submenu_rec` */

insert  into `t_role_submenu_rec`(`submenu_id`,`role_id`) values (1,1),(1,2),(2,1),(3,1),(4,1),(5,1),(5,2),(6,1),(7,1),(9,1),(10,1),(10,2),(11,1),(11,2),(14,1),(15,1),(17,1),(18,1);

/*Table structure for table `t_submenu_info` */

DROP TABLE IF EXISTS `t_submenu_info`;

CREATE TABLE `t_submenu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL COMMENT '子菜单名',
  `menu_id` int(11) NOT NULL COMMENT '父菜单ID',
  `path` varchar(256) DEFAULT NULL COMMENT '子菜单关联的页面',
  `order_num` int(11) DEFAULT NULL,
  `code` varchar(256) DEFAULT NULL COMMENT '编码-客户端用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='子菜单表';

/*Data for the table `t_submenu_info` */

insert  into `t_submenu_info`(`id`,`name`,`menu_id`,`path`,`order_num`,`code`) values (1,'客户管理',1,'/main/goCustomerManager.do',1,NULL),(2,'机会管理',1,'/main/goChanceManager.do',2,NULL),(3,'联系人管理',1,'/main/goContactManager.do',3,NULL),(4,'销售过程管理',1,'/main/goMarketManager.do',4,NULL),(5,'客户资源分配管理',1,'/main/goCustomerDistributionManager.do',5,NULL),(6,'维修回访',2,'/main/goMaintainManager.do',1,NULL),(7,'销售回访',2,'/main/goMarketReturnManager.do',2,NULL),(9,'投诉管理',2,'/main/goComplainManager.do',4,NULL),(10,'潜在客户分析',3,'/main/goCustomerAnalyze.do',1,NULL),(11,'购车分析',3,'/main/goBuyCarAnalyze.do',2,NULL),(14,'客户消息查看',4,'/main/goMessageLook.do',1,NULL),(15,'消息回复',4,'/main/goMessageReply.do',2,NULL),(17,'登录账户管理',5,'/main/goUserManager.do',1,NULL),(18,'角色管理',5,'/main/goRoleManager.do',2,NULL);

/*Table structure for table `t_user_info` */

DROP TABLE IF EXISTS `t_user_info`;

CREATE TABLE `t_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL COMMENT '实际姓名',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `create_time` varchar(64) DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(64) DEFAULT NULL COMMENT '修改时间',
  `isLock` int(1) DEFAULT '0' COMMENT '0-不锁定 1-锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `t_user_info` */

insert  into `t_user_info`(`id`,`username`,`password`,`name`,`role_id`,`create_time`,`update_time`,`isLock`) values (1,'admin','admin123','程旭媛',1,NULL,'2014-04-11',0),(3,'admin123','admin123','adasd',2,'2014-04-18',NULL,0),(4,'liaote','5213171','',2,'2014-04-26',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
