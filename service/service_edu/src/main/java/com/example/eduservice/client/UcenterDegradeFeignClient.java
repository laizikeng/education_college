package com.example.eduservice.client;

import com.example.ResultEntity;
import com.example.common_vo.UcenterMemberComment;
import com.example.common_vo.UcenterMemberOrder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Slf4j
public class UcenterDegradeFeignClient implements UcenterClient{
    @Override
    public UcenterMemberOrder getUserInfoOrder(String id) {
        log.error("无法获取用户信息-订单模块");
        return null;
    }

    @Override
    public UcenterMemberComment getUserInfoComment(String id) {
        log.error("无法获取用户信息-评论模块");
        return null;
    }
}
