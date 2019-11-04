package com.yp.enterprise.controller;

import com.yp.enterprise.common.vo.RJson;
import com.yp.enterprise.entity.CompanyEmployerWorkload;
import com.yp.enterprise.entity.Role;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Validated
@Api(description = "工作量管理相关接口")
@EnableSwagger2
@RestController
@RequestMapping("/workload")
public class WorkLoadController {


    @ApiOperation("获取已发布职位列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name="company_id",value="公司Id",required = true,dataType="String"),
    })
    @PostMapping("/getjobList")
    public RJson getFJobList(String company_id) {
        return RJson.ok();
    }

    @ApiOperation("工作量列表--编辑")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="companyEmployerWorkload",value="工作量实体",required = true,dataType="Object"),
    })
    @PostMapping("editWorkLoad")
    public RJson editWorkLoad(CompanyEmployerWorkload companyEmployerWorkload) {
    	return RJson.error();
    }
    
    @ApiOperation("工作量列表--设置休息时间")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="work_load_id",value="工作量Id",required = true,dataType="String"),
    })
    @PostMapping("setRestTime")
    public RJson setRestTime(String work_load_id) {
    	return RJson.error();
    }
    
    @ApiOperation("工作量列表--分页查询工作量列表")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="name",value="姓名",required = true,dataType="String"),
    	@ApiImplicitParam(name="group_id",value="小组id",required = true,dataType="String"),
    	@ApiImplicitParam(name="work_date",value="工作日期",required = true,dataType="String"),
    })
    @PostMapping("getWorkLoadListByPage")
    public RJson getWorkLoadListByPage(String name,String group_id,String work_date) {
    	return RJson.error();
    }
    
    @ApiOperation("工作量列表--确认")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="work_load_id",value="工作量Id",required = true,dataType="String"),
    })
    @PostMapping("confirmWorkLoad")
    public RJson confirmWorkLoad(String work_load_id) {
    	return RJson.error();
    }
}
