package com.example.eduostatistic.controller;


import com.example.ResultEntity;
import com.example.eduostatistic.client.UcenterClient;
import com.example.eduostatistic.service.StatisticsDailyService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-20
 */
@RestController
@RequestMapping("/statistics-daily")
public class StatisticsDailyController {

    @Autowired
    private StatisticsDailyService staServic;
    @ApiOperation("统计某一天注册人数")
    @PostMapping("registerCount/{day}")
    public ResultEntity registerCount(@PathVariable String day){

        staServic.registerCount(day);
        return ResultEntity.ok();
    }

    @ApiOperation("返回图表数据")
    @GetMapping("getData/{type}/{begin}/{end}")
    public ResultEntity getData(@PathVariable String type,@PathVariable String begin,@PathVariable String end){
        Map<String,Object> map = staServic.getData(type,begin,end);
        return ResultEntity.ok().data(map);
    }

}

