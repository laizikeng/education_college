package com.example.oss.controller;

import com.example.ResultEntity;
import com.example.oss.service.OssService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/eduoss")
public class OssController {

    @Autowired
    private OssService ossService;

    @ApiOperation("上传 讲师头像")
    @PostMapping("teacher/avatar")
    public ResultEntity uploadAvatar(MultipartFile file) {
        String url = ossService.uploadFile(file,"teacher-avatar");
        return ResultEntity.ok().data("url",url);
    }
    @ApiOperation("上传 课程封面")
    @PostMapping("course/cover")
    public ResultEntity uploadCourseCover(MultipartFile file) {
        String url = ossService.uploadFile(file,"course-cover");
        return ResultEntity.ok().data("url",url);
    }
}
