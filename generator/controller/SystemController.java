package com.yp.enterprise.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yp.enterprise.common.vo.RJson;
import com.yp.enterprise.entity.BUser;
import com.yp.enterprise.entity.Menu;
import com.yp.enterprise.entity.Role;
import com.yp.enterprise.service.MenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Validated
@Api(description = "系统设置以及全局信息相关接口")
@EnableSwagger2
@RestController
@RequestMapping("/sys")
public class SystemController {
    @Autowired
    MenuService menuService;

    @ApiOperation("获取Android APP版本")
    @ApiImplicitParams({

    })
    @PostMapping("/getdndroidappversion")
    public RJson getAndroidAppVersion() {
        IPage<Menu> iPage = menuService.getMenuList(new Page<>(1,50));  //page(new Page<>(1,50),null)
        //menuService.
        return RJson.ok().setData(iPage);
    }

    @ApiOperation("获取Apple APP版本")
    @ApiImplicitParams({
            //@ApiImplicitParam(name="token",value="手机号",required = true,dataType="String"),
    })
    @PostMapping("/getappleappversion")
    public RJson getAppleAppVersion() {  //@RequestParam String token

        return RJson.ok().setData("AppVersion=1.2");
    }

    @ApiOperation("获取网页版API版本")
    @ApiImplicitParams({
            //@ApiImplicitParam(name="token",value="手机号",required = true,dataType="String"),
    })
    @PostMapping("/gethtmlappversion")
    public RJson getHtmlAppVersion() {

        return RJson.ok().setData("AppVersion=1.2");
    }

    @ApiOperation("getRedisValue")
    @ApiImplicitParams({
            @ApiImplicitParam(name="key",value="主键",required = true,dataType="String"),
    })
    @PostMapping("/getRedisValue")
    public RJson getRedisValue() {  //@RequestParam String token
        return RJson.ok().setData("AppVersion=1.2");
    }

    @ApiOperation("setRedisValue")
    @ApiImplicitParams({
            @ApiImplicitParam(name="key",value="主键值",required = true,dataType="String"),
            @ApiImplicitParam(name="value",value="主键",required = true,dataType="String"),
    })
    @PostMapping("/setRedisValue")
    public RJson setRedisValue() {
        return RJson.ok().setData("AppVersion=1.2");
    }

    @ApiOperation("角色管理--角色启用/禁用")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="role_id",value="角色id",required = true,dataType="String"),
    	@ApiImplicitParam(name="operate_type",value="操作类型：启用/禁用",required = true,dataType="String"),
    })
    @PostMapping("/role/updateRoleActive")
    public RJson updateRoleActive(String role_id,String operate_type) {
    	return RJson.error();
    }
    
    @ApiOperation("角色管理--角色编辑")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="role",value="角色实体",required = true,dataType="Object"),
    })
    @PostMapping("/role/updateRole")
    public RJson updateRole(Role role) {
    	return RJson.error();
    }
    
    @ApiOperation("用户管理--删除用户")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="b_user_id",value="用户Id",required = true,dataType="String"),
    })
    @PostMapping("/user/deleteBUser")
    public RJson updateRole(String b_user_id) {
    	return RJson.error();
    }
    
    @ApiOperation("角色管理--分页查询角色列表")
    @ApiImplicitParams({
    	 @ApiImplicitParam(name="page_num",value="第几页",paramType="query",required = true,dataType="int"),
         @ApiImplicitParam(name="page_size",value="每页显示几条数据",paramType="query",required = true,dataType="int"),
    })
    @PostMapping("/user/getBUserListByPage")
    public RJson getBUserListByPage(int page_num,int page_size) {
    	return RJson.error();
    }
    
    @ApiOperation("用户管理--编辑用户")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="user",value="用户实体",required = true,dataType="Object"),
    })
    @PostMapping("/user/updateBUser")
    public RJson updateBUser(BUser user) {
    	return RJson.error();
    }
    
    @ApiOperation("用户管理--添加用户")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="user",value="用户实体",required = true,dataType="Object"),
    })
    @PostMapping("/user/addBUser")
    public RJson addBUser(BUser user) {
    	return RJson.error();
    }
    
    @ApiOperation("角色管理--添加角色")
    @ApiImplicitParams({
    	@ApiImplicitParam(name="role",value="角色实体",required = true,dataType="Object"),
    })
    @PostMapping("/user/addRole")
    public RJson addRole(Role role) {
    	return RJson.error();
    }
    
    @ApiOperation("用户管理--分页查询用户")
    @ApiImplicitParams({
    	 @ApiImplicitParam(name="page_num",value="第几页",paramType="query",required = true,dataType="int"),
         @ApiImplicitParam(name="page_size",value="每页显示几条数据",paramType="query",required = true,dataType="int"),
    })
    @PostMapping("/user/getBuserByPage")
    public RJson getBuserByPage(int page_num,int page_size) {
    	return RJson.error();
    }
}
