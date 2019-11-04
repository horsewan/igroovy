package com.yp.enterprise.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yp.enterprise.common.vo.RJson;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Api(tags = "员工管理")
@RestController
@RequestMapping("/staff")
public class StaffController {

	/*********************员工列表 start*********************/
	
    @ApiOperation("员工列表--分页查询员工列表")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="name",value="员工姓名",required = true,dataType="String"),
    	@ApiImplicitParam(name="position_id",value="工种",required = true,dataType="String"),
    	@ApiImplicitParam(name="status",value="状态",required = true,dataType="String"),
    })
    @PostMapping("/staff/getCuserListByPage")
    public RJson getCuserListByPage(String name,String position_id,String status) {
    	return RJson.error();
    }
    
    @ApiOperation(value = "员工列表-续约")
    @ApiImplicitParams({
            @ApiImplicitParam(name="user_id",value="用户ID",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="to_time",value="续约时间",paramType="query",required = true,dataType="String")
    })
    @PostMapping("/continue")
    public RJson staffContinue() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "员工列表-解聘")
    @ApiImplicitParams({
            @ApiImplicitParam(name="user_id",value="用户ID",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="to_time",value="解聘时间",paramType="query",required = true,dataType="String")
    })
    @PostMapping("/dismiss")
    public RJson staffDismiss() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "员工列表-下载导入模板")
    @PostMapping("/download_import_template")
    public RJson staffImportTemplate() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "员工列表-批量导入")
    @PostMapping("/staff_import_batch")
    public RJson staffImportBatch() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "员工列表-离职")
    @ApiImplicitParams({
            @ApiImplicitParam(name="user_id",value="用户ID",paramType="query",required = false,dataType="int"),
            @ApiImplicitParam(name="to_time",value="离职时间",paramType="query",required = true,dataType="String")
    })
    @PostMapping("/fire")
    public RJson staffFire() {
        return RJson.ok();
    }
    
    /*********************员工列表 end*********************/

	/*********************离职记录 start*********************/
    
    @ApiOperation(value = "离职记录-分页查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name="name",value="姓名",paramType="query",required = false,dataType="String"),
            @ApiImplicitParam(name="page_num",value="第几页",paramType="query",required = true,dataType="int"),
            @ApiImplicitParam(name="page_size",value="每页显示几条数据",paramType="query",required = true,dataType="int"),
    })
    @PostMapping("/fire_record/query")
    public RJson queryFireRecord() {
        return RJson.ok();
    }
    
    /*********************离职记录 end*********************/
}
