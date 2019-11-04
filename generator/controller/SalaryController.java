package com.yp.enterprise.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yp.enterprise.common.vo.RJson;
import com.yp.enterprise.entity.CompanyEmployerSalary;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Api(tags = "薪资管理")
@RestController
@RequestMapping("/salary")
public class SalaryController {
	
	/*********************初审工资单 start*********************/
	
    @ApiOperation("初审工资单--编辑初审工资单")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="companyEmployerSalary",value="工资单实体",required = true,dataType="json"),
    })
    @PostMapping("/salary/editSalary")
    public RJson salaryEditSalary(CompanyEmployerSalary companyEmployerSalary) {
    	return RJson.error();
    }
    
    @ApiOperation("初审工资单--批量更改件数")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="salary_id",value="工资单Id",required = true,dataType="String"),
    	@ApiImplicitParam(name="piece_num",value="件数",required = true,dataType="String"),
    })
    @PostMapping("/salary/updateBatchPieceNum")
    public RJson updateBatchPieceNum(String salary_id,String piece_num) {
    	return RJson.error();
    }
    
    @ApiOperation("初审工资单--批量通过")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="salary_id",value="工资单Id",required = true,dataType="String"),
    })
    @PostMapping("/salary/updateBatchSalaryPass")
    public RJson updateBatchSalaryPass(String salary_id) {
    	return RJson.error();
    }
    
    @ApiOperation("初审工资单--导出初审工资单")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="name",value="姓名",required = true,dataType="String"),
    	@ApiImplicitParam(name="salary_type",value="姓名",required = true,dataType="String"),
    	@ApiImplicitParam(name="settle_type",value="结算方式",required = true,dataType="String"),
    })
    @PostMapping("/salary/downLoadSalary")
    public RJson downLoadSalary(String name,String salary,String settle_type) {
    	return RJson.error();
    }
    
    @ApiOperation("初审工资单--分页查询初审工资单")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="name",value="姓名",required = true,dataType="String"),
    	@ApiImplicitParam(name="salary_type",value="姓名",required = true,dataType="String"),
    	@ApiImplicitParam(name="settle_type",value="结算方式",required = true,dataType="String"),
    })
    @PostMapping("/salary/getSalaryListByPage")
    public RJson getSalaryListByPage(String name,String salary,String settle_type) {
    	return RJson.error();
    }
    
    /*********************初审工资单 end*********************/
	
	/*********************复审工资单 start*********************/

    @ApiOperation(value = "复审工资单-批量通过/批量不通过")
    @ApiImplicitParams({
            @ApiImplicitParam(name="ids",value="选中的复审工资单ID数组集",paramType="body",allowMultiple=true,required = true,dataType="String"),
            @ApiImplicitParam(name="operate_type",value="操作类型，yes批量通过 no批量不通过",paramType="body",required = true,dataType="String"),
            @ApiImplicitParam(name="reason",value="不通过原因，当operate_type=2时必填",paramType="body",required = false,dataType="String"),
    })
    @PostMapping("/review/batch_review")
    public RJson reviewBatchReview() {
        return RJson.ok();
    }
    
    
    @ApiOperation(value = "下载复审工资单")
    @ApiImplicitParams({
            @ApiImplicitParam(name="name",value="姓名",paramType="query",required = false,dataType="String"),
            @ApiImplicitParam(name="salary_type",value="计薪方式",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="sa_type",value="结算方式",paramType="query",required = false,dataType="int"),
    })
    @PostMapping("/review/download")
    public RJson reviewDownload() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "复审工资单-分页查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name="name",value="姓名",paramType="query",required = false,dataType="String"),
            @ApiImplicitParam(name="salary_type",value="计薪方式",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="sa_type",value="结算方式",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="page_num",value="第几页",paramType="query",required = true,dataType="int"),
            @ApiImplicitParam(name="page_size",value="每页显示几条数据",paramType="query",required = true,dataType="int"),
    })
    @PostMapping("/review/query")
    public RJson reviewQuery() {
        return RJson.ok();
    }
    
    /*********************复审工资单 end*********************/
    
	/*********************正式工资单 start*********************/
    
    @ApiOperation(value = "正式工资单-分页查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name="name",value="姓名",paramType="query",required = false,dataType="String"),
            @ApiImplicitParam(name="salary_type",value="计薪方式",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="sa_type",value="结算类型",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="page_num",value="第几页",paramType="query",required = true,dataType="int"),
            @ApiImplicitParam(name="page_size",value="每页显示几条数据",paramType="query",required = true,dataType="int"),
    })
    @GetMapping("/formal/query")
    public RJson formalQuery() {
        return RJson.ok();
    }

    @ApiOperation(value = "正式工资单-批量发放工资")
    @ApiImplicitParams({
            @ApiImplicitParam(name="ids",value="选中的正式工资单ID数组集",paramType="body",allowMultiple=true,required = true,dataType="String"),
    })
    @PostMapping("/formal/batch_payoff")
    public RJson formalBatchPayoff() {
        return RJson.ok();
    }
    
    
    @ApiOperation(value = "下载正式工资单")
    @ApiImplicitParams({
            @ApiImplicitParam(name="name",value="姓名",paramType="query",required = false,dataType="String"),
            @ApiImplicitParam(name="salary_type",value="计薪方式",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="sa_type",value="结算方式",paramType="query",required = false,dataType="int"),
    })
    @PostMapping("/formal/download")
    public RJson formalDownload() {
        return RJson.ok();
    }
    
    /*********************正式工资单 end*********************/
    
    
    /*********************工资预支管理 start*********************/
    
    @ApiOperation(value = "工资预支管理-批准/不批准")
    @ApiImplicitParams({
            @ApiImplicitParam(name="id",value="ID主键",paramType="body",required = true,dataType="String"),
            @ApiImplicitParam(name="operate_type",value="操作类型，1通过 2不通过",paramType="body",required = true,dataType="int"),
    })
    @PostMapping("/advance/review")
    public RJson advanceReview() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "工资预支管理-分页查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name="name",value="姓名",paramType="query",required = false,dataType="String"),
            @ApiImplicitParam(name="start_apply_time",value="申请时间开始时间",paramType="query",required = false,dataType="string",example = "2019-09-10"),
            @ApiImplicitParam(name="end_apply_time",value="申请时间结束时间",paramType="query",required = false,dataType="string",example = "2019-09-15"),
            @ApiImplicitParam(name="page_num",value="第几页",paramType="query",required = true,dataType="int"),
            @ApiImplicitParam(name="page_size",value="每页显示几条数据",paramType="query",required = true,dataType="int"),
    })
    @PostMapping("/advance/query")
    public RJson advanceQuery() {
        return RJson.ok();
    }
    
    /*********************工资预支管理 end*********************/
}
