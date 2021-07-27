package com.example.eduservice.controller.front;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ResultEntity;
import com.example.common_vo.CourseWebVoOrder;
import com.example.eduservice.client.OrderClient;
import com.example.eduservice.entity.EduCourse;
import com.example.eduservice.entity.frontvo.CourseFrontVo;
import com.example.eduservice.entity.frontvo.CourseWebVo;
import com.example.eduservice.entity.vo.CourseInfoVo;
import com.example.eduservice.entity.vo.chapter.ChapterVo;
import com.example.eduservice.service.EduChapterService;
import com.example.eduservice.service.EduCourseService;
import com.example.utils.JwtUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/eduservice/coursefront")
public class CourseFrontController {
    @Autowired
    private EduCourseService eduCourseService;

    @PostMapping("getFrontCourseList/{current}/{limit}")
    public ResultEntity getFrontCourseList(@PathVariable long current, @PathVariable long limit,
                                           @RequestBody(required = false)CourseFrontVo courseFrontVo){
        Page<EduCourse> page = new Page<>(current,limit);
        Map<String,Object> map = eduCourseService.getCourseFrontList(page,courseFrontVo);

        return ResultEntity.ok().data(map);
    }

    @Autowired
    private OrderClient orderClient;
    @Autowired
    private EduChapterService chapterService;
    @GetMapping("getFrontCourseInfo/{courseId}")
    public ResultEntity getFrontCourseInfo(@PathVariable String courseId, HttpServletRequest request){
        // 根据课程id，编写sql语句查询课程信息
        CourseWebVo courseWebVo = eduCourseService.getFrontCourseInfo(courseId);
        // 根据课程id查询章节和小节
        List<ChapterVo> chapterVideoList = chapterService.getChapterVideoByCourseId(courseId);
        // 查询课程是否购买
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        boolean isBuy = orderClient.isBuy(courseId,memberId);

        return ResultEntity.ok().data("courseWebVo",courseWebVo).data("chapterVideoList",chapterVideoList).data("isBuy",isBuy);
    }

    // 根据课程id获取课程信息
    @PostMapping("getCourseInfoOrder/{courseId}")
    public CourseWebVoOrder getCourseInfoOrder(@PathVariable String courseId){
        CourseInfoVo courseInfo = eduCourseService.getCourseInfo(courseId);
        CourseWebVoOrder courseWebVoOrder = new CourseWebVoOrder();
        BeanUtils.copyProperties(courseInfo,courseWebVoOrder);
        return courseWebVoOrder;
    }

}
