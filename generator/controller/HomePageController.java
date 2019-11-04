package com.yp.enterprise.controller;

import com.yp.enterprise.common.vo.RJson;
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
@Api(description = "招聘相关接口")
@EnableSwagger2
@RestController
@RequestMapping("/ent/homePage")
public class HomePageController {


    @ApiOperation("获取统计信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name="company_id",value="公司Id",required = true,dataType="String"),
    })
    @PostMapping("/getSumList")
    public RJson getFJobList(String company_id) {
        return RJson.ok();
    }


}
