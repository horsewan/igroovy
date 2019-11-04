package com.yp.enterprise.controller;

import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yp.enterprise.common.vo.RJson;
import com.yp.util.RedisUtil;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;

@Api(tags = "登录相关接口")
@RestController
@RequestMapping("/login")
public class LoginController {


    @Autowired
    RedisUtil redisUtil;


    @ApiOperation("登陆")
    @ApiImplicitParams({
            @ApiImplicitParam(name="mobile",value="手机号",required = true,dataType="String"),
            @ApiImplicitParam(name="verify_code",value="验证码",required = true,dataType="String"),
    })
    @PostMapping("/loginbyvc")
    public RJson LoginbyVC(@RequestParam String mobile,@RequestParam String verify_code) {

      /*  EntUserToken entUserToken = null;
        try{
            entUserToken=entLoginService.loginByVc(mobile,verify_code);
        }catch (Exception e){
            e.printStackTrace();
        }
        // 创建TOKEN
        if(entUserToken==null) {
            return RJson.error().setMsg("登录失败");
        }else{
            return RJson.ok().setData(entUserToken).setMsg("登录成功");

        }
        */
      return null;
    }

    @ApiOperation("登陆")
    @ApiImplicitParams({
            @ApiImplicitParam(name="mobile",value="手机号",required = true,dataType="String"),
            @ApiImplicitParam(name="password",value="密码",required = true,dataType="String"),
    })
    @PostMapping("/login")
    public RJson Login(@RequestParam String mobile,@RequestParam String password) {
           return null;
    }


    @ApiOperation("登出")
    @ApiImplicitParams({
            @ApiImplicitParam(name="mobile",value="手机号",required = true,dataType="String"),
    })
    @PostMapping("/logout")
    public RJson Logout(@Length(min=10, max=14) @RequestParam String mobile) {
        //String userkey= ConstRedisPrefix.VC_B_LOGIN+"-"+mobile;
        //entLoginService.loginOut(userkey);
        return RJson.ok("登出成功");
    }


    @ApiOperation("后台登录获取短信验证码")
    @ApiImplicitParams({
            @ApiImplicitParam(name="mobile",value="手机号",required = true,dataType="String"),
    })
    @PostMapping(value = "/getLoginVcode")
    public RJson getLoginVcode(@RequestParam String mobile)  {
       return null;
       /*
        try {
            notifyService.sendVerifyCode(mobile, ConstSmsTemplate.LOGIN_B);
            return RJson.ok("获取验证码成功");
        } catch (SystemException e) {
            e.printStackTrace();
            return RJson.error("获取验证码失败");
        }
        */

    }

}
