import request from '@/utils/request'
export default {
  getCommentList(current,limit,courseId) {
    return request({
      url: `/eduservice/edu-comment/pageComment/${current}/${limit}/${courseId}`,
      method: 'post',
    })
  },
  addComment(commentVo){
    return request({
      url: `/eduservice/edu-comment/addComment`,
      method: 'post',
      data:commentVo,
    })
  }
}
