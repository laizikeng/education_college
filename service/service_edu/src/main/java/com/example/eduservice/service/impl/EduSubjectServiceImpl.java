package com.example.eduservice.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.eduservice.entity.EduSubject;
import com.example.eduservice.entity.excel.SubjectData;
import com.example.eduservice.entity.subject.OneSubject;
import com.example.eduservice.entity.subject.TwoSubject;
import com.example.eduservice.listener.SubjectExcelListener;
import com.example.eduservice.mapper.EduSubjectMapper;
import com.example.eduservice.service.EduSubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.security.auth.Subject;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 课程科目 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-09
 */
@Service
public class EduSubjectServiceImpl extends ServiceImpl<EduSubjectMapper, EduSubject> implements EduSubjectService {

    @Override
    public void addSubject(MultipartFile file,EduSubjectService eduSubjectService) {
        try {
            EasyExcel.read(file.getInputStream(), SubjectData.class,new SubjectExcelListener(eduSubjectService))
                    .sheet().doRead();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OneSubject> getAllSubject() {
        QueryWrapper<EduSubject> wrapperOne = new QueryWrapper<>();
        wrapperOne.eq("parent_id",0);
        List<EduSubject> oneSubjectList = baseMapper.selectList(wrapperOne);

        List<OneSubject> finalSubjectList = new ArrayList<>();
        for (int i = 0; i < oneSubjectList.size(); i++) {
            EduSubject eduSubject = oneSubjectList.get(i);
            OneSubject oneSubject = new OneSubject();
            BeanUtils.copyProperties(eduSubject,oneSubject);

            finalSubjectList.add(oneSubject);
        }

        QueryWrapper<EduSubject> wrapperTwo = new QueryWrapper<>();
        wrapperTwo.ne("parent_id",0);
        List<EduSubject> twoSubjectList = baseMapper.selectList(wrapperTwo);

        for (int i = 0; i < twoSubjectList.size(); i++) {
            EduSubject twoSubject = twoSubjectList.get(i);
            for (int j = 0; j < finalSubjectList.size(); j++) {
                if (twoSubject.getParentId().equals(finalSubjectList.get(j).getId())){
                    TwoSubject two = new TwoSubject();
                    BeanUtils.copyProperties(twoSubject,two);
                    finalSubjectList.get(j).getChildren().add(two);
                }
            }
        }

        return finalSubjectList;
    }
}
