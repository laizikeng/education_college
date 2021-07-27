import request from '@/utils/request'

export default {
  getChapterVideoList(courseId) {
    return request({
        url: '/eduservice/edu-chapter/getChapterVideo/' + courseId,
        method: 'get'
      }
    )
  },
  addChapter(chapter) {
    return request({
        url: '/eduservice/edu-chapter/addChapter',
        method: 'post',
        data: chapter
      }
    )
  },
  deleteChapter(chapterId){
    return request({
        url: '/eduservice/edu-chapter/deleteChapter/'+chapterId,
        method: 'delete',
      }
    )
  },
  getChapterInfo(chapterId){
    return request({
        url: '/eduservice/edu-chapter/getChapterInfo/'+chapterId,
        method: 'get',
      }
    )
  },
  updateChapter(chapter){
    return request({
        url: '/eduservice/edu-chapter/updateChapter',
        method: 'post',
        data: chapter
      }
    )
  },

}
