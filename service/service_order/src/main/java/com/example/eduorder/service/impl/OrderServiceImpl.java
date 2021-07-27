package com.example.eduorder.service.impl;

import com.example.common_vo.CourseWebVoOrder;
import com.example.common_vo.UcenterMemberOrder;
import com.example.eduorder.client.EduClient;
import com.example.eduorder.client.UcenterClient;
import com.example.eduorder.entity.Order;
import com.example.eduorder.mapper.OrderMapper;
import com.example.eduorder.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.eduorder.utils.OrderNoUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.OrderUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-19
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Autowired
    private EduClient eduClient;
    @Autowired
    private UcenterClient ucenterClient;

    @Override
    public String createOrder(String courseId, String memberId) {
        UcenterMemberOrder userInfoOrder = ucenterClient.getUserInfoOrder(memberId);
        CourseWebVoOrder courseInfoOrder = eduClient.getCourseInfoOrder(courseId);

        //创建Order对象，向order对象里面设置需要数据
        Order order = new Order();
        order.setOrderNo(OrderNoUtil.getOrderNo());//订单号
        order.setCourseId(courseId); //课程id
        order.setCourseTitle(courseInfoOrder.getTitle());
        order.setCourseCover(courseInfoOrder.getCover());
        order.setTeacherId(courseInfoOrder.getTeacherId());
        order.setTotalFee(courseInfoOrder.getPrice());
        order.setMemberId(memberId);
        order.setMobile(userInfoOrder.getMobile());
        order.setNickname(userInfoOrder.getNickname());

        order.setStatus(0);  //订单状态（0：未支付 1：已支付）
        order.setPayType(1);  //支付类型 ，微信1
        baseMapper.insert(order);

        return order.getOrderNo();
    }
}
