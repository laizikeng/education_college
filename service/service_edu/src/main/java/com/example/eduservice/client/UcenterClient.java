package com.example.eduservice.client;


import com.example.common_vo.UcenterMemberComment;
import com.example.common_vo.UcenterMemberOrder;
import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient(value = "service-ucenter",fallback = UcenterDegradeFeignClient.class)
public interface UcenterClient {
    @ApiOperation("根据用户id获取用户信息-订单模块")
    @PostMapping("getUserInfoOrder/{memberId}")
    public UcenterMemberOrder getUserInfoOrder(@PathVariable String memberId);

    @ApiOperation("根据用户id获取用户信息-评论模块")
    @PostMapping("/educenter/ucenter-member/getUserInfoComment/{memberId}")
    public UcenterMemberComment getUserInfoComment(@PathVariable String memberId);
}
