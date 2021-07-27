package com.example.eduorder.utils;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class WXPayConstant implements InitializingBean {

    @Value("${weixin.pay.appid}")
    private String appid;
    @Value("${weixin.pay.partner}")
    private String partner;
    @Value("${weixin.pay.partnerkey}")
    private String partnerkey;
    @Value("${weixin.pay.notifyurl}")
    private String notifyurl;


    public static String APP_ID;
    public static String PARTNER;
    public static String PARTNERKEY;
    public static String NOTIFYURL;

    @Override
    public void afterPropertiesSet() throws Exception {
        APP_ID = appid;
        PARTNER = partner;
        PARTNERKEY = partnerkey;
        NOTIFYURL = notifyurl;
    }
}
