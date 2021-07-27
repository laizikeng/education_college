package com.example.eduservice.service.impl;

import com.example.common_vo.UcenterMemberComment;
import com.example.eduservice.client.UcenterClient;
import com.example.eduservice.entity.EduComment;
import com.example.eduservice.mapper.EduCommentMapper;
import com.example.eduservice.service.EduCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.utils.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 评论 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-18
 */
@Service
public class EduCommentServiceImpl extends ServiceImpl<EduCommentMapper, EduComment> implements EduCommentService {
    @Autowired
    private UcenterClient ucenterClient;
    @Override
    public boolean addComment(EduComment eduComment, HttpServletRequest request) {
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        UcenterMemberComment userInfo = ucenterClient.getUserInfoComment(memberId);
        if(userInfo!=null){
            eduComment.setNickname(userInfo.getNickname());
            eduComment.setAvatar(userInfo.getAvatar());
            eduComment.setMemberId(userInfo.getId());

            baseMapper.insert(eduComment);
            return true;
        }else{
            return false;
        }


    }
}
