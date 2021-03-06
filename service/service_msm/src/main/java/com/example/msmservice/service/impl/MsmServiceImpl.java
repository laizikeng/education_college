package com.example.msmservice.service.impl;

import com.example.msmservice.service.MsmService;
import com.example.msmservice.utils.HttpUtils;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class MsmServiceImpl implements MsmService {
    @Value("${msm.appcode}")
    private String appcode;
    @Override
    public boolean send(Map<String, Object> param, String phone) {
        String host = "http://edisim.market.alicloudapi.com";
        String path = "/comms/sms/groupmessaging";
        String method = "POST";
        String appcode = this.appcode;
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);
        //根据API的要求，定义相对应的Content-Type
        headers.put("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        Map<String, String> querys = new HashMap<String, String>();
        Map<String, String> bodys = new HashMap<String, String>();
        bodys.put("callbackUrl", "http://www.esandinfo.com/sms/notify");
        bodys.put("mobileSet", "["+phone+"]");
        bodys.put("templateID", "20210716211111");
        bodys.put("templateParamSet", param.get("code")+",5");
        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
//            System.out.println(response.toString());
            //获取response的body
            //System.out.println(EntityUtils.toString(response.getEntity()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
