package com.example.eduservice.service;

import com.example.eduservice.entity.EduComment;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 评论 服务类
 * </p>
 *
 * @author June
 * @since 2021-07-18
 */
public interface EduCommentService extends IService<EduComment> {
    boolean addComment(EduComment eduComment, HttpServletRequest request);
}
