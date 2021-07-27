package com.example.educenter.controller;


import com.example.ResultEntity;
import com.example.common_vo.UcenterMemberComment;
import com.example.common_vo.UcenterMemberOrder;
import com.example.educenter.entity.UcenterMember;
import com.example.educenter.entity.vo.RegisterVo;
import com.example.educenter.service.UcenterMemberService;
import com.example.utils.JwtUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-16
 */
@RestController
@RequestMapping("/educenter/ucenter-member")
public class UcenterMemberController {
    @Autowired
    private UcenterMemberService ucenterMemberService;

    @ApiOperation("登录")
    @PostMapping("login")
    public ResultEntity loginUser(@RequestBody UcenterMember ucenterMember){

        String token = ucenterMemberService.login(ucenterMember);
        return ResultEntity.ok().data("token",token);
    }
    @ApiOperation("注册")
    @PostMapping("register")
    public ResultEntity registerUser(@RequestBody RegisterVo registerVo){
        ucenterMemberService.register(registerVo);
        return ResultEntity.ok();
    }


    @ApiOperation("根据请求（头）获取用户信息")
    @GetMapping("getMemberInfo")
    public ResultEntity getMemberInfo(HttpServletRequest request) {
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        UcenterMember member = ucenterMemberService.getById(memberId);
        return ResultEntity.ok().data("userInfo", member);
    }

    @ApiOperation("根据用户id获取用户信息-订单模块")
    @PostMapping("getUserInfoOrder/{memberId}")
    public UcenterMemberOrder getUserInfoOrder(@PathVariable String memberId){
        UcenterMember member = ucenterMemberService.getById(memberId);
        UcenterMemberOrder ucenterMemberOrder = new UcenterMemberOrder();
        BeanUtils.copyProperties(member,ucenterMemberOrder);
        return ucenterMemberOrder;
    }
    @ApiOperation("根据用户id获取用户信息-评论模块")
    @PostMapping("getUserInfoComment/{memberId}")
    public UcenterMemberComment getUserInfoComment(@PathVariable String memberId){
        UcenterMember member = ucenterMemberService.getById(memberId);
        UcenterMemberComment ucenterMemberComment = new UcenterMemberComment();
        BeanUtils.copyProperties(member,ucenterMemberComment);
        return ucenterMemberComment;
    }

    @ApiOperation("查询某一天注册人数")
    @GetMapping("countRegister/{day}")
    public ResultEntity countRegister(@PathVariable(value = "day") String day){
        Integer count = ucenterMemberService.countRegisterDaily(day);
        return ResultEntity.ok().data("count",count);
    }
}

