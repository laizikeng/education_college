package com.example.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.ResultEntity;
import com.example.eduservice.entity.EduTeacher;
import com.example.eduservice.entity.vo.TeacherQuery;
import com.example.eduservice.service.EduTeacherService;
import com.example.servicebase.exeception.GuliException;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * 讲师 前端控制器
 *
 * @author June
 * @since 2021-06-28
 */
@Slf4j
@RestController
@RequestMapping("/eduservice/edu-teacher")
public class EduTeacherController {

    @Autowired
    private EduTeacherService eduTeacherService;

    @GetMapping("findAll")
    public ResultEntity findAllTeacher() {
        return ResultEntity.ok().data("items", eduTeacherService.list(null));
    }

    @ApiOperation("逻辑删除讲师") //swagger 描述
    @DeleteMapping("{id}")
    public ResultEntity removeTeacher(@ApiParam(name = "id", value = "讲师ID", required = true) @PathVariable("id") String id) {

        return eduTeacherService.removeById(id) ? ResultEntity.ok() : ResultEntity.error();
    }

    @ApiOperation("MyBatisPlus 实现分页（无条件）")
    @GetMapping("pageTeacher/{current}/{limit}")
    public ResultEntity pageListTeacher(@PathVariable("current") long current,
                                        @PathVariable("limit") long limit) {

        Page<EduTeacher> page = new Page<>(current, limit);
        eduTeacherService.page(page, null);

        return ResultEntity.ok().data("total", page.getTotal()).data("list", page.getRecords());
    }

    @ApiOperation("MyBatisPlus 实现分页（带条件）")
    @PostMapping("pageTeacherConditional/{current}/{limit}")
    public ResultEntity pageListTeacherConditional(@PathVariable("current") long current,
                                                   @PathVariable("limit") long limit,
                                                   @RequestBody(required = false) TeacherQuery conditions) {

        Page<EduTeacher> page = new Page<>(current, limit);

        // 条件集
        QueryWrapper<EduTeacher> wrapper = new QueryWrapper<>();
        if(conditions!=null){
            String name = conditions.getName();
            Integer level = conditions.getLevel();
            String begin = conditions.getBegin();
            String end = conditions.getEnd();

            if (!StringUtils.isEmpty(conditions.getName())) {
                wrapper.like("name", name);
            }
            if (!StringUtils.isEmpty(level)) {
                wrapper.eq("level", level);
            }
            if (!StringUtils.isEmpty(begin)) {
                wrapper.ge("gmt_create", begin);
            }
            if (!StringUtils.isEmpty(end)) {
                wrapper.le("gmt_create", end);
            }
        }

        eduTeacherService.page(page, wrapper);

        return ResultEntity.ok().data("total", page.getTotal()).data("list", page.getRecords());
    }

    @ApiOperation("增加 讲师")
    @PostMapping("addTeacher")
    public ResultEntity addTeacher(@RequestBody EduTeacher eduTeacher) {
        return eduTeacherService.save(eduTeacher) ? ResultEntity.ok() : ResultEntity.error();
    }


    @ApiOperation("根据 讲师 id 查询 讲师")
    @GetMapping("getTeacherById/{id}")
    public ResultEntity getTeacherById(@PathVariable String id){
        EduTeacher teacher = eduTeacherService.getById(id);

        return ResultEntity.ok().data("teacher",teacher);
    }

    @ApiOperation("根据 讲师 id 修改讲师信息")
    @PostMapping("updateTeacher")
    public ResultEntity updateTeacher(@RequestBody EduTeacher eduTeacher){
        return eduTeacherService.updateById(eduTeacher)?ResultEntity.ok():ResultEntity.error();
    }

    @ApiOperation("根据 id 删除讲师")
    @GetMapping("deleteTeacher/{id}")
    public ResultEntity deleteTeacherById(@PathVariable String id){
        return eduTeacherService.removeById(id)?ResultEntity.ok():ResultEntity.error();
    }

}

