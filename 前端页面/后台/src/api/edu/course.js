import request from '@/utils/request'

export default {
  // 添加课程
  addCourseInfo(courseInfo) {
    return request({
        url: '/eduservice/edu-course/addCourseInfo',
        method: 'post',
        data: courseInfo
      }
    )
  },
  // 查询所有讲师
  getListTeacher() {
    return request({
        url: '/eduservice/edu-teacher/findAll',
        method: 'get'
      }
    )
  },
  // 根据id查询课程基本信息
  getCourseInfo(id) {
    return request({
        url: `/eduservice/edu-course/getCourseInfo/${id}`,
        method: 'get'
      }
    )
  },
  // 修改课程信息
  updateCourseInfo(courseInfo) {
    return request({
        url: `/eduservice/edu-course/updateCourseInfo`,
        method: 'post',
        data: courseInfo
      }
    )
  },
  getPublishCourseInfo(courseId) {
    return request({
        url: `/eduservice/edu-course/getPublishCourseInfo/` + courseId,
        method: 'get'
      }
    )
  },
  publishCourse(courseId) {
    return request({
      url: `/eduservice/edu-course/publish/` + courseId,
      method: 'post'
    })
  },
  getAllCourseWithoutCondition(){
    return request({
      url: `/eduservice/edu-course/getAllCourse/`,
      method: 'get'
    })
  },
  getPageCourse(conditions,current,limit){
    return request({
      url: `/eduservice/edu-course/pageCourse/${limit}/${current}`,
      method: 'post',
      data:conditions,
    })
  },
  deleteCourseById(courseId){
    return request({
      url: `/eduservice/edu-course/deleteCourse/${courseId}`,
      method:"delete"
    })
  },

}
