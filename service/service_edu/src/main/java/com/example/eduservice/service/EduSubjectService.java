package com.example.eduservice.service;

import com.example.eduservice.entity.EduSubject;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.eduservice.entity.subject.OneSubject;
import com.example.eduservice.service.impl.EduSubjectServiceImpl;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author June
 * @since 2021-07-09
 */
public interface EduSubjectService extends IService<EduSubject> {

    void addSubject(MultipartFile file, EduSubjectService eduSubjectService);

    List<OneSubject> getAllSubject();
}
