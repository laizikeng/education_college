package com.example.eduservice.controller;


import com.example.ResultEntity;
import com.example.eduservice.client.VodClient;
import com.example.eduservice.entity.EduChapter;
import com.example.eduservice.entity.EduVideo;
import com.example.eduservice.entity.vo.chapter.VideoVo;
import com.example.eduservice.service.EduVideoService;
import com.example.servicebase.exeception.GuliException;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 课程视频 前端控制器
 * </p>
 *
 * @author June
 * @since 2021-07-10
 */
@RestController
@RequestMapping("/eduservice/edu-video")
public class EduVideoController {
    @Autowired
    private EduVideoService eduVideoService;
    @Autowired
    private VodClient vodClient;
    @PostMapping("addVideo")
    public ResultEntity addVideo(@RequestBody EduVideo eduVideo){
        return eduVideoService.save(eduVideo)?ResultEntity.ok():ResultEntity.error();
    }
    @DeleteMapping("deleteVideoImmediately/{videoSourceId}")
    public ResultEntity deleteVideoImmediately(@PathVariable("videoSourceId") String videoSourceId){
        vodClient.deleteVideo(videoSourceId);
        return ResultEntity.ok();
    }

    @DeleteMapping("deleteVideo/{id}")
    public ResultEntity deleteVideo(@PathVariable String id){
        // 根据小节（video）id得到视频id
        EduVideo eduVideo = eduVideoService.getById(id);
        if(eduVideo==null)return ResultEntity.ok();
        String videoSourceId = eduVideo.getVideoSourceId();
        if(StringUtils.isNotEmpty(videoSourceId)){
            // 删除视频，每个小节只有一个视频！
            ResultEntity r = vodClient.deleteVideo(videoSourceId);
            if(r.getCode()==20001){
                throw new GuliException(20001,"删除视频失败，熔断。。。");
            }
        }
        // 删除小节，注意不能先删除
        eduVideoService.removeById(id);
        return ResultEntity.ok();
    }

    @GetMapping("getVideoInfo/{id}")
    public ResultEntity getVideoInfo(@PathVariable String id){
        EduVideo byId = eduVideoService.getById(id);
        return ResultEntity.ok().data("video",byId);
    }

    @PostMapping("updateVideo")
    public ResultEntity updateVideo(@RequestBody EduVideo eduVideo){
        return eduVideoService.updateById(eduVideo)?ResultEntity.ok():ResultEntity.error();
    }

}

