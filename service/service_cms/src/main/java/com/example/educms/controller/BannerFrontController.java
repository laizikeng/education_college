package com.example.educms.controller;


import com.example.ResultEntity;
import com.example.educms.entity.CrmBanner;
import com.example.educms.service.CrmBannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 前台banner显示
 */
@RestController
@RequestMapping("/educms/front-banner")
public class BannerFrontController {
    @Autowired
    private CrmBannerService crmBannerService;
    @GetMapping("getAllBanner")
    public ResultEntity getAllBanner(){
        List<CrmBanner> list = crmBannerService.selectAllBanner();
        return ResultEntity.ok().data("list",list);
    }
}
