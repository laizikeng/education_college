import request from '@/utils/request'

export default {
  getTeacherInfo(teacherId) {
  return request({
    url:`/eduservice/teacherfront/getTeacherFrontInfo/${teacherId}`,
    method:'get',
  })
  },
  getTeacherList(current, limit) {
    return request({
      url: `/eduservice/teacherfront/getTeacherFrontList/${current}/${limit}`,
      method: 'post'
    })
  },
}
