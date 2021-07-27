package com.example.eduservice.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.eduservice.entity.EduCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.eduservice.entity.frontvo.CourseFrontVo;
import com.example.eduservice.entity.frontvo.CourseWebVo;
import com.example.eduservice.entity.vo.CourseInfoVo;
import com.example.eduservice.entity.vo.CoursePublishVo;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 服务类
 * </p>
 *
 * @author June
 * @since 2021-07-10
 */
public interface EduCourseService extends IService<EduCourse> {

    CourseInfoVo getCourseInfo(String courseId);

    void updateCourseInfo(CourseInfoVo courseInfoVo);

    CoursePublishVo getCoursePublishVo(String courseId);

    void deleteCourse(String courseId);

    Map<String, Object> getCourseFrontList(Page<EduCourse> page, CourseFrontVo courseFrontVo);

    CourseWebVo getFrontCourseInfo(String courseId);
}
