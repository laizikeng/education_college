package com.example.eduservice.mapper;

import com.example.eduservice.entity.EduCourse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.eduservice.entity.frontvo.CourseWebVo;
import com.example.eduservice.entity.vo.CoursePublishVo;
import org.mapstruct.Mapper;

/**
 * <p>
 * 课程 Mapper 接口
 * </p>
 *
 * @author June
 * @since 2021-07-10
 */
public interface EduCourseMapper extends BaseMapper<EduCourse> {
    CoursePublishVo getPublishCourseInfo(String courseId);

    CourseWebVo getFrontCourseInfo(String courseId);
}
