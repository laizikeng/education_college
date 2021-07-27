package com.example.eduorder.service;

import com.example.eduorder.entity.Order;
import com.baomidou.mybatisplus.extension.service.IService;
import io.swagger.annotations.ApiOperation;

/**
 * <p>
 * 订单 服务类
 * </p>
 *
 * @author June
 * @since 2021-07-19
 */
public interface OrderService extends IService<Order> {
    String createOrder(String courseId, String memberId);
}
