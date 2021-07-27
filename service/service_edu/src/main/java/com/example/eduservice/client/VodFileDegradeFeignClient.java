package com.example.eduservice.client;

import com.example.ResultEntity;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class VodFileDegradeFeignClient implements VodClient{
    @Override
    public ResultEntity deleteVideo(String id) {
        return ResultEntity.error().message("删除视频出错！");
    }

    @Override
    public ResultEntity deleteBatchVideo(List<String> videoList) {
        return ResultEntity.error().message("删除多个视频出错！");
    }
}
