-- --------------------------------------------------------
-- 主机:                           192.168.1.169
-- 服务器版本:                        5.6.44 - MySQL Community Server (GPL)
-- 服务器OS:                        Linux
-- HeidiSQL 版本:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table yp_enterprise.addr_area
DROP TABLE IF EXISTS `addr_area`;
CREATE TABLE IF NOT EXISTS `addr_area` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `area_code` varchar(16) NOT NULL COMMENT '区代码',
  `city_code` varchar(16) DEFAULT '' COMMENT '市代码',
  `area_name` varchar(16) NOT NULL COMMENT '区名称',
  `short_name` varchar(16) NOT NULL COMMENT '简称',
  `lng` varchar(32) DEFAULT '' COMMENT '经度',
  `lat` varchar(32) DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`area_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3679 DEFAULT CHARSET=utf8 COMMENT='区域字典表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.addr_city
DROP TABLE IF EXISTS `addr_city`;
CREATE TABLE IF NOT EXISTS `addr_city` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `city_code` varchar(16) NOT NULL COMMENT '城市代码',
  `city_name` varchar(16) NOT NULL COMMENT '城市名称',
  `short_name` varchar(8) NOT NULL COMMENT '简称',
  `province_code` varchar(16) DEFAULT '' COMMENT '省代码',
  `lng` varchar(32) DEFAULT '' COMMENT '经度',
  `lat` varchar(32) DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `idx_province_code` (`province_code`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8 COMMENT='城市设置';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.addr_province
DROP TABLE IF EXISTS `addr_province`;
CREATE TABLE IF NOT EXISTS `addr_province` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `province_code` varchar(16) NOT NULL COMMENT '省份代码',
  `province_name` varchar(8) NOT NULL COMMENT '省份名称',
  `short_name` varchar(8) NOT NULL COMMENT '简称',
  `lng` varchar(32) DEFAULT '' COMMENT '经度',
  `lat` varchar(32) DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份设置';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.addr_street
DROP TABLE IF EXISTS `addr_street`;
CREATE TABLE IF NOT EXISTS `addr_street` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `street_code` varchar(16) NOT NULL COMMENT '街道代码',
  `area_code` varchar(16) DEFAULT '' COMMENT '父级区代码',
  `street_name` varchar(64) NOT NULL COMMENT '街道名称',
  `short_name` varchar(32) NOT NULL COMMENT '简称',
  `lng` varchar(32) DEFAULT '' COMMENT '经度',
  `lat` varchar(32) DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `Index_1` (`street_code`)
) ENGINE=InnoDB AUTO_INCREMENT=42361 DEFAULT CHARSET=utf8 COMMENT='街道设置';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.benefit
DROP TABLE IF EXISTS `benefit`;
CREATE TABLE IF NOT EXISTS `benefit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `benefit_name` varchar(16) NOT NULL COMMENT '福利名称',
  `company_id` int(20) NOT NULL COMMENT 'company表主键ID--如果有这个Id，那么表示是公司的福利，如果company_id=-1表示是全局的福利',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='公司福利信息表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.buser_attr
DROP TABLE IF EXISTS `buser_attr`;
CREATE TABLE IF NOT EXISTS `buser_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT '用户ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.b_user
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE IF NOT EXISTS `b_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` int(20) NOT NULL COMMENT '公司ID',
  `company_type` tinyint(2) unsigned NOT NULL DEFAULT '3' COMMENT '公司类型 1中介,2中介企业,3直客企业',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `name` varchar(100) NOT NULL COMMENT '用户姓名',
  `mobile` varchar(16) NOT NULL COMMENT '手机号',
  `is_active` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '账号状态 0正常 1禁用',
  `user_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '用户类型 0 b端企业用户 1 B端中介企业用户',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_b_user_phone` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='B端用户信息表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.b_user_company
DROP TABLE IF EXISTS `b_user_company`;
CREATE TABLE IF NOT EXISTS `b_user_company` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT '用户ID',
  `company_id` int(20) NOT NULL COMMENT '公司ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='B端下属管理公司表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.code_desc
DROP TABLE IF EXISTS `code_desc`;
CREATE TABLE IF NOT EXISTS `code_desc` (
  `code` varchar(32) NOT NULL COMMENT '属性编码',
  `remark` varchar(256) DEFAULT '' COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性字典描述表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company
DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_name` varchar(50) NOT NULL COMMENT '公司名称，唯一性',
  `company_phone` varchar(16) NOT NULL COMMENT '公司初始管理员手机号，唯一性',
  `license_pic_url` varchar(256) DEFAULT '' COMMENT '营业执照url',
  `eucn` varchar(100) NOT NULL DEFAULT '' COMMENT '企业工商营业执照号码',
  `company_desc` varchar(256) DEFAULT '' COMMENT '公司描述',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态1审核中2正常3不通过4禁用',
  `status_desc` varchar(64) DEFAULT '' COMMENT '状态说明，例如审核不通过原因',
  `stand_up_num` int(8) unsigned DEFAULT '0' COMMENT '违约次数',
  `company_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '1中介,2企业',
  `company_trade_id` int(11) DEFAULT '0' COMMENT 'company_trade表主键ID',
  `is_del` tinyint(2) unsigned DEFAULT '1' COMMENT '是否删除 1正常 2删除',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_company_phone` (`company_phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='公司信息表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_attr
DROP TABLE IF EXISTS `company_attr`;
CREATE TABLE IF NOT EXISTS `company_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` int(11) NOT NULL COMMENT '用户ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) DEFAULT '' COMMENT '属性值',
  `intvalue` int(20) DEFAULT '0' COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司属性表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_black_list
DROP TABLE IF EXISTS `company_black_list`;
CREATE TABLE IF NOT EXISTS `company_black_list` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT 'c端用户表主键ID',
  `company_id` int(20) NOT NULL COMMENT 'company表主键ID',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_userId_companyId` (`user_id`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司黑名单表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_employer
DROP TABLE IF EXISTS `company_employer`;
CREATE TABLE IF NOT EXISTS `company_employer` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL DEFAULT '0' COMMENT 'c端用户user_id表主键ID',
  `company_id` int(20) NOT NULL DEFAULT '0' COMMENT '公司表主键ID',
  `contact_man` varchar(256) DEFAULT '' COMMENT '介绍人姓名或者介绍',
  `hire_date` date DEFAULT NULL COMMENT '用户选择的上班日期',
  `status` tinyint(1) unsigned NOT NULL COMMENT '0 已雇用-产生劳动合同关系, 1 解雇   ',
  `status_desc` varchar(256) DEFAULT '' COMMENT '状态描述，辞退或者雇佣原因等',
  `employer_type` tinyint(4) DEFAULT NULL COMMENT '0 表示正式共 1，表示中介临时工 2自主临时工',
  `fire_date` date DEFAULT NULL COMMENT '解雇时间',
  `isActive` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '数据是否可用--数据软删除 0可用 1 不可用',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8 COMMENT='公司雇佣关系表-';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_employer_advance
DROP TABLE IF EXISTS `company_employer_advance`;
CREATE TABLE IF NOT EXISTS `company_employer_advance` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT 'C端用户ID--预支申请人',
  `company_employer_salary_id` int(20) NOT NULL COMMENT '用户ID',
  `company_employer_id` int(20) NOT NULL COMMENT '用户ID',
  `apply_date` datetime DEFAULT NULL COMMENT '预支时间-什么时候需要',
  `advance_amount` decimal(8,2) unsigned NOT NULL COMMENT '预支金额',
  `status` tinyint(2) unsigned NOT NULL COMMENT '状态 1审批中 2审批通过 3审批不通过 4已发放',
  `reason` varchar(256) NOT NULL COMMENT '原因',
  `create_time` datetime DEFAULT NULL COMMENT '提交审批时间--创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户预支申请表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_employer_job
DROP TABLE IF EXISTS `company_employer_job`;
CREATE TABLE IF NOT EXISTS `company_employer_job` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_id` int(20) NOT NULL COMMENT 'company_job表主键ID',
  `user_id` int(20) NOT NULL DEFAULT '0' COMMENT 'c端用户user_id表主键ID',
  `company_id` int(20) NOT NULL DEFAULT '0' COMMENT '冗余company_id',
  `company_employer_id` int(20) DEFAULT '0' COMMENT '冗余company_employer_id',
  `expect_date` date DEFAULT NULL COMMENT '用户选择的上班日期',
  `work_start_time` varchar(8) DEFAULT '' COMMENT 'B端设置的用户开始上班时间，初始值为B端发布工作时的开始上班时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态 0可报名 1等待录用 2已录用 3未录用 4未认领 5工作中 6已结束  7已取消 ',
  `status_desc` varchar(64) DEFAULT '' COMMENT '状态描述，例如未录用原因、辞退原因等',
  `apply_date` datetime DEFAULT NULL COMMENT '申请报名时间',
  `offer_date` datetime DEFAULT NULL COMMENT '录用成功时间',
  `give_offer_user` int(20) DEFAULT '0' COMMENT '录用操作人，B端表主键ID',
  `fire_date` datetime DEFAULT NULL COMMENT '辞退用户时间',
  `give_fire_user` int(20) DEFAULT '0' COMMENT '辞退操作人，B端表主键表主键ID',
  `cancel_date` datetime DEFAULT NULL COMMENT '取消时间',
  `cancel_user` int(20) DEFAULT '0' COMMENT '取消操作人',
  `end_date` date NOT NULL COMMENT '工作结束日期，默认值是job表的end_date字段',
  `day_end_time` varchar(20) DEFAULT NULL COMMENT '工作结束时间',
  `final_end_time` datetime DEFAULT NULL COMMENT '工作最终精确结束日期，例如2019-07-30 18:00，默认值是job表的final_end_time字段',
  `salary_type` int(20) unsigned DEFAULT NULL COMMENT '薪酬计算方式 1按小时 2按天 3按件 job的salary_type字段--从job表里拷贝过来以修改的数据',
  `salary_type_desc` varchar(64) DEFAULT '' COMMENT '薪酬计算方式描述--从job表里拷贝过来剋以修改的数据',
  `settlement_type` int(20) DEFAULT NULL COMMENT '结算方式--从job表里拷贝过来剋以修改的数据',
  `settlement_type_desc` varchar(64) DEFAULT '' COMMENT '结算方式描述--从job表里拷贝过来剋以修改的数据',
  `unit_price` decimal(8,3) unsigned DEFAULT NULL COMMENT '单价',
  `salary_unit` varchar(10) DEFAULT NULL COMMENT '计件单位：天  ，小时，件',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 COMMENT='公司雇佣关系表-包括求职，录用，领用等一些状态';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_employer_salary
DROP TABLE IF EXISTS `company_employer_salary`;
CREATE TABLE IF NOT EXISTS `company_employer_salary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_employer_id` int(20) NOT NULL COMMENT '公司雇佣关系表ID',
  `company_id` int(20) NOT NULL DEFAULT '0' COMMENT '冗余公司ID',
  `company_employer_job_id` int(20) NOT NULL COMMENT '公司雇佣关系表ID',
  `user_id` int(20) NOT NULL COMMENT '冗余C端用户ID表',
  `user_name` varchar(64) DEFAULT '' COMMENT '冗余C端用户姓名',
  `user_position` varchar(64) DEFAULT '' COMMENT '冗余当前结算工种名称',
  `start_work_date` date NOT NULL COMMENT '结算日期，开始日期',
  `end_work_date` date NOT NULL COMMENT '结算日期，结束日期',
  `salary_type` int(20) unsigned NOT NULL COMMENT '薪酬计算方式 1按小时 2按天 3按件 hr_company_job的salary_type字段',
  `salary_type_desc` varchar(64) DEFAULT '' COMMENT '薪酬计算方式描述',
  `settlement_type` int(20) DEFAULT NULL COMMENT '结算方式',
  `settlement_type_desc` varchar(64) DEFAULT '' COMMENT '结算方式描述',
  `work_day` int(4) unsigned NOT NULL COMMENT '工作天数',
  `work_hour` float unsigned NOT NULL COMMENT '工作时长',
  `salary` decimal(8,2) unsigned NOT NULL COMMENT '当前日期范围应发工资总额',
  `salary_award` decimal(8,2) unsigned NOT NULL COMMENT '奖励金额',
  `salary_advance` decimal(8,2) DEFAULT NULL COMMENT '预支金额',
  `salary_deduct` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '应扣薪资，hr_user_salary_deduct_detail表同一个hr_user_salary_id的总和',
  `salary_final` decimal(8,2) NOT NULL COMMENT '实发薪资，可以是负数',
  `salary_unit` decimal(8,3) NOT NULL COMMENT '薪酬标准，当salary_type为3时是3位小数，其他2位小数',
  `piece_num` int(8) unsigned DEFAULT NULL COMMENT '计件数量，当salary_type为3时值有意义，当salary_type为1、2时默认是0，后台可以修改，但对薪资不起作用',
  `piece_num_update` int(8) unsigned DEFAULT NULL COMMENT '修改后的计件数量，初始值是piece_num',
  `piece_price` decimal(8,3) unsigned DEFAULT NULL COMMENT '计件单价，当salary_type为3时默认值是salary_unit，为1、2时如果piece_num有值，则是salary除以piece_num，没有值则是空',
  `salary_desc` varchar(64) DEFAULT '' COMMENT '备注说明',
  `expect_date` bigint(20) unsigned DEFAULT '0' COMMENT '预计发放时间',
  `payoff_date` bigint(20) unsigned DEFAULT '0' COMMENT '发放时间',
  `status` tinyint(4) unsigned NOT NULL COMMENT '发放状态 1审核中  ，3 待发放 4已发放  10发放失败',
  `pay_user` int(20) DEFAULT NULL COMMENT '发放人，B端用户表主键ID',
  `workload_desc` varchar(32) DEFAULT '' COMMENT '工作量总结说明 比如30小时',
  `approve_user_name` varchar(32) DEFAULT '' COMMENT '复审审批人姓名',
  `approve_days` varchar(32) DEFAULT '' COMMENT '审批天数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公司工资结算汇总表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_employer_takeoff
DROP TABLE IF EXISTS `company_employer_takeoff`;
CREATE TABLE IF NOT EXISTS `company_employer_takeoff` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_employer_job_id` int(20) NOT NULL COMMENT 'company_employer_job表主键ID',
  `user_id` int(20) NOT NULL COMMENT 'C端用户ID--请假人',
  `company_employer_id` int(20) NOT NULL COMMENT '用户ID',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(2) unsigned NOT NULL COMMENT '状态 1审批中 2审批通过 3审批不通过',
  `reason` varchar(256) NOT NULL COMMENT '原因',
  `takeoff_type` varchar(10) DEFAULT '' COMMENT '请假类型中文描述 从下列下拉列表选 1事假 2病假 3年假 4调休 5产假 6陪产假 7婚假 8例假 9丧假',
  `create_time` datetime DEFAULT NULL COMMENT '提交审批时间--创建请假条的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户请假表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_employer_workload
DROP TABLE IF EXISTS `company_employer_workload`;
CREATE TABLE IF NOT EXISTS `company_employer_workload` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_employer_id` int(20) NOT NULL COMMENT '公司雇佣关系表ID',
  `company_id` int(20) NOT NULL DEFAULT '0',
  `company_employer_job_id` int(20) NOT NULL COMMENT '公司雇佣关系表ID',
  `user_id` int(20) NOT NULL COMMENT '冗余C端用户ID表',
  `user_name` varchar(64) DEFAULT '' COMMENT '冗余C端用户姓名',
  `user_position` varchar(64) DEFAULT '' COMMENT '冗余当前结算工种名称',
  `work_date` date NOT NULL COMMENT '工资单日期（结算日期），如果是跨0点工作，以工作开始时间的日期为准',
  `work_hour` float NOT NULL COMMENT '工作时长',
  `salary` decimal(8,2) unsigned NOT NULL COMMENT '应发薪资',
  `changed_salary` decimal(8,2) unsigned NOT NULL COMMENT '修改之后的应发薪资，初始值是salary字段',
  `salary_award` decimal(8,2) unsigned NOT NULL COMMENT '奖励金额',
  `salary_deduct` decimal(8,2) unsigned DEFAULT '0.00' COMMENT '应扣薪资，hr_user_salary_deduct_detail表同一个hr_user_salary_id的总和',
  `salary_final` decimal(8,2) NOT NULL COMMENT '实发薪资，可以是负数',
  `salary_type` tinyint(1) unsigned NOT NULL COMMENT '薪酬计算方式 1按小时 2按天 3按件 hr_company_job的salary_type字段',
  `salary_type_desc` varchar(64) DEFAULT '' COMMENT '薪酬计算方式描述',
  `salary_unit` decimal(8,3) NOT NULL COMMENT '薪酬标准，当salary_type为3时是3位小数，其他2位小数',
  `piece_num` int(8) unsigned DEFAULT NULL COMMENT '计件数量，当salary_type为3时值有意义，当salary_type为1、2时默认是0，后台可以修改，但对薪资不起作用',
  `piece_num_update` int(8) unsigned DEFAULT NULL COMMENT '修改后的计件数量，初始值是piece_num',
  `piece_price` decimal(8,3) unsigned DEFAULT NULL COMMENT '计件单价，当salary_type为3时默认值是salary_unit，为1、2时如果piece_num有值，则是salary除以piece_num，没有值则是空',
  `workload_desc` varchar(64) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(4) NOT NULL COMMENT '单条数据状态 0 生成 1修改 2提交生成工资单 10 生成的工资单已发放',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司工作量单次统计表--';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_feedback
DROP TABLE IF EXISTS `company_feedback`;
CREATE TABLE IF NOT EXISTS `company_feedback` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT 'B端用户ID',
  `feedback_content` varchar(256) NOT NULL COMMENT '反馈内容',
  `company_id` int(20) NOT NULL COMMENT '公司ID',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户反馈信息表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_relationship
DROP TABLE IF EXISTS `company_relationship`;
CREATE TABLE IF NOT EXISTS `company_relationship` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `medium_company_id` int(20) NOT NULL COMMENT '中介企业ID',
  `enterprise_company_id` int(20) NOT NULL COMMENT '用人单位企业ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业关系关联表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.company_trade
DROP TABLE IF EXISTS `company_trade`;
CREATE TABLE IF NOT EXISTS `company_trade` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `trade_name` varchar(16) NOT NULL COMMENT '行业名称',
  `is_del` tinyint(2) unsigned DEFAULT '1' COMMENT '是否删除 1正常 2删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行业表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.c_user
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE IF NOT EXISTS `c_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(16) DEFAULT '' COMMENT '姓名',
  `gender` char(2) DEFAULT '' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
  `race` varchar(8) DEFAULT '' COMMENT '民族',
  `phone` varchar(16) NOT NULL COMMENT '手机号',
  `id_card_number` varchar(32) DEFAULT '' COMMENT '身份证号码',
  `address` varchar(128) DEFAULT '' COMMENT '住址',
  `user_type` tinyint(4) NOT NULL COMMENT '用户类型，1自主注册2平台导入',
  `getui_sdk_clientid` varchar(128) DEFAULT '' COMMENT '个推SDK分配给当前用户的clientid',
  `status` tinyint(3) unsigned NOT NULL COMMENT '用户状态 1正常 2禁用',
  `pay_type` tinyint(3) unsigned DEFAULT NULL COMMENT '收款方式 1微信 2支付宝 3银联',
  `wx_id` varchar(64) DEFAULT '' COMMENT '微信账号',
  `alipay_id` varchar(64) DEFAULT '' COMMENT '支付宝账号',
  `unionpay_id` varchar(64) DEFAULT '' COMMENT '银联账号',
  `finish_job_num` int(8) unsigned DEFAULT '0' COMMENT '在平台完成的工作数量',
  `star_level` decimal(2,1) unsigned NOT NULL DEFAULT '0.0' COMMENT '平台星级',
  `cert_status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '认证状态 1未认证 2已认证',
  `biz_token` varchar(64) DEFAULT '' COMMENT '人脸核身get_biz_token接口返回的biz_token',
  `regist_date` date NOT NULL COMMENT '注册时间',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8 COMMENT='C端用户信息表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.employer_attr
DROP TABLE IF EXISTS `employer_attr`;
CREATE TABLE IF NOT EXISTS `employer_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_employer_id` int(11) NOT NULL COMMENT '用户ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作属性表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.global_attr
DROP TABLE IF EXISTS `global_attr`;
CREATE TABLE IF NOT EXISTS `global_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用',
  `record_id` int(20) NOT NULL COMMENT '全局设置--比如计薪方式',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局属性表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.job
DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `position_id` int(11) NOT NULL COMMENT '工种/职位ID',
  `company_id` int(20) NOT NULL COMMENT 'company表主键ID',
  `job_name` varchar(100) NOT NULL COMMENT '工作名称',
  `job_addr_id` varchar(32) NOT NULL COMMENT 'job_addr表主键ID',
  `job_addr_name` varchar(256) NOT NULL COMMENT '地址名称',
  `salary_type_desc` varchar(100) NOT NULL COMMENT '薪酬计算方式说明-- 冗余字段',
  `settle_type_desc` varchar(100) NOT NULL COMMENT '结算方式说明-- 冗余字段 ',
  `settle_condition_desc` varchar(100) NOT NULL COMMENT '结算方式式说明-- 冗余字段',
  `unit_name` varchar(4) NOT NULL COMMENT '单位名称，当salary_type为1时是小时，为2时是天，为3时后台可自定义设置，可能是“件”、“个”、“双”',
  `certification` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '是否需要实名认证1需要2不需要',
  `job_desc` varchar(256) DEFAULT NULL COMMENT '工作描述',
  `day_start_time` varchar(8) NOT NULL COMMENT '工作开始时间，例如09:00',
  `day_end_time` varchar(8) NOT NULL COMMENT '工作结束时间，可跨0点，例如03:00',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '工作状态 2已发布 3已关闭',
  `status_desc` varchar(128) DEFAULT '' COMMENT '状态说明',
  `start_date` date NOT NULL COMMENT '工作开始日期',
  `end_date` date NOT NULL COMMENT '工作结束日期',
  `final_start_time` datetime NOT NULL COMMENT '当前工作最终精确开始日期，例如2019-07-01 09:00',
  `final_end_time` datetime NOT NULL COMMENT '当前工作最终精确结束日期，例如2019-07-30 18:00',
  `job_sex_type` int(11) NOT NULL COMMENT '招聘性别类型',
  `job_sex_type_desc` varchar(128) NOT NULL COMMENT '招聘性别类型说明',
  `job_age_type_desc` varchar(128) NOT NULL COMMENT '招聘年龄类型说明',
  `job_condition_desc` varchar(256) NOT NULL COMMENT '职位要求',
  `job_benifit_desc` varchar(256) NOT NULL COMMENT '职位福利描述',
  `total_num` smallint(5) unsigned NOT NULL COMMENT '总招聘人数',
  `apply_num` smallint(5) unsigned DEFAULT NULL COMMENT '报名人数',
  `employ_num` smallint(5) unsigned DEFAULT NULL COMMENT '录用人数',
  `is_del` tinyint(2) unsigned DEFAULT '1' COMMENT '是否删除 1正常 2删除',
  `contact_name` varchar(16) DEFAULT '' COMMENT '当前工作的联系人名称',
  `contact_phone` varchar(16) DEFAULT '' COMMENT '当前工作的联系人手机号',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `job_age_type` int(11) DEFAULT NULL COMMENT '招聘年龄类型',
  `salary_unit` decimal(8,3) DEFAULT NULL COMMENT '薪酬标准，salary_type值不同，对应的值也不同,当salary_type为3时是3位小数，其他2位小数',
  `excloud_work_time_desc` varchar(255) DEFAULT NULL COMMENT '不计入工作时长（计薪方式为按时计薪，需存入）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='公司招聘信息表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.job_addr
DROP TABLE IF EXISTS `job_addr`;
CREATE TABLE IF NOT EXISTS `job_addr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` int(20) NOT NULL COMMENT 'company表主键ID',
  `province_code` varchar(16) NOT NULL COMMENT '省份代码',
  `city_code` varchar(16) NOT NULL COMMENT '城市代码',
  `area_code` varchar(16) NOT NULL COMMENT '区域代码',
  `detail_addr` varchar(64) NOT NULL COMMENT '具体地址',
  `lng` varchar(32) NOT NULL COMMENT '工作地址经度',
  `lat` varchar(32) NOT NULL COMMENT '工作地址纬度',
  `create_by` varchar(32) DEFAULT '' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='公司工作地址表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.job_attr
DROP TABLE IF EXISTS `job_attr`;
CREATE TABLE IF NOT EXISTS `job_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_id` int(11) NOT NULL COMMENT '用户ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作属性表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) NOT NULL COMMENT '菜单名称',
  `p_id` varchar(32) DEFAULT '' COMMENT '父菜单主键ID',
  `url` varchar(128) DEFAULT '' COMMENT '菜单路径',
  `order_num` tinyint(4) DEFAULT '0' COMMENT '排序序号',
  `menu_type` tinyint(4) NOT NULL COMMENT '1按钮 2菜单',
  `menu_company_type` tinyint(4) NOT NULL COMMENT '0，企业 1 中介',
  `icon` varchar(16) NOT NULL COMMENT '图标',
  `permission` varchar(128) DEFAULT '' COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.position
DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `position_name` varchar(16) NOT NULL COMMENT '工种名称',
  `position_video_url` varchar(256) DEFAULT '' COMMENT '培训视频url',
  `company_id` int(20) NOT NULL COMMENT 'company表主键ID--如果有这个Id，那么表示是公司得工种，如果company_id=-1表示是全局的工种',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='工种职位信息列表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.role
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(16) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(32) DEFAULT '' COMMENT '角色描述',
  `company_id` int(20) DEFAULT '0' COMMENT 'company表主键ID',
  `is_active` tinyint(2) DEFAULT '0' COMMENT '是否可用，0 可用，1禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.role_menus
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE IF NOT EXISTS `role_menus` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647 DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.role_users
DROP TABLE IF EXISTS `role_users`;
CREATE TABLE IF NOT EXISTS `role_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.rules
DROP TABLE IF EXISTS `rules`;
CREATE TABLE IF NOT EXISTS `rules` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rule_code` varchar(32) NOT NULL COMMENT '规则编码',
  `rule_content` varchar(256) NOT NULL COMMENT '规则具体内容描述',
  `rule_para` varchar(100) DEFAULT '' COMMENT '规则参数名',
  `rule_value` varchar(100) DEFAULT '' COMMENT '规则参数值',
  `record_id` int(20) NOT NULL COMMENT '规则关联的数据主键ID--如果有这个Id，那么表示是公司的规则，如果company_id=-1表示是全局的规则',
  `module_code` varchar(100) DEFAULT '' COMMENT '所属全局规则值',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='规则信息表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.sum_attr
DROP TABLE IF EXISTS `sum_attr`;
CREATE TABLE IF NOT EXISTS `sum_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `entity_name` varchar(10) NOT NULL COMMENT '实体名称-比如Company,CUser,BUser等',
  `record_id` int(20) NOT NULL COMMENT '统计的实体的主键ID，比如公司ID，工作ID，用户ID等等',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计相关属性表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.user_account
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE IF NOT EXISTS `user_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT '用户ID',
  `name` varchar(32) NOT NULL COMMENT '账户名称',
  `status` tinyint(2) unsigned NOT NULL COMMENT '0-可用 1，冻结，2 停用等',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.user_account_detail
DROP TABLE IF EXISTS `user_account_detail`;
CREATE TABLE IF NOT EXISTS `user_account_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT '用户ID',
  `company_employer_salary_id` int(20) NOT NULL COMMENT '用户ID',
  `user_account_id` varchar(32) NOT NULL COMMENT '账户ID',
  `fee_type` tinyint(2) unsigned NOT NULL COMMENT '费用类型-工资,预支,补助等',
  `flow_type` tinyint(2) unsigned NOT NULL COMMENT '收支类型-0，收入，1支出 , 现在场景只有收入',
  `amount` int(11) NOT NULL COMMENT '金额',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户明细表--账户主要有收工资，预支工资等';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.user_attr
DROP TABLE IF EXISTS `user_attr`;
CREATE TABLE IF NOT EXISTS `user_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT '用户ID',
  `company_id` int(20) NOT NULL COMMENT '公司ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.user_work_turn
DROP TABLE IF EXISTS `user_work_turn`;
CREATE TABLE IF NOT EXISTS `user_work_turn` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL COMMENT '用户ID',
  `work_turn_id` int(20) NOT NULL COMMENT '班次ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户班次表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.workflow_approve
DROP TABLE IF EXISTS `workflow_approve`;
CREATE TABLE IF NOT EXISTS `workflow_approve` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `entity_name` varchar(50) NOT NULL COMMENT '实体名称-比如Company,CUser,BUser，Salary等',
  `op_title` varchar(50) NOT NULL COMMENT '审批操作名称，比如转岗，领用，录用，补签到，请假等等',
  `record_id` int(20) NOT NULL COMMENT '统计的实体的主键ID，比如公司ID，工作ID，用户ID,工资单ID，等等',
  `start_time` datetime DEFAULT NULL COMMENT '审批开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '审批结束时间',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='审批表-审批各类业务';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.workflow_approv_detail
DROP TABLE IF EXISTS `workflow_approv_detail`;
CREATE TABLE IF NOT EXISTS `workflow_approv_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `workflow_approve_id` int(20) NOT NULL COMMENT '审批实体ID',
  `b_user_id` int(20) NOT NULL COMMENT '审批人',
  `b_user_name` varchar(16) NOT NULL COMMENT '审批人姓名',
  `is_approve` tinyint(2) DEFAULT NULL COMMENT '是否审批通过',
  `start_status` tinyint(2) DEFAULT NULL COMMENT '审批开始状态',
  `end_status` tinyint(2) DEFAULT NULL COMMENT '审批结束状态',
  `changevalue` varchar(256) DEFAULT '' COMMENT '业务值改变说明',
  `reason` varchar(256) DEFAULT '' COMMENT '审批描述',
  `create_by` int(20) DEFAULT '0' COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT '0' COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='审批明细表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.work_group
DROP TABLE IF EXISTS `work_group`;
CREATE TABLE IF NOT EXISTS `work_group` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` int(20) NOT NULL COMMENT 'company表主键ID',
  `master_id` int(20) NOT NULL COMMENT '小组组长ID',
  `master_name` varchar(64) NOT NULL COMMENT '小组组长姓名',
  `name` varchar(64) NOT NULL COMMENT '小组名称-- 同一个公司的小组名称不能重复',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `total_user` int(11) DEFAULT '0' COMMENT '当前小组人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='现场管理小组表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.work_group_users
DROP TABLE IF EXISTS `work_group_users`;
CREATE TABLE IF NOT EXISTS `work_group_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` int(20) NOT NULL COMMENT '小组主键ID',
  `user_id` int(20) NOT NULL COMMENT 'C端用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `position_name` varchar(100) NOT NULL COMMENT '工种名称',
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `age` varchar(10) NOT NULL COMMENT '年龄',
  `addr_name` varchar(256) NOT NULL COMMENT '地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `work_turn` varchar(40) NOT NULL COMMENT '班次',
  `head_url` varchar(256) NOT NULL COMMENT '头像',
  `company_name` varchar(100) NOT NULL COMMENT '所属公司名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='现场小组用户表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.work_group_users_detail
DROP TABLE IF EXISTS `work_group_users_detail`;
CREATE TABLE IF NOT EXISTS `work_group_users_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_user_id` int(20) NOT NULL COMMENT '小组用户主键ID',
  `start_date` datetime DEFAULT NULL COMMENT '点名开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '点名结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否到场 0：到场 1：未到场',
  `sign_date` datetime DEFAULT NULL COMMENT '点名补签时间',
  `out_work_time` decimal(3,2) DEFAULT NULL COMMENT '本次点名缺勤时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现场小组点名明细表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.work_turn
DROP TABLE IF EXISTS `work_turn`;
CREATE TABLE IF NOT EXISTS `work_turn` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `job_id` int(20) DEFAULT NULL COMMENT '关联的工作ID',
  `start_date` varchar(20) NOT NULL DEFAULT '' COMMENT '班次开始时间',
  `end_date` varchar(20) NOT NULL DEFAULT '' COMMENT '班次结束时间',
  `turn_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '班次关联类型-0公司雇佣关系班次，1个人雇佣关系班次',
  `final_start_time` datetime NOT NULL COMMENT '当前工作最终精确开始日期，例如2019-07-01 09:00',
  `final_end_time` datetime NOT NULL COMMENT '当前工作最终精确结束日期，例如2019-07-30 18:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='班次表';

-- Data exporting was unselected.

-- Dumping structure for table yp_enterprise.work_turn_timesheet
DROP TABLE IF EXISTS `work_turn_timesheet`;
CREATE TABLE IF NOT EXISTS `work_turn_timesheet` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` int(20) NOT NULL COMMENT '雇员ID',
  `work_turn_id` int(20) NOT NULL COMMENT '班次ID',
  `user_id` int(20) NOT NULL COMMENT '用户ID-冗余用户ID，可以方便查询',
  `sign_day` varchar(20) NOT NULL DEFAULT '' COMMENT '考勤时间，天',
  `user_name` varchar(32) DEFAULT '' COMMENT '用户姓名，可以方便查询',
  `position_name` varchar(100) DEFAULT '' COMMENT '冗余工种名，可以方便查询',
  `group_name` varchar(100) DEFAULT '' COMMENT '冗余小组名，可以方便查询',
  `work_trun_region` varchar(100) DEFAULT '' COMMENT '冗余工作区间描述 比如 9：00 -11点，可以方便查询',
  `start_date` date DEFAULT NULL COMMENT '考勤签到开始时间',
  `end_date` date DEFAULT NULL COMMENT '考勤签退结束时间',
  `in_lng` varchar(32) DEFAULT '' COMMENT '签到签退当前位置经度',
  `in_lat` varchar(32) DEFAULT '' COMMENT '签到签退当前位置纬度',
  `operate_who_type` tinyint(2) unsigned DEFAULT NULL COMMENT '操作者类型 1自主 2企业帮签',
  `operate_who_id` int(20) DEFAULT '0' COMMENT '企业帮签操作者，B段用户表主键ID',
  `operate_who_name` varchar(32) DEFAULT '' COMMENT '企业帮签操作者，B段用户姓名',
  `early_time` smallint(4) unsigned DEFAULT '0' COMMENT '早退分钟',
  `late_time` smallint(4) unsigned DEFAULT '0' COMMENT '迟到时间分钟',
  `status` tinyint(2) NOT NULL COMMENT '状态-- 0，表示还没有开始的考勤记录，1，正常的考勤记录 2不正常的考勤记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COMMENT='班次相关考勤记录表-包括签到签退';

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
