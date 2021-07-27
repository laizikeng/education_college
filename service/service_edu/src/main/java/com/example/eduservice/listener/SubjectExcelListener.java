package com.example.eduservice.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.eduservice.entity.EduSubject;
import com.example.eduservice.entity.excel.SubjectData;
import com.example.eduservice.service.EduSubjectService;
import com.example.servicebase.exeception.GuliException;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 *  SubjectExcelListener 不能交给 Spring 管理，需要自己new，不能注入其他对象
 *  所以 subject需要靠controller传参
 */
@NoArgsConstructor
@AllArgsConstructor
public class SubjectExcelListener extends AnalysisEventListener<SubjectData> {

   public EduSubjectService subjectService;

    @Override
    public void invoke(SubjectData subjectData, AnalysisContext analysisContext) {
        if(subjectData == null){
            throw new GuliException(20001,"文件数据为空");
        }
        // 逐行读取
        // 一、二级分类不能重复添加
        EduSubject existOneSubject = this.existOneSubject(subjectService, subjectData.getOneSubjectName());
        if(existOneSubject == null){
            // 没有一级分类，做数据库添加操作
            existOneSubject = new EduSubject();
            existOneSubject.setParentId("0");
            existOneSubject.setTitle(subjectData.getOneSubjectName());
            subjectService.save(existOneSubject); //注意保存操作后existOneSubject会更新id！
        }
        // 二级分类的父id就是existOneSubject的id
        String pid = existOneSubject.getId();
        EduSubject existTwoSubject = this.existTwoSubject(subjectService,subjectData.getTwoSubjectName(),pid);
        if(existTwoSubject == null){
            // 没有二级分类，做数据库添加操作
            existTwoSubject = new EduSubject();
            existTwoSubject.setParentId(pid);
            existTwoSubject.setTitle(subjectData.getTwoSubjectName());
            subjectService.save(existTwoSubject);
        }
    }
    private EduSubject existOneSubject(EduSubjectService subjectService,String name){
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title",name);
        wrapper.eq("parent_id","0");
        EduSubject oneSubject = subjectService.getOne(wrapper);  // ← 留意这个方法
        return  oneSubject;
    }
    private EduSubject existTwoSubject(EduSubjectService subjectService,String name,String pid){
        QueryWrapper<EduSubject> wrapper = new QueryWrapper<>();
        wrapper.eq("title",name);
        wrapper.eq("parent_id",pid);
        EduSubject twoSubject = subjectService.getOne(wrapper);
        return  twoSubject;
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
