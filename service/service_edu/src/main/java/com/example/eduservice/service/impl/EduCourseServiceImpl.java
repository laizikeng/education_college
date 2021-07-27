package com.example.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.eduservice.client.VodClient;
import com.example.eduservice.entity.EduChapter;
import com.example.eduservice.entity.EduCourse;
import com.example.eduservice.entity.EduCourseDescription;
import com.example.eduservice.entity.EduVideo;
import com.example.eduservice.entity.frontvo.CourseFrontVo;
import com.example.eduservice.entity.frontvo.CourseWebVo;
import com.example.eduservice.entity.vo.CourseInfoVo;
import com.example.eduservice.entity.vo.CoursePublishVo;
import com.example.eduservice.mapper.EduCourseMapper;
import com.example.eduservice.service.EduChapterService;
import com.example.eduservice.service.EduCourseDescriptionService;
import com.example.eduservice.service.EduCourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.eduservice.service.EduVideoService;
import com.example.servicebase.exeception.GuliException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 课程 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-10
 */
@Service
public class EduCourseServiceImpl extends ServiceImpl<EduCourseMapper, EduCourse> implements EduCourseService {
    @Autowired
    private EduCourseDescriptionService eduCourseDescriptionService;

    // 根据id查询课程
    @Override
    public CourseInfoVo getCourseInfo(String courseId) {
        EduCourse course = baseMapper.selectById(courseId);
        CourseInfoVo vo = new CourseInfoVo();
        BeanUtils.copyProperties(course, vo);

        EduCourseDescription description = eduCourseDescriptionService.getById(courseId);
        BeanUtils.copyProperties(description, vo);
        return vo;
    }

    // 修改课程信息
    @Override
    public void updateCourseInfo(CourseInfoVo courseInfoVo) {
        EduCourse eduCourse = new EduCourse();
        BeanUtils.copyProperties(courseInfoVo, eduCourse);
        if (baseMapper.updateById(eduCourse) != 1) {
            throw new GuliException(20001, "修改课程信息失败！");
        }

        EduCourseDescription description = new EduCourseDescription();
        BeanUtils.copyProperties(courseInfoVo, description);
        if (!eduCourseDescriptionService.updateById(description)) {
            throw new GuliException(20001, "修改课程详情失败！");
        }
    }

    @Autowired
    private EduCourseMapper eduCourseMapper;

    @Override
    public CoursePublishVo getCoursePublishVo(String courseId) {
        return eduCourseMapper.getPublishCourseInfo(courseId);
    }

    @Autowired
    private EduChapterService eduChapterService;
    @Autowired
    private EduVideoService eduVideoService;
    @Autowired
    private VodClient vodClient;

    @Override
    public void deleteCourse(String courseId) {
        // 删除视频
        QueryWrapper<EduVideo> videoWrapper0 = new QueryWrapper<>();
        videoWrapper0.eq("course_id", courseId);
        videoWrapper0.select("video_source_id");
        List<EduVideo> eduVideoList = eduVideoService.list(videoWrapper0);
        List<String> list = new ArrayList<>();
        for (EduVideo eduVideo : eduVideoList) {
            if (eduVideo != null) list.add(eduVideo.getVideoSourceId());
        }
        if (list.size() > 0) {
            vodClient.deleteBatchVideo(list);
        }

        // 删除小节
        QueryWrapper<EduVideo> videoWrapper = new QueryWrapper<>();
        videoWrapper.eq("course_id", courseId);
        eduVideoService.remove(videoWrapper);

        // 删除章节
        QueryWrapper<EduChapter> chapterWrapper = new QueryWrapper<>();
        chapterWrapper.eq("course_id", courseId);
        eduChapterService.remove(chapterWrapper);

        // 删除描述
        eduCourseDescriptionService.removeById(courseId); // 二者 id 相同

        // 删除课程
        baseMapper.deleteById(courseId);

    }

    @Override
    public Map<String, Object> getCourseFrontList(Page<EduCourse> page, CourseFrontVo courseFrontVo) {
        QueryWrapper<EduCourse> wrapper = new QueryWrapper<>();
        if(!org.springframework.util.StringUtils.isEmpty(courseFrontVo.getSubjectParentId())) { //一级分类
            wrapper.eq("subject_parent_id",courseFrontVo.getSubjectParentId());
        }
        if(!org.springframework.util.StringUtils.isEmpty(courseFrontVo.getSubjectId())) { //二级分类
            wrapper.eq("subject_id",courseFrontVo.getSubjectId());
        }
        if(!org.springframework.util.StringUtils.isEmpty(courseFrontVo.getBuyCountSort())) { //关注度
            wrapper.orderByDesc("buy_count");
        }
        if (!org.springframework.util.StringUtils.isEmpty(courseFrontVo.getGmtCreateSort())) { //最新
            wrapper.orderByDesc("gmt_create");
        }

        if (!StringUtils.isEmpty(courseFrontVo.getPriceSort())) {//价格
            wrapper.orderByDesc("price");
        }

        baseMapper.selectPage(page,wrapper);

        List<EduCourse> records = page.getRecords();
        long current = page.getCurrent();
        long pages = page.getPages();
        long size = page.getSize();
        long total = page.getTotal();
        boolean hasNext = page.hasNext();//下一页
        boolean hasPrevious = page.hasPrevious();//上一页

        //把分页数据获取出来，放到map集合
        Map<String, Object> map = new HashMap<>();
        map.put("items", records);
        map.put("current", current);
        map.put("pages", pages);
        map.put("size", size);
        map.put("total", total);
        map.put("hasNext", hasNext);
        map.put("hasPrevious", hasPrevious);
        //map返回
        return map;
    }

    @Override
    public CourseWebVo getFrontCourseInfo(String courseId) {
        return baseMapper.getFrontCourseInfo(courseId);
    }


}
