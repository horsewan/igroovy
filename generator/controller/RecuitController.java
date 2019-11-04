package com.yp.enterprise.controller;

import javax.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yp.enterprise.common.vo.RJson;
import com.yp.enterprise.entity.Job;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Api(tags = "招聘管理")
@RestController
@RequestMapping("/recuit")
public class RecuitController {

	/********************* 职位列表 start *********************/

	@ApiOperation(value = "职位列表-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "job_type", value = "工种", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "salary_type", value = "计薪方式", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int"), })
	@GetMapping("/job/query")
	public RJson queryJob() {
		return RJson.ok();
	}

	@ApiOperation("职位列表-发布职位-添加工种")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "job_type_name", value = "工种名称", required = true, dataType = "String"), })
	@PostMapping("/job/add_job_type")
	public RJson addJobType() {
		return RJson.error();
	}

	@ApiOperation("职位列表-发布职位-查询福利列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "company_id", value = "公司Id", required = true, dataType = "String"), })
	@PostMapping("/getBenefit")
	public RJson getBenefit(String company_id) {
		return RJson.error();
	}

	@ApiOperation("职位列表-发布职位")
	@ApiImplicitParams({ @ApiImplicitParam(name = "job", value = "工作实体", required = true, dataType = "Object"), })
	@PostMapping("/publishJob")
	public RJson publishJob(Job job) {
		return RJson.error();
	}

	@ApiOperation("职位列表-发布职位-添加福利")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "benefit_name", value = "福利名称", required = true, dataType = "String"), })
	@PostMapping("/job/add_benefit")
	public RJson addBenefit() {
		return RJson.error();
	}

	@ApiOperation("职位列表-发布职位-添加工作地点")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "province_code", value = "省份编码", required = true, dataType = "String"),
			@ApiImplicitParam(name = "city_code", value = "城市编码", required = true, dataType = "String"),
			@ApiImplicitParam(name = "area_code", value = "区域编码", required = true, dataType = "String"),
			@ApiImplicitParam(name = "detail_addr", value = "详细地址", required = true, dataType = "String"), })
	@PostMapping("/job/add_job_addr")
	public RJson addJobAddr() {
		return RJson.error();
	}
	
	@ApiOperation("职位-发布职位-重新发布")
	@ApiImplicitParams({ 
		@ApiImplicitParam(name = "job", value = "工作实体", required = true, dataType = "Object"),
		})
	@PostMapping("/job/re_publish_job")
	public RJson jobRePublishJob(@RequestBody @Valid Job job) {
		return RJson.error();
	}

	/********************* 职位列表 end *********************/

	/********************* 报名列表 start *********************/

	@ApiOperation("报名列表--批量录用/批量不录用")
	@ApiImplicitParams({ 
		    @ApiImplicitParam(name = "job_id", value = "职位Id", required = true, dataType = "String"),
			@ApiImplicitParam(name = "status", value = "状态", required = true, dataType = "String"), })
	@PostMapping("/jobApplyApproval")
	public RJson jobApplyApproval(String job_id) {
		return RJson.error();
	}

	@ApiOperation("报名列表--导出报名列表清单")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "position_id", value = "职位Id", required = true, dataType = "String"), })
	@PostMapping("/exportJobApplyList")
	public RJson exportJobApplyList(String position_id) {
		return RJson.error();
	}

	@ApiOperation("报名列表--分页查询 报名列表")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "position_id", value = "职位Id", required = true, dataType = "String"), })
	@PostMapping("/getJobApplyListByPage")
	public RJson getJobApplyListByPage(String position_id) {
		return RJson.error();
	}

	@ApiOperation("报名列表--取消录用/取消不录用")
	@ApiImplicitParams({ 
        @ApiImplicitParam(name="ids",value="选中的报名ID数组集",paramType="body",allowMultiple=true,required = true,dataType="String"),
        @ApiImplicitParam(name="operate_type",value="操作类型，1取消录用 2取消不录用",paramType="body",required = true,dataType="int")
			})
	@PostMapping("/apply/cancel_offer_batch")
	public RJson applyCancelOfferBatch() {
		return RJson.error();
	}
	
	@ApiOperation("报名列表--查看工作详情")
	@ApiImplicitParams({ 
        @ApiImplicitParam(name="job_id",value="工作ID",paramType="body",required = true,dataType="int")
			})
	@GetMapping("/apply/get_job_detail")
	public RJson applyGetJobDetail() {
		return RJson.error();
	}

	/********************* 报名列表 start *********************/
	
	/*********************录用列表 start*********************/
	
	@ApiOperation(value = "录用列表-分页查询")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "job_type_id", value = "工种ID", paramType = "query", required = false, dataType = "int"),
			@ApiImplicitParam(name = "page_num", value = "第几页", paramType = "query", required = true, dataType = "int"),
			@ApiImplicitParam(name = "page_size", value = "每页显示几条数据", paramType = "query", required = true, dataType = "int")
			})
	@GetMapping("/offer/query")
	public RJson offerQuery() {
		return RJson.ok();
	}
	
	@ApiOperation("录用列表-认领/不认领")
	@ApiImplicitParams({ 
		    @ApiImplicitParam(name = "user_id", value = "职位Id", required = true, dataType = "String"),
			@ApiImplicitParam(name = "operate_type", value = "操作类型 1认领 2不认领", required = true, dataType = "int")
		    })
	@PostMapping("/offer/claim_or_not")
	public RJson offerClaimOrNot() {
		return RJson.error();
	}
	
	@ApiOperation("录用列表-取消认领/取消不认领")
	@ApiImplicitParams({ 
		    @ApiImplicitParam(name = "user_id", value = "职位Id", required = true, dataType = "String"),
			@ApiImplicitParam(name = "operate_type", value = "操作类型 1认领 2不认领", required = true, dataType = "int")
		    })
	@PostMapping("/offer/cancel_claim_or_not")
	public RJson offerCancelClaimOrNot() {
		return RJson.error();
	}
	
	
	/*********************录用列表 end*********************/

}
