package com.example.msmservice.controller;

import com.example.ResultEntity;
import com.example.msmservice.service.MsmService;
import com.example.utils.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/edumsm")
public class MsmController {
    @Autowired
    private MsmService msmService;
    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @GetMapping("send/{phone}")
    public ResultEntity senMsm(@PathVariable String phone){

        // redis 设置 phone->code
        String code = RandomUtils.getFourBitRandom();
        Map<String,Object> param = new HashMap<>();
        param.put("code",code);
        boolean isSend = msmService.send(param,phone);
        if(isSend){
            // 新手机号的验证码设置到redis中
            redisTemplate.opsForValue().set(phone,code,5, TimeUnit.MINUTES);
            return ResultEntity.ok();
        }else{
            return ResultEntity.error().message("短信发送失败");
        }
    }
}
