package com.example.eduservice.controller;

import com.example.ResultEntity;
import io.swagger.annotations.Api;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/eduservice/user")
public class EduLoginController {
    @PostMapping("login")
    public ResultEntity login(){
        return ResultEntity.ok().data("token","admin");
    }

    @GetMapping("info")
    public ResultEntity info(){
        return ResultEntity.ok().data("roles","admin").data("name","admin").data("avatar","https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
    }
}
