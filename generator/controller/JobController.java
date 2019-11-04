package com.yp.enterprise.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yp.enterprise.common.vo.RJson;
import com.yp.enterprise.entity.WorkGroup;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Api(tags = "工作管理相关接口")
@RestController
@RequestMapping("/job")
public class JobController {

	/********************* 小组管理 start *********************/

	@ApiOperation(value = "小组管理-添加小组成员-分页查询成员列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/group/add_member/query_staff_list")
	public RJson queryStaffList() {
		return RJson.ok();
	}

	@ApiOperation(value = "小组管理-查看小组成员（分页）")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "id", value = "小组ID", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/group/member/query")
	public RJson groupMemberQuery() {
		return RJson.ok();
	}

	@ApiOperation(value = "小组管理-查看小组成员-评价")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "id", value = "成员ID", paramType = "body", required = true, dataType = "String"),
			@ApiImplicitParam(name = "content", value = "评价内容", paramType = "body", required = true, dataType = "String"), })
	@PostMapping("/group/member/assess")
	public RJson groupMemberAssess() {
		return RJson.ok();
	}

	@ApiOperation(value = "小组管理-解散")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "id", value = "小组ID", paramType = "body", required = true, dataType = "String"), })
	@PostMapping("/group/disband")
	public RJson groupDisband() {
		return RJson.ok();
	}

	@ApiOperation(value = "小组管理-添加小组成员-添加")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "group_id", value = "小组ID", paramType = "body", required = true, dataType = "int"),
			@ApiImplicitParam(name = "user_id", value = "用户ID", paramType = "body", required = true, dataType = "int"), })
	@PostMapping("/group/add_member/add")
	public RJson groupAddMember() {
		return RJson.ok();
	}
	
	@ApiOperation(value = "小组管理-设置上班时间")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "group_id", value = "小组Id", required = true, dataType = "String"),
		@ApiImplicitParam(name = "work_time", value = "上班时间", required = true, dataType = "String"), })
	@GetMapping("/group/setWorkTime")
	public RJson groupSetWorkTime(String group_id,String work_time) {
		return RJson.ok();
	}
	
	@ApiOperation("小组管理--创建小组")
	@ApiImplicitParams({ @ApiImplicitParam(name = "workGroup", value = "小组实体", required = true, dataType = "Object"), })
	@PostMapping("/addWorkGroup")
	public RJson groupAdd(WorkGroup workGroup) {
		return RJson.error();
	}

	@ApiOperation("小组管理--分页查询小组列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "company_id", value = "公司Id", required = true, dataType = "String"), })
	@PostMapping("/getWorkGroupListByPage")
	public RJson groupQuery(String company_id) {
		return RJson.error();
	}

	/********************* 小组管理 end *********************/

	/********************* 请假管理 start *********************/

	@ApiOperation(value = "请假管理-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "name", value = "姓名", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "start_apply_time", value = "申请时间开始时间", paramType = "query", required = false, dataType = "string", example = "2019-09-10"),
			@ApiImplicitParam(name = "end_apply_time", value = "申请时间结束时间", paramType = "query", required = false, dataType = "string", example = "2019-09-15"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/take_off/query")
	public RJson takeOffQuery() {
		return RJson.ok();
	}

	@ApiOperation(value = "请假管理-批准/不批准")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "id", value = "主键ID", paramType = "body", required = true, dataType = "string"),
			@ApiImplicitParam(name = "operate_type", value = "操作类型 1批准2不批准", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/take_off/review")
	public RJson takeOffReview() {
		return RJson.ok();
	}

	/********************* 请假管理 end *********************/

	/********************* 岗位人员 start *********************/

	@ApiOperation(value = "岗位人员-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "name", value = "姓名", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "job_type", value = "工种", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "group", value = "所属小组", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "job_addr", value = "工作地点", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/staff/query")
	public RJson staffQuery() {
		return RJson.ok();
	}
	
	@ApiOperation(value = "岗位人员-转岗")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "user_id", value = "人员Id", required = true, dataType = "String"),
		@ApiImplicitParam(name = "position_id", value = "职位id", required = true, dataType = "String"), })
	@GetMapping("/position/jobTransfer")
	public RJson staffChangeJob(String user_id,String position_id) {
		return RJson.ok();
	}
	
	@ApiOperation(value = "岗位人员-设置上班时间")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "user_id", value = "人员Id", required = true, dataType = "String"),
		@ApiImplicitParam(name = "work_time", value = "上班时间", required = true, dataType = "String"), })
	@GetMapping("/position/setUserWorkTime")
	public RJson staffSetWorkTime(String user_id,String work_time) {
		return RJson.ok();
	}

	/********************* 岗位人员 end *********************/

	@ApiOperation("工作详情--查看工作详细信息")
	@ApiImplicitParams({ @ApiImplicitParam(name = "job_id", value = "工作Id", required = true, dataType = "String"), })
	@PostMapping("/jobDetail")
	public RJson jobDetail(String job_id) {
		return RJson.error();
	}

	/********************* 考勤统计 start *********************/

	@ApiOperation(value = "考勤统计-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "name", value = "姓名", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "job_type_id", value = "工种ID", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "start_day", value = "考勤开始日期", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "end_day", value = "考勤结束日期", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/time_sheet/query")
	public RJson timeSheetQuery() {
		return RJson.ok();
	}

	@ApiOperation(value = "考勤统计-查询旷工明细")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "user_id", value = "用户ID", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "start_day", value = "考勤开始日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "end_day", value = "考勤结束日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/time_sheet/query_absent_detail")
	public RJson timeSheetAbsentDetail() {
		return RJson.ok();
	}

	@ApiOperation(value = "考勤统计-查询请假明细")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "user_id", value = "用户ID", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "start_day", value = "考勤开始日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "end_day", value = "考勤结束日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/time_sheet/query_take_off_detail")
	public RJson timeSheetTakeOffDetail() {
		return RJson.ok();
	}

	@ApiOperation(value = "考勤统计-查询迟到明细")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "user_id", value = "用户ID", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "start_day", value = "考勤开始日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "end_day", value = "考勤结束日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/time_sheet/query_late_detail")
	public RJson timeSheetLateDetail() {
		return RJson.ok();
	}

	@ApiOperation(value = "考勤统计-查询早退明细")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "user_id", value = "用户ID", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "start_day", value = "考勤开始日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "end_day", value = "考勤结束日期", paramType = "query", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/time_sheet/query_leave_early_detail")
	public RJson timeSheetLeaveEarlyDetail() {
		return RJson.ok();
	}

	/********************* 考勤统计 end *********************/

	/********************* 点名管理 start *********************/

	@ApiOperation(value = "点名管理-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "name", value = "姓名", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "job_type_id", value = "工种ID", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "group_id", value = "小组ID", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@GetMapping("/call_manage/query")
	public RJson callManageQuery() {
		return RJson.ok();
	}

	@ApiOperation(value = "点名管理-提交未到人员列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "ids", value = "未到人员ID集合", paramType = "body", allowMultiple = true, required = true, dataType = "string") })
	@PostMapping("/call_manage/submit_absent_list")
	public RJson callManageSubmitAbsentList() {
		return RJson.ok();
	}

	@ApiOperation(value = "点名管理-取消点名")
	@PostMapping("/call_manage/cancel")
	public RJson callManageCancel() {
		return RJson.ok();
	}

	@ApiOperation(value = "点名管理-未到人员-取消补签")
	@PostMapping("/call_manage/cancel_rep_sign")
	public RJson callManageCacelRepSign() {
		return RJson.ok();
	}

	@ApiOperation(value = "点名管理-未到人员-补签到")
	@PostMapping("/call_manage/rep_sign")
	public RJson callManageRepSign() {
		return RJson.ok();
	}

	/********************* 点名管理 end *********************/

	/********************* 点名记录 start *********************/

	@ApiOperation(value = "点名记录-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@GetMapping("/call_record/query")
	public RJson callRecordQuery() {
		return RJson.ok();
	}

	@ApiOperation(value = "点名记录-导出excel")
	@GetMapping("/call_record/download")
	public RJson callRecordDownload() {
		return RJson.ok();
	}

	@ApiOperation(value = "点名记录-未到人员分页查询")
	@GetMapping("/call_record/query_absent_staff")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	public RJson callRecordAbsentStaff() {
		return RJson.ok();
	}

	/********************* 点名记录 end *********************/

	/********************* 签到签退 start *********************/

	@ApiOperation(value = "签到签退-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "name", value = "姓名", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "start_day", value = "考勤开始日期", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "end_day", value = "考勤结束日期", paramType = "query", required = false, dataType = "String"),
			@ApiImplicitParam(name = "exception", value = "异常情况", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int") })
	@GetMapping("/sign_in_off/query")
	public RJson signInOffQuery() {
		return RJson.ok();
	}

	@ApiOperation(value = "签到签退-补签到")
	@GetMapping("/sign_in_off/sup_in")
	public RJson signInOffSupIn() {
		return RJson.ok();
	}
	
	@ApiOperation(value = "签到签退-补签退")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "job_id", value = "工作Id", required = true, dataType = "String"),
			@ApiImplicitParam(name = "sign_off_time", value = "签退时间", required = true, dataType = "String"), })
	@GetMapping("/signOff")
	public RJson signOffSupOff(String job_id,String sign_off_time) {
		return RJson.ok();
	}

	/********************* 签到签退 end *********************/
	
}
