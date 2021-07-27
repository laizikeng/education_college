package com.example.eduservice.client;

import com.alibaba.excel.event.Order;
import com.example.common_vo.UcenterMemberComment;
import com.example.common_vo.UcenterMemberOrder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class OrderDegradeFeignClient implements OrderClient {
    @Override
    public boolean isBuy(String courseId,String memberId) {
        log.error("无法获取购买信息");
        return false;
    }

}
