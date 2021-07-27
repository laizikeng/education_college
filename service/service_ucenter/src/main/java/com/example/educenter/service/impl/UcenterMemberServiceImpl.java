package com.example.educenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.utils.MD5;
import com.example.educenter.entity.UcenterMember;
import com.example.educenter.entity.vo.RegisterVo;
import com.example.educenter.mapper.UcenterMemberMapper;
import com.example.educenter.service.UcenterMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.utils.JwtUtils;
import com.example.servicebase.exeception.GuliException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 会员表 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-16
 */
@Service
public class UcenterMemberServiceImpl extends ServiceImpl<UcenterMemberMapper, UcenterMember> implements UcenterMemberService {
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    public String login(UcenterMember ucenterMember) {

        String mobile = ucenterMember.getMobile();
        String password = ucenterMember.getPassword();
        if (StringUtils.isAnyEmpty(mobile, password)) {
            throw new GuliException(20001, "账号或密码错误！");
        }

        // 判断手机号是否正确
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        UcenterMember member = baseMapper.selectOne(wrapper);
        if (member == null) {
            throw new GuliException(20001, "手机号错误");
        }

        // 判断密码
        if (!MD5.encrypt(password).equals(member.getPassword())) {
            throw new GuliException(20001, "密码错误！");
        }

        // 判断是否封号
        if (member.getIsDisabled()) {
            throw new GuliException(20001, "您的账号已被封禁！");
        }

        // 登陆成功，返回token值
        String jwtToken = JwtUtils.getJwtToken(member.getId(), member.getNickname());
        return jwtToken;
    }

    @Override
    public void register(RegisterVo registerVo) {
        String code = registerVo.getCode();
        String phone = registerVo.getMobile();
        String nickname = registerVo.getNickname();
        String password = registerVo.getPassword();

        // 非空判断
        if (StringUtils.isAnyEmpty(code, password, phone, nickname)) {
            throw new GuliException(20001, "任何字段值不能为空");
        }

        // 判断验证码
        String s = redisTemplate.opsForValue().get(phone);
        if (!code.equals(s)) {
            throw new GuliException(20001, "验证码不正确");
        }

        // 判断是否存在相同手机号，表里存在相同手机号不进行添加
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", phone);
        Integer count = baseMapper.selectCount(wrapper);
        if (count > 0) {
            throw new GuliException(20001, "手机号已存在");
        }

        UcenterMember member = new UcenterMember();
        member.setMobile(phone);
        member.setNickname(nickname);
        member.setPassword(MD5.encrypt(password));
//        member.setIsDisabled(false);
        member.setAvatar("http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132");
        baseMapper.insert(member);
    }

    @Override
    public UcenterMember getOpenIdMember(String openid) {
        QueryWrapper<UcenterMember> wrapper =new QueryWrapper<>();
        wrapper.eq("openid",openid);
        UcenterMember member = baseMapper.selectOne(wrapper);
        return member;
    }

    @Override
    public Integer countRegisterDaily(String day) {
        return baseMapper.countRegisterDaily(day);
    }


}
