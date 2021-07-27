package com.example.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.ResultEntity;
import com.example.eduservice.entity.EduChapter;
import com.example.eduservice.entity.vo.chapter.ChapterVo;
import com.example.eduservice.service.EduChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.xml.transform.Result;
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
@RequestMapping("/eduservice/edu-chapter")
public class EduChapterController {
    @Autowired
    private EduChapterService eduChapterService;

    // 课程大纲列表，根据课程id进行查询
    @GetMapping("getChapterVideo/{courseId}")
    public ResultEntity getChapterVideo(@PathVariable String courseId){
        List<ChapterVo> list = eduChapterService.getChapterVideoByCourseId(courseId);
        return ResultEntity.ok().data("chapterVideoList",list);
    }

    @PostMapping("addChapter")
    public ResultEntity addChapter(@RequestBody EduChapter eduChapter){
        eduChapterService.save(eduChapter);
        return ResultEntity.ok();
    }
    @GetMapping("getChapterInfo/{chapterId}")
    public ResultEntity getChapterInfo(@PathVariable String chapterId){
        EduChapter byId = eduChapterService.getById(chapterId);
        return ResultEntity.ok().data("chapter",byId);
    }
    @DeleteMapping("deleteChapter/{chapterId}")
    public ResultEntity deleteChapter(@PathVariable String chapterId){
        return eduChapterService.deleteChapter(chapterId)?ResultEntity.ok():ResultEntity.error();
    }
    @PostMapping("updateChapter")
    public ResultEntity updateChapter(@RequestBody EduChapter c){
        return eduChapterService.updateById(c)?ResultEntity.ok():ResultEntity.error();
    }
}

