package com.example.eduostatistic.client;

import com.example.ResultEntity;
import com.example.common_vo.UcenterMemberOrder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Component
@FeignClient("service-ucenter")
public interface UcenterClient {
    @GetMapping("/educenter/ucenter-member/countRegister/{day}")
    public ResultEntity countRegister(@PathVariable(value = "day") String day);
}
