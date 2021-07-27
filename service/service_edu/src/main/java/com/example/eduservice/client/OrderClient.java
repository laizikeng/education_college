package com.example.eduservice.client;

import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Component
@FeignClient(value = "service-order",fallback = OrderDegradeFeignClient.class)
public interface OrderClient {
    @ApiOperation("根据课程id和用户id查询订单表中的状态")
    @GetMapping("/eduorder/order/isBuy/{courseId}/{memberId}")
    public boolean isBuy(@PathVariable(value = "courseId") String courseId,
                         @PathVariable(value = "memberId") String memberId);

}
