package com.example.eduorder.client;

import com.example.common_vo.UcenterMemberOrder;
import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient("service-ucenter")
public interface UcenterClient {
    @PostMapping("/educenter/ucenter-member/getUserInfoOrder/{memberId}")
    public UcenterMemberOrder getUserInfoOrder(@PathVariable String memberId);
}
