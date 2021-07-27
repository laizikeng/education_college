package com.example.eduservice.controller;


import com.example.ResultEntity;
import com.example.eduservice.entity.subject.OneSubject;
import com.example.eduservice.service.EduSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-09
 */
@RestController
@RequestMapping("/eduservice/edu-subject")
public class EduSubjectController {
    @Autowired
    private EduSubjectService eduSubjectService;


    @PostMapping("addSubject")
    public ResultEntity addSubject(MultipartFile file){

        eduSubjectService.addSubject(file,eduSubjectService);

        return ResultEntity.ok();
    }

    @GetMapping("getAll")
    public ResultEntity getAllSubject(){
        List<OneSubject> list = eduSubjectService.getAllSubject();

        return ResultEntity.ok().data("list",list);
    }
}

