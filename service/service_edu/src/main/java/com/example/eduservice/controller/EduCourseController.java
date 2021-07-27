package com.example.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ResultEntity;
import com.example.eduservice.entity.EduCourse;
import com.example.eduservice.entity.EduCourseDescription;
import com.example.eduservice.entity.EduTeacher;
import com.example.eduservice.entity.vo.CourseInfoVo;
import com.example.eduservice.entity.vo.CoursePublishVo;
import com.example.eduservice.entity.vo.CourseQuery;
import com.example.eduservice.service.EduCourseDescriptionService;
import com.example.eduservice.service.EduCourseService;
import com.example.servicebase.exeception.GuliException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 课程 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-10
 */
@RestController
@RequestMapping("/eduservice/edu-course")
public class EduCourseController {
    @Autowired
    private EduCourseService eduCourseService;
    @Autowired
    private EduCourseDescriptionService eduCourseDescriptionService;

    @PostMapping("addCourseInfo")
    public ResultEntity addCourseInfo(@RequestBody CourseInfoVo courseInfoVo){

        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo,eduCourse);
        if(!eduCourseService.save(eduCourse)){
            throw new GuliException(20001,"添加课程信息失败");
        }
        EduCourseDescription description = new EduCourseDescription();
        BeanUtils.copyProperties(courseInfoVo,description);
        description.setId(eduCourse.getId()); // 课程与课程信息是一对一的关系，以主键联结
        if(!eduCourseDescriptionService.save(description)){
            throw new GuliException(20001,"添加课程描述信息失败");
        }

        return ResultEntity.ok().data("courseId",eduCourse.getId());
    }

    @GetMapping("getCourseInfo/{courseId}")
    public ResultEntity getCourseInfo(@PathVariable String courseId){
        CourseInfoVo vo = eduCourseService.getCourseInfo(courseId);

        return ResultEntity.ok().data("courseInfoVo",vo);
    }

    @PostMapping("updateCourseInfo")
    public ResultEntity updateCourseInfo(@RequestBody CourseInfoVo courseInfoVo){
        eduCourseService.updateCourseInfo(courseInfoVo);
        return ResultEntity.ok();
    }

    @GetMapping("getPublishCourseInfo/{id}")
    public ResultEntity getPublishCourseInfo(@PathVariable String id){
        CoursePublishVo vo = eduCourseService.getCoursePublishVo(id);
        return ResultEntity.ok().data("coursePublishVo",vo);
    }

    @PostMapping("publish/{id}")
    public ResultEntity publish(@PathVariable String id){
        EduCourse eduCourse = new EduCourse();
        eduCourse.setId(id);
        eduCourse.setStatus("Normal");
        eduCourseService.updateById(eduCourse);

        return ResultEntity.ok();
    }

    @GetMapping("getAllCourse")
    public ResultEntity getAllWithoutCondition(){
        List<EduCourse> list = eduCourseService.list(null);
        return ResultEntity.ok().data("list,",list);
    }
    @PostMapping("pageCourse/{limit}/{current}")
    public ResultEntity getAllWithCondition(@RequestBody(required = false) CourseQuery conditions,
                                            @PathVariable("limit") long limit,
                                            @PathVariable("current") long current){
        Page<EduCourse> page = new Page<>(current, limit);
        QueryWrapper wrapper = new QueryWrapper();
        if(conditions!=null){
            String title = conditions.getTitle();
            String status = conditions.getStatus();

            if (!StringUtils.isEmpty(title)) {
                wrapper.like("title", title);
            }
            if (!StringUtils.isEmpty(status)) {
                wrapper.like("status",status);
            }
        }
        eduCourseService.page(page, wrapper);
        return ResultEntity.ok().data("total", page.getTotal()).data("list", page.getRecords());
    }


    @DeleteMapping("deleteCourse/{courseId}")
    public ResultEntity deleteCourse(@PathVariable String courseId){
        eduCourseService.deleteCourse(courseId);
        return ResultEntity.ok();
    }

}

