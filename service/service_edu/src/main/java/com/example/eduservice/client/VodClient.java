package com.example.eduservice.client;

import com.example.ResultEntity;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Component
@FeignClient(value = "service-vod",fallback = VodFileDegradeFeignClient.class)
public interface VodClient {
    // 此处@PathVariable必须指定路径名称
    @DeleteMapping("/eduvod/deleteVideo/{id}")
    public ResultEntity deleteVideo(@PathVariable("id") String id);
    @DeleteMapping("/eduvod/delete-batch")
    public ResultEntity deleteBatchVideo(@RequestParam("videoList") List<String> videoList);
}
