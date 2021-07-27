package com.example.eduservice.service.impl;

import com.example.eduservice.entity.EduCourse;
import com.example.eduservice.entity.EduCourseDescription;
import com.example.eduservice.entity.vo.CourseInfoVo;
import com.example.eduservice.mapper.EduCourseDescriptionMapper;
import com.example.eduservice.service.EduCourseDescriptionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.servicebase.exeception.GuliException;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程简介 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-10
 */
@Service
public class EduCourseDescriptionServiceImpl extends ServiceImpl<EduCourseDescriptionMapper, EduCourseDescription> implements EduCourseDescriptionService {

}
