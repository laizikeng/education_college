package com.example.eduservice.controller.front;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.ResultEntity;
import com.example.eduservice.entity.EduCourse;
import com.example.eduservice.entity.EduTeacher;
import com.example.eduservice.service.EduCourseService;
import com.example.eduservice.service.EduTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/eduservice/index-front")
public class IndexFrontController {
    @Autowired
    private EduCourseService eduCourseService;
    @Autowired
    private EduTeacherService eduTeacherService;

    @GetMapping("index")
    public ResultEntity index() {
        // 查询前八条热门课程
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("id");
        wrapper.last("limit 8");
        List<EduCourse> courseList = eduCourseService.list(wrapper);

        // 查询前四条讲师
        QueryWrapper<EduTeacher> wrapper1 = new QueryWrapper<>();
        wrapper1.orderByDesc("id");
        wrapper1.last("limit 4");
        List<EduTeacher> teacherList = eduTeacherService.list(wrapper1);
        return ResultEntity.ok().data("courseList",courseList).data("teacherList",teacherList);
    }
}
