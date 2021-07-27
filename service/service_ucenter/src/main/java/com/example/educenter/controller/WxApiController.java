package com.example.educenter.controller;


import com.example.educenter.entity.UcenterMember;
import com.example.educenter.service.UcenterMemberService;
import com.example.educenter.utils.ConstantWxUtils;
import com.example.educenter.utils.HttpClientUtils;
import com.example.utils.JwtUtils;
import com.example.servicebase.exeception.GuliException;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.UUID;

@Controller
@RequestMapping("/api/ucenter/wx")
public class WxApiController {
    @Autowired
    private UcenterMemberService ucenterMemberService;

    @GetMapping("login")
    public String getWxCode() {
        // 微信开放平台授权baseUrl
        String baseUrl = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "#wechat_redirect";
        // 回调地址
        String redirectUrl = ConstantWxUtils.WX_OPEN_REDIRECT_URL; //获取业务服务器重定向地址
        try {
            redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8"); //url编码
        } catch (UnsupportedEncodingException e) {
            throw new GuliException(20001, e.getMessage());
        }
        // 防止csrf攻击（跨站请求伪造攻击）
        String state = UUID.randomUUID().toString().replaceAll("-", "");
        ;//为了让大家能够使用我搭建的外网的微信回调跳转服务器，这里填写你在ngrok的前置域名
        String qrcodeUrl = String.format(
                baseUrl,
                ConstantWxUtils.WX_OPEN_APP_ID,
                redirectUrl,
                state);
        return "redirect:" + qrcodeUrl;
    }

    @GetMapping("callback")
    public String callback(String code, String state) {
        try {
            String baseAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token" +
                    "?appid=%s" +
                    "&secret=%s" +
                    "&code=%s" +
                    "&grant_type=authorization_code";
            //拼接三个参数 ：id  秘钥 和 code值
            String accessTokenUrl = String.format(
                    baseAccessTokenUrl,
                    ConstantWxUtils.WX_OPEN_APP_ID,
                    ConstantWxUtils.WX_OPEN_APP_SECRET,
                    code);
            String accessTokenInfo = HttpClientUtils.get(accessTokenUrl);

            HashMap<String, String> hashMap = new Gson().fromJson(accessTokenInfo, HashMap.class);
            String access_token = hashMap.get("access_token");
            String openid = hashMap.get("openid");

            String baseUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo" +
                    "?access_token=%s" +
                    "&openid=%s";
            String userInfoUrl = String.format(baseUserInfoUrl, access_token, openid);
            String userInfo = HttpClientUtils.get(userInfoUrl);

            HashMap<String, String> userMap = new Gson().fromJson(userInfo, HashMap.class);
            String nickname = userMap.get("nickname");
            String headimgurl = userMap.get("headimgurl");


            UcenterMember u = ucenterMemberService.getOpenIdMember(openid);
            if (u == null) {
                u = new UcenterMember();
                u.setOpenid(openid);
                u.setNickname(nickname);
                u.setAvatar(headimgurl);
                ucenterMemberService.save(u);
            }
            return "redirect:http://localhost:3000?token="+ JwtUtils.getJwtToken(u.getId(),u.getNickname());
        } catch (Exception e) {
            throw new GuliException(20001,"登录失败");
        }
    }
}
