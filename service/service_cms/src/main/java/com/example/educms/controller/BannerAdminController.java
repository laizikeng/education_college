package com.example.educms.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ResultEntity;
import com.example.educms.entity.CrmBanner;
import com.example.educms.service.CrmBannerService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.xml.transform.Result;

/**
 * <p>
 * 首页banner表 后台banner管理
 * </p>
 *
 * @author June
 * @since 2021-07-15
 */
@RestController
@RequestMapping("/educms/admin-banner")
public class BannerAdminController {
    @Autowired
    private CrmBannerService crmBannerService;


    @ApiOperation("分页查询")
    @GetMapping("pageBanner/{current}/{limit}")
    public ResultEntity pageBanner(@PathVariable long current,@PathVariable long limit){
        Page<CrmBanner> pageBanner = new Page<>(current,limit);
        crmBannerService.page(pageBanner,null);
        return ResultEntity.ok().data("items",pageBanner.getRecords()).data("total",pageBanner.getTotal());
    }

    @ApiOperation("修改Banner")
    @PostMapping("updateBanner")
    public ResultEntity updateBanner(@RequestBody CrmBanner crmBanner){
        return crmBannerService.updateById(crmBanner)?ResultEntity.ok():ResultEntity.error();
    }

    @ApiOperation("添加Banner")
    @PostMapping("addBanner")
    public ResultEntity addBanner(@RequestBody CrmBanner crmBanner){
        return crmBannerService.save(crmBanner)?ResultEntity.ok():ResultEntity.error();
    }

    @ApiOperation("删除Banner")
    @PostMapping("deleteBanner/{bannerId}")
    public ResultEntity addBanner(@PathVariable String bannerId){
        return crmBannerService.removeById(bannerId)?ResultEntity.ok():ResultEntity.error();
    }

}

