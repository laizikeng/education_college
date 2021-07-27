package com.example.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.eduservice.entity.EduChapter;
import com.example.eduservice.entity.EduVideo;
import com.example.eduservice.entity.vo.chapter.ChapterVo;
import com.example.eduservice.entity.vo.chapter.VideoVo;
import com.example.eduservice.mapper.EduChapterMapper;
import com.example.eduservice.service.EduChapterService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.eduservice.service.EduVideoService;
import com.example.servicebase.exeception.GuliException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-10
 */
@Service
public class EduChapterServiceImpl extends ServiceImpl<EduChapterMapper, EduChapter> implements EduChapterService {
    @Autowired
    public EduVideoService eduVideoService;

    @Override
    public List<ChapterVo> getChapterVideoByCourseId(String courseId) {
        QueryWrapper<EduChapter> wrapper = new QueryWrapper<>();
        wrapper.eq("course_id",courseId);
        List<EduChapter> eduChapterList = baseMapper.selectList(wrapper);

        QueryWrapper<EduVideo> wrapper1 = new QueryWrapper<>();
        wrapper1.eq("course_id",courseId);
        List<EduVideo> eduVideoList = eduVideoService.list(wrapper1);

        // 先添加chapter，再对每个video遍历，id符合，添加进chapter的vo的children中
        List<ChapterVo> finalList = new ArrayList<>();
        for (EduChapter eduChapter : eduChapterList) {
            // 封装chapter主干
            ChapterVo chapterVo = new ChapterVo();
            BeanUtils.copyProperties(eduChapter,chapterVo);
            finalList.add(chapterVo);

            List<VideoVo> videoVoList = new ArrayList<>();
            // 构造children
            for (EduVideo eduVideo : eduVideoList) {
                if (eduVideo.getChapterId().equals(eduChapter.getId())){
                    VideoVo videoVo = new VideoVo();
                    BeanUtils.copyProperties(eduVideo,videoVo);
                    videoVoList.add(videoVo);
                }
            }
            // 封装children
            chapterVo.setChildren(videoVoList);
        }
        return finalList;
    }

    @Override
    public boolean deleteChapter(String chapterId) {
        QueryWrapper<EduVideo> wrapper = new QueryWrapper<>();
        wrapper.eq("chapter_id",chapterId);
        if(eduVideoService.count(wrapper)==0){
            if(1==baseMapper.deleteById(chapterId)){
                return true;
            }
            throw new GuliException(20001,"删除失败！");
        }else{
            throw new GuliException(20001,"请先删除小节！");
        }
    }
}
