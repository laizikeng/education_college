package com.example.eduorder.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.eduorder.entity.Order;
import com.example.eduorder.entity.PayLog;
import com.example.eduorder.mapper.PayLogMapper;
import com.example.eduorder.service.OrderService;
import com.example.eduorder.service.PayLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.eduorder.utils.HttpClient;
import com.example.eduorder.utils.WXPayConstant;
import com.example.servicebase.exeception.GuliException;
import com.github.wxpay.sdk.WXPayUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 支付日志表 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-19
 */
@Service
public class PayLogServiceImpl extends ServiceImpl<PayLogMapper, PayLog> implements PayLogService {
    @Autowired
    private OrderService orderService;

    @Override
    public Map<String, Object> createOrderQR(String orderNo) {
        try {
            // 1.根据订单号查询订单信息
            QueryWrapper<Order> wrapper = new QueryWrapper<>();
            wrapper.eq("order_no",orderNo);
            Order order = orderService.getOne(wrapper);

            // 2.使用map设置生成二维码需要参数
            Map<String,String> m = new HashMap<>();
            m.put("appid", WXPayConstant.APP_ID);
            m.put("mch_id", WXPayConstant.PARTNER);
            m.put("nonce_str", WXPayUtil.generateNonceStr());
            m.put("body", order.getCourseTitle()); //课程标题
            m.put("out_trade_no", orderNo); //订单号
            m.put("total_fee", order.getTotalFee().multiply(new BigDecimal("100")).longValue()+"");
            m.put("spbill_create_ip", "127.0.0.1");
            m.put("notify_url", WXPayConstant.NOTIFYURL);
            m.put("trade_type", "NATIVE");


            // 3.发送httpclient请求，传递xml格式，微信支付提供固定的地址
            HttpClient client = new HttpClient("https://api.mch.weixin.qq.com/pay/unifiedorder");
            client.setXmlParam(WXPayUtil.generateSignedXml(m,WXPayConstant.PARTNERKEY));
            client.setHttps(true);
            client.post();

            // 4.得到请求返回结果，注意结果是xml格式
            String content = client.getContent();

            Map<String,String> result = WXPayUtil.xmlToMap(content);

            Map<String,Object> finalMap = new HashMap();
            finalMap.put("out_trade_no", orderNo);
            finalMap.put("course_id", order.getCourseId());
            finalMap.put("total_fee", String.valueOf(order.getTotalFee()));
            finalMap.put("result_code", result.get("result_code"));  //返回二维码操作状态码
            finalMap.put("code_url", result.get("code_url"));        //二维码地址


            return finalMap;
        } catch (Exception e) {
            e.printStackTrace();
            throw new GuliException(20001,"调用微信支付失败");
        }
    }

    // 查询微信支付状态
    @Override
    public Map<String, String> getPayStatus(String orderNo) {
        try {
            // 封装参数
            Map m = new HashMap();
            m.put("appid", WXPayConstant.APP_ID);
            m.put("mch_id", WXPayConstant.PARTNER);
            m.put("out_trade_no", orderNo);
            m.put("nonce_str", WXPayUtil.generateNonceStr());

            // 发送请求
            HttpClient client = new HttpClient("https://api.mch.weixin.qq.com/pay/orderquery");
            client.setXmlParam(WXPayUtil.generateSignedXml(m, WXPayConstant.PARTNERKEY));
            client.setHttps(true);
            client.post();

            // 得到第三方的数据
            String xml = client.getContent();
            // 转成Map
            Map<String, String> resultMap = WXPayUtil.xmlToMap(xml);
            return resultMap;
        } catch (Exception e) {
            e.printStackTrace();
            throw new GuliException(20001,"获取支付状态失败");
        }
    }

    @Override
    public void updateOrderStatus(Map<String, String> map) {
        // 从map中获取订单号
        String orderNo = map.get("out_trade_no");

        // 根据订单号查询订单信息
        QueryWrapper<Order> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no",orderNo);
        Order order = orderService.getOne(wrapper);

        // 更新订单状态
        if(order.getStatus() == 1){return;}
        order.setStatus(1); // 1代表已支付
        orderService.updateById(order);

        // 向支付表添加支付记录
        PayLog payLog = new PayLog();
        payLog.setOrderNo(order.getOrderNo());//支付订单号
        payLog.setPayTime(new Date());
        payLog.setPayType(1);//支付类型
        payLog.setTotalFee(order.getTotalFee());//总金额(分)
        payLog.setTradeState(map.get("trade_state"));//支付状态
        payLog.setTransactionId(map.get("transaction_id"));
        payLog.setAttr(JSONObject.toJSONString(map));
        baseMapper.insert(payLog);//插入到支付日志表
    }
}
