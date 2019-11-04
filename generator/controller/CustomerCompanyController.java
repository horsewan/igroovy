package com.yp.enterprise.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yp.enterprise.common.vo.RJson;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Api(tags = "客户公司")
@RestController
@RequestMapping("/customer_company")
public class CustomerCompanyController {

	@ApiOperation(value = "客户公司-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@PostMapping("/query")
	public RJson query() {
		return RJson.ok();
	}

	@ApiOperation(value = "客户公司-编辑")
	@PostMapping("/update")
	public RJson update() {
		return RJson.ok();
	}
	
	@ApiOperation(value = "客户公司-添加客户公司")
	@PostMapping("/add")
	public RJson add() {
		return RJson.ok();
	}

	@ApiOperation(value = "客户公司-设定监管人员")
	@PostMapping("/set_admin")
	public RJson setAdmin() {
		return RJson.ok();
	}
	
	@ApiOperation(value = "客户公司-加载监管人员用户列表")
	@PostMapping("/get_admin_list")
	public RJson getAdminList() {
		return RJson.ok();
	}

}
