DROP TABLE IF EXISTS `c_user`;
CREATE TABLE IF NOT EXISTS `c_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` VARCHAR(16) NULL DEFAULT '' COMMENT '姓名',
  `gender` CHAR(2) NULL DEFAULT '' COMMENT '性别',
  `birthday` DATE NULL DEFAULT NULL COMMENT '生日',
  `age` TINYINT(3) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `race` VARCHAR(8) NULL DEFAULT '' COMMENT '民族',
  `phone` VARCHAR(16) NOT NULL COMMENT '手机号',
  `id_card_number` VARCHAR(32) NULL DEFAULT '' COMMENT '身份证号码',
  `address` VARCHAR(128) NULL DEFAULT '' COMMENT '住址',
  `user_type` TINYINT(4) NOT NULL COMMENT '用户类型，1自主注册2平台导入',
  `getui_sdk_clientid` VARCHAR(128) NULL DEFAULT '' COMMENT '个推SDK分配给当前用户的clientid',
  `status` TINYINT(3) UNSIGNED NOT NULL COMMENT '用户状态 1正常 2禁用',
  `pay_type` TINYINT(3) UNSIGNED NULL DEFAULT NULL COMMENT '收款方式 1微信 2支付宝 3银联',
  `wx_id` VARCHAR(64) NULL DEFAULT '' COMMENT '微信账号',
  `alipay_id` VARCHAR(64) NULL DEFAULT '' COMMENT '支付宝账号',
  `unionpay_id` VARCHAR(64) NULL DEFAULT '' COMMENT '银联账号',
  `finish_job_num` INT(8) UNSIGNED NULL DEFAULT '0' COMMENT '在平台完成的工作数量',
  `star_level` DECIMAL(2,1) UNSIGNED NOT NULL DEFAULT '0.0' COMMENT '平台星级',
  `cert_status` TINYINT(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '认证状态 1未认证 2已认证',
  `biz_token` VARCHAR(64) NULL DEFAULT '' COMMENT '人脸核身get_biz_token接口返回的biz_token',
  `regist_date` DATE NOT NULL COMMENT '注册时间',
  `password` varchar(32)  NULL COMMENT '密码',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='C端用户信息表';

DROP TABLE IF EXISTS `user_account`;
CREATE TABLE IF NOT EXISTS `user_account` (
`id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`user_id`  int(20) NOT NULL COMMENT '用户ID',
`name` varchar(32) NOT NULL COMMENT '账户名称',
`status` tinyint(2) unsigned  NOT NULL COMMENT '0-可用 1，冻结，2 停用等',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户表';

DROP TABLE IF EXISTS `user_account_detail`;
CREATE TABLE IF NOT EXISTS `user_account_detail` (
`id` int(20) NOT NULL AUTO_INCREMENT  COMMENT '主键ID',
`user_id`  int(20) NOT NULL COMMENT '用户ID',
`company_employer_salary_id`  int(20) NOT NULL COMMENT '用户ID',
`user_account_id` varchar(32) NOT NULL COMMENT '账户ID',
`fee_type` tinyint(2) unsigned NOT NULL COMMENT '费用类型-工资,预支,补助等',
`flow_type` tinyint(2) unsigned NOT NULL COMMENT '收支类型-0，收入，1支出 , 现在场景只有收入',
`amount` int NOT NULL COMMENT '金额',
`create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
`create_time` datetime DEFAULT NULL COMMENT '创建时间',
`remark` varchar(256) DEFAULT '' COMMENT '备注',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户明细表--账户主要有收工资，预支工资等';


DROP TABLE IF EXISTS `b_user`;
CREATE TABLE IF NOT EXISTS `b_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT  COMMENT '主键ID',
  `company_id` int(20) NOT NULL COMMENT '主键ID',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `name` varchar(100) NOT NULL COMMENT '用户姓名',
  `mobile` varchar(16) NOT NULL COMMENT '手机号',
  `is_active` tinyint(2) unsigned NOT NULL COMMENT '账号状态 0正常 1禁用',
  `user_type` tinyint(2) unsigned NOT NULL COMMENT '用户类型 0 b端企业用户 1 c端用户',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_b_user_phone` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B端用户信息表';

DROP TABLE IF EXISTS `b_user_company`;
CREATE TABLE IF NOT EXISTS `b_user_company` (
  `id` int(20) NOT NULL  AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL  COMMENT '用户ID',
  `company_id` int(20) NOT NULL COMMENT '公司ID',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='B端下属管理公司表';


DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
   `id` int(11) NOT NULL  AUTO_INCREMENT COMMENT '主键ID',
   `position_name` VARCHAR(16) NOT NULL COMMENT '工种名称',
   `position_video_url` VARCHAR(256) NULL DEFAULT '' COMMENT '培训视频url',
   `company_id` VARCHAR(32) NOT NULL COMMENT 'company表主键ID--如果有这个Id，那么表示是公司得工种，如果company_id=-1表示是全局的工种',
    `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='工种职位信息列表';

DROP TABLE IF EXISTS `company_trade`;
CREATE TABLE `company_trade` (
	`id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`trade_name` VARCHAR(16) NOT NULL COMMENT '行业名称',
	`is_del` TINYINT(2) UNSIGNED NULL DEFAULT '1' COMMENT '是否删除 1正常 2删除',
	PRIMARY KEY (`id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='行业表';


DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_name` VARCHAR(50) NOT NULL COMMENT '公司名称，唯一性',
  `company_phone` VARCHAR(16) NOT NULL COMMENT '公司初始管理员手机号，唯一性',
  `license_pic_url` VARCHAR(256) NULL DEFAULT '' COMMENT '营业执照url',
  `company_desc` VARCHAR(256) NULL DEFAULT '' COMMENT '公司描述',
  `status` TINYINT(2) UNSIGNED NOT NULL COMMENT '状态1审核中2正常3不通过4禁用',
  `status_desc` VARCHAR(64) NULL DEFAULT '' COMMENT '状态说明，例如审核不通过原因',
  `stand_up_num` INT(8) UNSIGNED NULL DEFAULT '0' COMMENT '违约次数',
  `company_type` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1中介,2中介企业,3直客企业',
  `company_trade_id` int(11)  NULL DEFAULT 0 COMMENT 'company_trade表主键ID',
  `p_id` int(20) NULL DEFAULT 0  COMMENT '所属中介，当company_type为1时有值',
  `is_del` TINYINT(2) UNSIGNED NULL DEFAULT '1' COMMENT '是否删除 1正常 2删除',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司信息表';

DROP TABLE IF EXISTS `job_addr`;
CREATE TABLE `job_addr` (
	`id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`company_id` int(20) NOT NULL COMMENT 'company表主键ID',
	`province_code` VARCHAR(16) NOT NULL COMMENT '省份代码',
	`city_code` VARCHAR(16) NOT NULL COMMENT '城市代码',
	`area_code` VARCHAR(16) NOT NULL COMMENT '区域代码',
	`detail_addr` VARCHAR(64) NOT NULL COMMENT '具体地址',
	`lng` VARCHAR(32) NOT NULL COMMENT '工作地址经度',
	`lat` VARCHAR(32) NOT NULL COMMENT '工作地址纬度',
	`create_by` varchar(32) DEFAULT '' COMMENT '创建人ID',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
	`remark` VARCHAR(256) NULL DEFAULT '' COMMENT '备注',
	PRIMARY KEY (`id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司工作地址表';


DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
 `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
 `position_id` int(11) NOT NULL  COMMENT '工种/职位ID',
 `company_id` int(20) NOT NULL COMMENT 'company表主键ID',
 `job_addr_id` VARCHAR(32) NOT NULL COMMENT 'job_addr表主键ID',
 `job_addr_name` VARCHAR(256) NOT NULL COMMENT '地址名称',
  `salary_type` TINYINT(1) UNSIGNED NOT NULL COMMENT '薪酬计算方式 1按小时 2按天 3按指定单位',
   `unit_name` VARCHAR(4) NOT NULL COMMENT '单位名称，当salary_type为1时是小时，为2时是天，为3时后台可自定义设置，可能是“件”、“个”、“双”',
  	`certification` TINYINT(3) UNSIGNED NOT NULL COMMENT '是否需要实名认证1需要2不需要',
	`job_desc` VARCHAR(256) NOT NULL COMMENT '工作描述',
	`day_start_time` VARCHAR(8) NOT NULL COMMENT '工作开始时间，例如09:00',
	`day_end_time` VARCHAR(8) NOT NULL COMMENT '工作结束时间，可跨0点，例如03:00',
	`status` TINYINT(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '工作状态 1待审核 2已发布 3已关闭 4审核不通过',
	`status_desc` VARCHAR(128) NULL DEFAULT '' COMMENT '状态说明',
	`start_date` DATE NOT NULL COMMENT '工作开始日期',
	`end_date` DATE NOT NULL COMMENT '工作结束日期',
	`final_start_time` DATETIME NOT NULL COMMENT '当前工作最终精确开始日期，例如2019-07-01 09:00',
	`final_end_time` DATETIME NOT NULL COMMENT '当前工作最终精确结束日期，例如2019-07-30 18:00',
	`total_num` SMALLINT(5) UNSIGNED NOT NULL COMMENT '总招聘人数',
	`apply_num` SMALLINT(5) UNSIGNED  NULL COMMENT '报名人数',
	`employ_num` SMALLINT(5) UNSIGNED  NULL COMMENT '录用人数',
  `is_del` TINYINT(2) UNSIGNED NULL DEFAULT '1' COMMENT '是否删除 1正常 2删除',
  `contact_name` VARCHAR(16) NULL DEFAULT '' COMMENT '当前工作的联系人名称',
  `contact_phone` VARCHAR(16) NULL DEFAULT '' COMMENT '当前工作的联系人手机号',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司招聘信息表';

DROP TABLE IF EXISTS `company_black_list`;
CREATE TABLE `company_black_list` (
    `id` VARCHAR(32) NOT NULL COMMENT '主键ID',
	`user_id` int(20) NOT NULL COMMENT 'c端用户表主键ID',
	`company_id` int(20) NOT NULL COMMENT 'company表主键ID',
	`create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    `remark` varchar(256) DEFAULT '' COMMENT '备注',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `unq_userId_companyId` (`user_id`, `company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司黑名单表';

DROP TABLE IF EXISTS `company_employer`;
CREATE TABLE IF NOT EXISTS `company_employer` (
    `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`user_id` int(20) NOT NULL  DEFAULT 0 COMMENT 'c端用户user_id表主键ID',
	`company_id` int(20) NOT NULL  DEFAULT 0 COMMENT '公司表主键ID',
    `contact_man` VARCHAR(256) NULL DEFAULT '' COMMENT '介绍人姓名或者介绍',
	`hire_date` DATE NULL COMMENT '用户选择的上班日期',
	`status` TINYINT(1) UNSIGNED NOT NULL COMMENT '0 已雇用-产生劳动合同关系, 1 解雇   ',
	`status_desc` VARCHAR(256) NULL DEFAULT '' COMMENT '状态描述，辞退或者雇佣原因等',
	`fire_date` VARCHAR(8) NOT NULL COMMENT '解雇时间',
	`isActive` TINYINT(1) UNSIGNED NOT NULL COMMENT '数据是否可用--数据软删除',
	`create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    `remark` varchar(256) DEFAULT '' COMMENT '备注',
	 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司雇佣关系表-';


DROP TABLE IF EXISTS `company_employer_job`;
CREATE TABLE IF NOT EXISTS `company_employer_job` (
    `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`job_id` int(20) NOT NULL COMMENT 'company_job表主键ID',
	`user_id` int(20) NOT NULL  DEFAULT 0 COMMENT 'c端用户user_id表主键ID',
	`company_id` int(20) NOT NULL  DEFAULT 0 COMMENT '冗余company_id',
	`company_employer_id` int(20)  NULL  DEFAULT 0 COMMENT '冗余company_id',
	`expect_date` DATE NULL COMMENT '用户选择的上班日期',
	`work_start_time` VARCHAR(8) NULL DEFAULT '' COMMENT 'B端设置的用户开始上班时间，初始值为B端发布工作时的开始上班时间',
	`status` TINYINT(3) UNSIGNED NOT NULL COMMENT '状态 0可报名 1等待录用 2已录用 3未录用 4工作中 5已结束  6已取消 7已辞退 ',
	`status_desc` VARCHAR(64) NULL DEFAULT '' COMMENT '状态描述，例如未录用原因、辞退原因等',
	`apply_date` INT(16) UNSIGNED NOT NULL COMMENT '申请报名时间，到秒时间戳',
	`offer_date` INT(16) UNSIGNED NULL DEFAULT '0' COMMENT '录用成功时间，到秒时间戳',
	`give_offer_user`  int(20) NULL DEFAULT 0 COMMENT '录用操作人，B端表主键ID',
	`fire_date` INT(16) UNSIGNED NULL DEFAULT '0' COMMENT '辞退用户时间，到秒时间戳',
	`give_fire_user` int(20) NULL DEFAULT 0 COMMENT '辞退操作人，hr_bp表主键ID',
	`cancel_date` INT(16) UNSIGNED NULL DEFAULT '0' COMMENT '取消时间，到秒时间戳',
	`cancel_user`  int(20) NULL DEFAULT 0 COMMENT '取消操作人',
	`end_date` DATE NOT NULL COMMENT '工作结束日期，默认值是hr_company_job表的end_date字段',
	`day_end_time` VARCHAR(8) NOT NULL COMMENT '工作结束时间',
	`final_end_time` DATETIME NOT NULL COMMENT '工作最终精确结束日期，例如2019-07-30 18:00，默认值是hr_company_job表的final_end_time字段',
	`create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    `remark` varchar(256) DEFAULT '' COMMENT '备注',
	 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司雇佣关系表-包括求职，录用，领用等一些状态';

DROP TABLE IF EXISTS `company_employer_workload`;
CREATE TABLE IF NOT EXISTS `company_employer_workload` (
    `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`company_employer_id`  int(20) NOT NULL COMMENT '公司雇佣关系表ID',
	`company_employer_job_id`  int(20) NOT NULL COMMENT '公司雇佣关系表ID',
	`user_id`  int(20) NOT NULL  COMMENT '冗余C端用户ID表',
	`user_name`  VARCHAR(64)  DEFAULT ''  COMMENT '冗余C端用户姓名',
	`user_position`  VARCHAR(64) NULL DEFAULT '' COMMENT '冗余当前结算工种名称',
	`work_date` DATE NOT NULL COMMENT '工资单日期（结算日期），如果是跨0点工作，以工作开始时间的日期为准',
	`work_hour` FLOAT NOT NULL COMMENT '工作时长',
	`salary` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '应发薪资',
	`changed_salary` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '修改之后的应发薪资，初始值是salary字段',
	`salary_award` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '奖励金额',
	`salary_deduct` DECIMAL(8,2) UNSIGNED NULL DEFAULT '0.00' COMMENT '应扣薪资，hr_user_salary_deduct_detail表同一个hr_user_salary_id的总和',
	`salary_final` DECIMAL(8,2) NOT NULL COMMENT '实发薪资，可以是负数',
	`salary_type` TINYINT(1) UNSIGNED NOT NULL COMMENT '薪酬计算方式 1按小时 2按天 3按件 hr_company_job的salary_type字段',
	`salary_type_desc`  VARCHAR(64) NULL DEFAULT '' COMMENT '薪酬计算方式描述',
	`salary_unit` DECIMAL(8,3) NOT NULL COMMENT '薪酬标准，当salary_type为3时是3位小数，其他2位小数',
	`piece_num` INT(8) UNSIGNED NULL DEFAULT NULL COMMENT '计件数量，当salary_type为3时值有意义，当salary_type为1、2时默认是0，后台可以修改，但对薪资不起作用',
	`piece_num_update` INT(8) UNSIGNED NULL DEFAULT NULL COMMENT '修改后的计件数量，初始值是piece_num',
	`piece_price` DECIMAL(8,3) UNSIGNED NULL DEFAULT NULL COMMENT '计件单价，当salary_type为3时默认值是salary_unit，为1、2时如果piece_num有值，则是salary除以piece_num，没有值则是空',
	`desc` VARCHAR(64) NULL DEFAULT '' COMMENT '备注说明',
	`status` TINYINT(4) NOT NULL COMMENT '单条数据状态 0 生成 1修改 2提交生成工资单 10 生成的工资单已发放',
	`create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    `remark` varchar(256) DEFAULT '' COMMENT '备注',
	 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司工作量单次统计表--';

DROP TABLE IF EXISTS `company_employer_salary_relation`;
CREATE TABLE IF NOT EXISTS `role_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_employer_workload_id` int(20) NOT NULL  COMMENT '公司工作量单次统计表ID',
  `company_employer_salary_id` int(20) NOT NULL  COMMENT '公司工资结算汇总表ID',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司工资结算表-公司工资结算汇总表关联';


DROP TABLE IF EXISTS `company_employer_salary`;
CREATE TABLE IF NOT EXISTS `company_employer_salary` (
    `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`company_employer_id`  int(20) NOT NULL COMMENT '公司雇佣关系表ID',
	`company_employer_job_id`  int(20) NOT NULL COMMENT '公司雇佣关系表ID',
	`user_id`  int(20) NOT NULL  COMMENT '冗余C端用户ID表',
	`user_name`  VARCHAR(64)  DEFAULT ''  COMMENT '冗余C端用户姓名',
	`user_position`  VARCHAR(64) NULL DEFAULT '' COMMENT '冗余当前结算工种名称',
	`start_work_date` DATE NOT NULL COMMENT '结算日期，开始日期',
	`end_work_date` DATE NOT NULL COMMENT '结算日期，结束日期',
	`salary_type_desc`  VARCHAR(64) NULL DEFAULT '' COMMENT '薪酬计算方式描述',
	`settlement_type_desc`  VARCHAR(64) NULL DEFAULT '' COMMENT '结算方式描述',
	`work_day` INT(4) UNSIGNED NOT NULL COMMENT '工作天数',
	`work_hour` FLOAT UNSIGNED NOT NULL COMMENT '工作时长',
	`salary` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '当前日期范围应发工资总额',
	`salary_award` DECIMAL(8,2) UNSIGNED NOT NULL COMMENT '奖励金额',
	`salary_deduct` DECIMAL(8,2) UNSIGNED NULL DEFAULT '0.00' COMMENT '应扣薪资，hr_user_salary_deduct_detail表同一个hr_user_salary_id的总和',
	`salary_final` DECIMAL(8,2) NOT NULL COMMENT '实发薪资，可以是负数',
	`salary_type` TINYINT(1) UNSIGNED NOT NULL COMMENT '薪酬计算方式 1按小时 2按天 3按件 hr_company_job的salary_type字段',
	`salary_unit` DECIMAL(8,3) NOT NULL COMMENT '薪酬标准，当salary_type为3时是3位小数，其他2位小数',
	`piece_num` INT(8) UNSIGNED NULL DEFAULT NULL COMMENT '计件数量，当salary_type为3时值有意义，当salary_type为1、2时默认是0，后台可以修改，但对薪资不起作用',
	`piece_num_update` INT(8) UNSIGNED NULL DEFAULT NULL COMMENT '修改后的计件数量，初始值是piece_num',
	`piece_price` DECIMAL(8,3) UNSIGNED NULL DEFAULT NULL COMMENT '计件单价，当salary_type为3时默认值是salary_unit，为1、2时如果piece_num有值，则是salary除以piece_num，没有值则是空',
	`desc` VARCHAR(64) NULL DEFAULT '' COMMENT '备注说明',
	`expect_date` BIGINT(20) UNSIGNED NULL DEFAULT '0' COMMENT '预计发放时间',
	`payoff_date` BIGINT(20) UNSIGNED NULL DEFAULT '0' COMMENT '发放时间',
	`status` TINYINT(4) UNSIGNED NOT NULL COMMENT '发放状态 1初审 ，2 复审 ， 3发放  10异常',
	`pay_user` VARCHAR(32) NULL DEFAULT '' COMMENT '发放人，B端用户表主键ID',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司工资结算汇总表';


DROP TABLE IF EXISTS `work_turn`;
CREATE TABLE IF NOT EXISTS `work_turn` (
   `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   `record_id` int(20) NOT NULL COMMENT '记录ID',
   `start_date` DATE NOT NULL COMMENT '班次开始时间',
   `end_date` DATE NOT NULL COMMENT '班次结束时间',
   `turn_type` DATE NOT NULL COMMENT '班次关联类型-0公司雇佣关系班次，1个人雇佣关系班次',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='班次表';

DROP TABLE IF EXISTS `work_turn_timesheet`;
CREATE TABLE IF NOT EXISTS `work_turn_timesheet` (
   `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   `company_employment_id` int(20) NOT NULL COMMENT '雇员ID',
   `work_turn_id` int(20) NOT NULL COMMENT '班次ID',
   `user_id` int(20) NOT NULL COMMENT '用户ID-冗余用户ID，可以方便查询',
   `start_date` DATE NOT NULL COMMENT '考勤签到/请假开始时间',
   `end_date` DATE NOT NULL COMMENT '考勤签退/请假结束时间',
   `status` TINYINT(2) NOT NULL COMMENT '状态-- 0，数据正常可以用于统计 1-不可以用作统计，比如没有有签到没有签退，请假审批没有通过',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='班次相关考勤记录表-包括签到签退，请假';

DROP TABLE IF EXISTS `work_group`;
CREATE TABLE IF NOT EXISTS `work_group` (
   `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   `company_id` int(20) NOT NULL COMMENT 'company表主键ID',
   `name` VARCHAR(64) NOT NULL COMMENT '小组名称-- 同一个公司的小组名称不能重复' ,
   `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='现场管理小组表';


DROP TABLE IF EXISTS `work_group_users`;
CREATE TABLE IF NOT EXISTS `work_group_users` (
   `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
   `group_id` int(20) NOT NULL COMMENT '小组主键ID',
   `user_id`  int(20) NOT NULL COMMENT 'C端用户ID' ,
   `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='现场小组用户表';


DROP TABLE IF EXISTS `work_group_users_detail`;
CREATE TABLE IF NOT EXISTS `work_group_users_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_user_id` int(20) NOT NULL COMMENT '小组用户主键ID',
  `d_date` datetime DEFAULT NULL COMMENT '点名时间',
  `d_status`  TINYINT(1) DEFAULT NULL COMMENT '是否到场',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='现场小组点名明细表';


DROP TABLE IF EXISTS `workflow_approve`;
CREATE TABLE IF NOT EXISTS `workflow_approve` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `entity_name` varchar(50) NOT NULL  COMMENT '实体名称-比如Company,CUser,BUser，Salary等',
  `op_title` varchar(50) NOT NULL  COMMENT '审批操作名称，比如转岗，领用，录用，补签到，请假等等',
  `record_id` int(20) NOT NULL  COMMENT '统计的实体的主键ID，比如公司ID，工作ID，用户ID,工资单ID，等等',
  `start_time` datetime  NULL COMMENT '审批开始时间',
  `end_time` datetime  NULL COMMENT '审批结束时间',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='审批表-审批各类业务';


DROP TABLE IF EXISTS `workflow_approv_detail`;
CREATE TABLE IF NOT EXISTS `workflow_approv_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `workflow_approve_id`  int(20)  NOT NULL  COMMENT '审批实体ID',
  `b_user_id`  int(20)  NOT NULL  COMMENT '审批人',
  `b_user_name` varchar(16) NOT NULL  COMMENT '审批人姓名',
  `is_approve`  TINYINT(2) DEFAULT NULL COMMENT '是否审批通过',
  `start_status`  TINYINT(2) DEFAULT NULL COMMENT '审批开始状态',
  `end_status`  TINYINT(2) DEFAULT NULL COMMENT '审批结束状态',
  `changevalue` varchar(256) DEFAULT '' COMMENT '业务值改变说明',
  `reason` varchar(256) DEFAULT '' COMMENT '审批描述',
  `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='审批明细表';



DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
`id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`role_name` VARCHAR(16) NOT NULL COMMENT '角色名称',
`desc` VARCHAR(32) NULL DEFAULT '' COMMENT '角色描述',
`hr_company_id` VARCHAR(32) NULL DEFAULT '' COMMENT 'hr_company表主键ID',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
`id` int(11) NOT NULL AUTO_INCREMENT  COMMENT '主键ID',
`name` VARCHAR(64) NOT NULL COMMENT '菜单名称',
`p_id` VARCHAR(32) NULL DEFAULT '' COMMENT '父菜单主键ID',
`url` VARCHAR(128) NULL DEFAULT '' COMMENT '菜单路径',
`order_num` TINYINT(4) NULL DEFAULT '0' COMMENT '排序序号',
`menu_type` TINYINT(4) NOT NULL COMMENT '1按钮 2菜单',
`icon` VARCHAR(16) NOT NULL COMMENT '图标',
`permission` VARCHAR(128) NULL DEFAULT '' COMMENT '权限',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

DROP TABLE IF EXISTS `role_users`;
CREATE TABLE IF NOT EXISTS `role_users` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL  COMMENT '角色ID',
  `user_id` int(11) NOT NULL  COMMENT '用户ID',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE IF NOT EXISTS `role_menus` (
  `id` int(20) NOT NULL AUTO_INCREMENT  COMMENT '主键ID',
  `role_id` int(11) NOT NULL  COMMENT '角色ID',
  `menu_id` int(11) NOT NULL  COMMENT '菜单ID',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单表';



DROP TABLE IF EXISTS `code_desc`;
CREATE TABLE IF NOT EXISTS `code_desc` (
  `code` varchar(32) NOT NULL COMMENT '属性编码',
  `remark` varchar(256) DEFAULT '' COMMENT '描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='属性字典描述表';

DROP TABLE IF EXISTS `addr_area`;
CREATE TABLE `addr_area` (
	`id` INT(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`area_code` VARCHAR(16) NOT NULL COMMENT '区代码',
	`city_code` VARCHAR(16) NULL DEFAULT '' COMMENT '市代码',
	`area_name` VARCHAR(16) NOT NULL COMMENT '区名称',
	`short_name` VARCHAR(16) NOT NULL COMMENT '简称',
	`lng` VARCHAR(32) NULL DEFAULT '' COMMENT '经度',
	`lat` VARCHAR(32) NULL DEFAULT '' COMMENT '纬度',
	PRIMARY KEY (`id`),
	INDEX `Index_1` (`area_code`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='区域字典表';

DROP TABLE IF EXISTS `addr_city`;
CREATE TABLE `addr_city` (
	`id` INT(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`city_code` VARCHAR(16) NOT NULL COMMENT '城市代码',
	`city_name` VARCHAR(16) NOT NULL COMMENT '城市名称',
	`short_name` VARCHAR(8) NOT NULL COMMENT '简称',
	`province_code` VARCHAR(16) NULL DEFAULT '' COMMENT '省代码',
	`lng` VARCHAR(32) NULL DEFAULT '' COMMENT '经度',
	`lat` VARCHAR(32) NULL DEFAULT '' COMMENT '纬度',
	PRIMARY KEY (`id`),
	INDEX `idx_province_code` (`province_code`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='城市设置';

DROP TABLE IF EXISTS `addr_province`;
CREATE TABLE `addr_province` (
	`id` INT(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`province_code` VARCHAR(16) NOT NULL COMMENT '省份代码',
	`province_name` VARCHAR(8) NOT NULL COMMENT '省份名称',
	`short_name` VARCHAR(8) NOT NULL COMMENT '简称',
	`lng` VARCHAR(32) NULL DEFAULT '' COMMENT '经度',
	`lat` VARCHAR(32) NULL DEFAULT '' COMMENT '纬度',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='省份设置';

DROP TABLE IF EXISTS `addr_street`;
CREATE TABLE `addr_street` (
	`id` INT(16) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
	`street_code` VARCHAR(16) NOT NULL COMMENT '街道代码' COLLATE 'utf8_general_ci',
	`area_code` VARCHAR(16) NULL DEFAULT '' COMMENT '父级区代码' COLLATE 'utf8_general_ci',
	`street_name` VARCHAR(64) NOT NULL COMMENT '街道名称' COLLATE 'utf8_general_ci',
	`short_name` VARCHAR(32) NOT NULL COMMENT '简称' COLLATE 'utf8_general_ci',
	`lng` VARCHAR(32) NULL DEFAULT '' COMMENT '经度' COLLATE 'utf8_general_ci',
	`lat` VARCHAR(32) NULL DEFAULT '' COMMENT '纬度' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`),
	INDEX `Index_1` (`street_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='街道设置';


DROP TABLE IF EXISTS `buser_attr`;
CREATE TABLE IF NOT EXISTS `user_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(20) NOT NULL NOT NULL COMMENT '用户ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';


DROP TABLE IF EXISTS `company_attr`;
CREATE TABLE IF NOT EXISTS `company_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` int(11) NOT NULL NOT NULL COMMENT '用户ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NULL DEFAULT '' COMMENT '属性值',
  `intvalue` int(20) NULL DEFAULT 0  COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司属性表';


DROP TABLE IF EXISTS `job_attr`;
CREATE TABLE IF NOT EXISTS `job_attr` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `company_id` int(11) NOT NULL NOT NULL COMMENT '用户ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用等',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作属性表';



DROP TABLE IF EXISTS `global_attr`;
CREATE TABLE IF NOT EXISTS `global_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT  COMMENT '主键ID',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='全局属性表';



DROP TABLE IF EXISTS `sum_attr`;
CREATE TABLE IF NOT EXISTS `sum_attr` (
  `id` int(11) NOT NULL  AUTO_INCREMENT   COMMENT '主键ID',
  `entity_name` varchar(10) NOT NULL  COMMENT '实体名称-比如Company,CUser,BUser等',
  `record_id` int(20) NOT NULL  COMMENT '统计的实体的主键ID，比如公司ID，工作ID，用户ID等等',
  `isactive` tinyint(2) unsigned NOT NULL COMMENT '信息状态 0正常 1不可用',
  `key` varchar(100) NOT NULL COMMENT '属性key',
  `value` varchar(256) NOT NULL COMMENT '属性值',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='统计相关属性表';


DROP TABLE IF EXISTS `benefit`;
CREATE TABLE IF NOT EXISTS `benefit` (
   `id` int(11) NOT NULL  AUTO_INCREMENT COMMENT '主键ID',
   `benefit_name` VARCHAR(16) NOT NULL COMMENT '福利名称',
   `company_id` int(20) NOT NULL COMMENT 'company表主键ID--如果有这个Id，那么表示是公司的福利，如果company_id=-1表示是全局的福利',
    `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='公司福利信息表';


DROP TABLE IF EXISTS `rules`;
CREATE TABLE IF NOT EXISTS `rules` (
   `id` int(20) NOT NULL  AUTO_INCREMENT COMMENT '主键ID',
   `rule_code` VARCHAR(16) NOT NULL COMMENT '规则编码',
   `rule_content` VARCHAR(256) NOT NULL COMMENT '规则编码',
   `rule_para` VARCHAR(100) NOT NULL COMMENT '规则参数值',
   `rule_` VARCHAR(100) NOT NULL COMMENT '规则参数值',
   `record_id` VARCHAR(32) NOT NULL COMMENT '规则关联的数据主键ID--如果有这个Id，那么表示是公司的规则，如果company_id=-1表示是全局的规则',
   `create_by` int(20) DEFAULT 0 COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` int(20) DEFAULT 0 COMMENT '更新人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='规则信息表';



