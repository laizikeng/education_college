package com.example.eduorder.controller;


import com.example.ResultEntity;
import com.example.eduorder.service.PayLogService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 支付日志表 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-19
 */
@RestController
@RequestMapping("/eduorder/pay-log")
public class PayLogController {
    @Autowired
    private PayLogService payLogService;

    @ApiOperation("生成微信支付二维码")
    @PostMapping("createOrderQR/{orderNo}")
    public ResultEntity createOrderQR(@PathVariable String orderNo){
        Map<String, Object> map = payLogService.createOrderQR(orderNo);
        return ResultEntity.ok().data(map);
    }

    @ApiOperation("查询支付状态")
    @GetMapping("getOrderStatus/{orderNo}")
    public ResultEntity getOrderStatus(@PathVariable String orderNo){
        System.out.println(orderNo);
        Map<String,String> map = payLogService.getPayStatus(orderNo);
        if(map==null){
            return ResultEntity.error().message("支付出错");
        }

        if(map.get("trade_state").equals("SUCCESS")){
            // 成功支付，添加记录到支付表，更新订单状态
            payLogService.updateOrderStatus(map);
            return ResultEntity.ok().code(20000).message("支付成功");
        }

        return ResultEntity.ok().code(25000).message("支付中...");
    }

}

