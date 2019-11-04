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

@Api(tags = "账号管理")
@RestController
@RequestMapping("/account")
public class AccountController {

    @ApiOperation(value = "重置密码")
    @ApiImplicitParams({
            @ApiImplicitParam(name="phone",value="手机号",paramType="body",required = false,dataType="String"),
            @ApiImplicitParam(name="verify_code",value="验证码",paramType="body",required = false,dataType="String"),
    })
    @PostMapping("/reset_pwd")
    public RJson resetPwd() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "角色管理-编辑-查询已有菜单列表")
    @PostMapping("/role/get_bind_menu_list")
    public RJson roleGetBindMenuList() {
        return RJson.ok();
    }
    
    @ApiOperation(value = "角色管理-添加角色-查询菜单列表")
    @PostMapping("/role/add/query_menu_list")
    public RJson roleAddQueryMenuList() {
        return RJson.ok();
    }
    
	@ApiOperation(value = "查询角色列表")
	@GetMapping("/role/get_role_list")
	public RJson getRoleList() {
		return RJson.ok();
	}

	@ApiOperation(value = "用户管理-编辑用户-查询所属角色列表")
	@GetMapping("/user/get_bind_role_list")
	public RJson userGetBindRoleList() {
		return RJson.ok();
	}
}
