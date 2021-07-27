package com.example.vod.controller;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthResponse;
import com.example.ResultEntity;
import com.example.servicebase.exeception.GuliException;
import com.example.vod.service.VodService;
import com.example.vod.utils.ConstantVodUtils;
import com.example.vod.utils.InitVodClient;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/eduvod")
public class VodController {
    @Autowired
    private VodService vodService;


    @ApiModelProperty("上传视频到阿里云")
    @PostMapping("uploadVideo")
    public ResultEntity uploadVideo(MultipartFile file){
        String videoId = vodService.uploadVideo(file);
        return ResultEntity.ok().data("videoId",videoId);
    }

    @DeleteMapping("deleteVideo/{id}")
    public ResultEntity deleteVideo(@PathVariable String id){

        try {
            DeleteVideoRequest request = new DeleteVideoRequest();
            request.setVideoIds(id);

            DefaultAcsClient dac = InitVodClient.initVodClient(ConstantVodUtils.ACCESS_KEY_ID,ConstantVodUtils.ACCESS_KEY_SECRET);
            dac.getAcsResponse(request);

            return ResultEntity.ok();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GuliException(20001,"删除视频失败");
        }

    }

    @DeleteMapping("delete-batch")
    public ResultEntity deleteBatchVideo(@RequestParam("videoList") List<String> videoList){
        vodService.removeBatch(videoList);
        return ResultEntity.ok();
    }

    @ApiOperation("获取视频播放凭证")
    @GetMapping("getPlayAuth/{id}")
    public ResultEntity getPlayAuth(@PathVariable String id){
        try{
            DefaultAcsClient client = InitVodClient.initVodClient(ConstantVodUtils.ACCESS_KEY_ID, ConstantVodUtils.ACCESS_KEY_SECRET);
            GetVideoPlayAuthRequest request = new GetVideoPlayAuthRequest();
            request.setVideoId(id);
            GetVideoPlayAuthResponse response = client.getAcsResponse(request);
            String playAuth = response.getPlayAuth();
            return ResultEntity.ok().data("playAuth",playAuth);
        }catch (Exception e){
            throw new GuliException(20001,"获取凭证失败");
        }
    }

}
