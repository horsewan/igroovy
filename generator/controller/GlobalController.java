package com.yp.enterprise.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yp.enterprise.common.vo.RJson;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Api(tags = "全局接口")
@RestController
@RequestMapping("/global")
public class GlobalController {

	@ApiOperation(value = "问题反馈")
	@ApiImplicitParams({ @ApiImplicitParam(name = "content", value = "反馈内容", required = true, dataType = "String"), })
	@PostMapping("/feedback")
	public RJson feedback() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询计薪方式")
	@GetMapping("/get_salary_type")
	public RJson getSalaryType() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询结算类型")
	@GetMapping("/get_sa_type")
	public RJson getSaType() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询工种列表")
	@GetMapping("/get_job_type")
	public RJson getJobType() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询工作地址列表")
	@GetMapping("/get_job_addr")
	public RJson getJobAddr() {
		return RJson.ok();
	}

	@ApiOperation(value = "获取验证码")
	@ApiImplicitParams({ @ApiImplicitParam(name = "phone", value = "手机号", required = true, dataType = "String"),
			@ApiImplicitParam(name = "scene_type", value = "场景类型", required = true, dataType = "int"), })
	@GetMapping("/get_verify_code")
	public RJson getVerifyCode() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询省列表")
	@GetMapping("/get_province_list")
	public RJson getProvinceList() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询城市列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "province_code", value = "省份编码", required = true, dataType = "String"), })
	@GetMapping("/get_city_list")
	public RJson getCityList() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询区域列表")
	@ApiImplicitParams({ @ApiImplicitParam(name = "city_code", value = "城市编码", required = true, dataType = "String"), })
	@GetMapping("/get_area_list")
	public RJson getAreaList() {
		return RJson.ok();
	}

	@ApiOperation(value = "查询小组列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "company_id", value = "公司Id", required = true, dataType = "String"), })
	@GetMapping("/getWorkGroupList")
	public RJson getWorkGroupList() {
		return RJson.ok();
	}

}
