package com.example.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ResultEntity;
import com.example.eduservice.entity.EduComment;
import com.example.eduservice.service.EduCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 评论 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-18
 */
@RestController
@RequestMapping("/eduservice/edu-comment")
public class EduCommentController {

    @Autowired
    private EduCommentService eduCommentService;

    @PostMapping("pageComment/{current}/{limit}/{courseId}")
    public ResultEntity pageComment(@PathVariable long current,@PathVariable long limit,@PathVariable String courseId){
        Page<EduComment> page = new Page<>(current,limit);
        QueryWrapper<EduComment> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        wrapper.orderByDesc("gmt_modified");
        eduCommentService.page(page,wrapper);

        return ResultEntity.ok().data("list",page.getRecords()).data("total",page.getTotal());
    }

    @PostMapping("addComment")
    public ResultEntity addComment(@RequestBody EduComment eduComment, HttpServletRequest request){
        return eduCommentService.addComment(eduComment,request)?ResultEntity.ok():ResultEntity.error();
    }

}

