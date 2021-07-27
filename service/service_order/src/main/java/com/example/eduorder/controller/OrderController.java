package com.example.eduorder.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.ResultEntity;
import com.example.eduorder.entity.Order;
import com.example.eduorder.service.OrderService;
import com.example.utils.JwtUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 订单 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-19
 */

@RestController
@RequestMapping("/eduorder/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    // 生成订单
    @PostMapping("generateOrder/{courseId}")
    public ResultEntity generateOrder(@PathVariable String courseId, HttpServletRequest request) {
        // 创建订单，获取订单号
        String orderNo = orderService.createOrder(courseId, JwtUtils.getMemberIdByJwtToken(request));
        return ResultEntity.ok().data("orderNo",orderNo);
    }

    // 根据订单id查询订单信息
    @PostMapping("getOrderInfo/{orderId}")
    public ResultEntity getOrderInfo(@PathVariable String orderId){
        QueryWrapper<Order> wrapper =new QueryWrapper<>();
        wrapper.eq("order_no",orderId);
        Order order = orderService.getOne(wrapper);
        return ResultEntity.ok().data("order",order);
    }

    @ApiOperation("根据课程id和用户id查询订单表中的状态")
    @GetMapping("isBuy/{courseId}/{memberId}")
    public boolean isBuy(@PathVariable(value = "courseId") String courseId,
                         @PathVariable(value = "memberId") String memberId
    ){

        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        wrapper.eq("member_id",memberId);
        wrapper.eq("status",1); // 1 代表已支付
        return orderService.count(wrapper) > 0;
    }
}

