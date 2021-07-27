package com.example.eduservice.controller.front;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ResultEntity;
import com.example.eduservice.entity.EduCourse;
import com.example.eduservice.entity.EduTeacher;
import com.example.eduservice.service.EduCourseService;
import com.example.eduservice.service.EduTeacherService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduservice/teacherfront")
public class TeacherFrontController {
    @Autowired
    private EduTeacherService eduTeacherService;
    @Autowired
    private EduCourseService eduCourseService;

    @ApiOperation("前端 讲师分页查询")
    @PostMapping("getTeacherFrontList/{current}/{limit}")
    public ResultEntity getTeacherFrontList(@PathVariable long current,@PathVariable long limit){
        Page<EduTeacher> page = new Page<>(current,limit);
        Map<String,Object> map = eduTeacherService.getTeacherFrontList(page);
        return ResultEntity.ok().data(map);
    }


    @ApiOperation("前端 讲师详情查询")
    @GetMapping("getTeacherFrontInfo/{teacherId}")
    public ResultEntity getTeacherFrontInfo(@PathVariable String teacherId){
        EduTeacher eduTeacher = eduTeacherService.getById(teacherId);
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        wrapper.eq("teacher_id",teacherId);
        List<EduCourse> courseList = eduCourseService.list(wrapper);
        return ResultEntity.ok().data("teacher",eduTeacher).data("courseList",courseList);
    }

}
