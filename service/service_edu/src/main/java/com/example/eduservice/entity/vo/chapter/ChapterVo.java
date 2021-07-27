package com.example.eduservice.entity.vo.chapter;


import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class ChapterVo {
    private String id;
    private String title;

    private List<VideoVo> children = new ArrayList<>();
}
