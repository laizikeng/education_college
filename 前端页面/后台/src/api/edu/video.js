import request from '@/utils/request'

export default {
  addVideo(video) {
    return request({
        url: '/eduservice/edu-video/addVideo',
        method: 'post',
        data: video
      }
    )
  },
  deleteVideo(videoId){
    return request({
        url: '/eduservice/edu-video/deleteVideo/'+videoId,
        method: 'delete',
      }
    )
  },
  getVideoInfo(videoId){
    return request({
        url: '/eduservice/edu-video/getVideoInfo/'+videoId,
        method: 'get',
      }
    )
  },
  updateVideo(video){
    return request({
        url: '/eduservice/edu-video/updateVideo',
        method: 'post',
        data: video
      }
    )
  },
  deleteCourseVideoById(videoSourceId){
    return request({
      url: `/eduservice/edu-video/deleteVideoFile/${videoSourceId}`,
      method:"delete"
    })
  },
  getVideoSourceIdById(videoId){
    return request({
      url: `/eduvod/getVideoSourceId/${videoId}`,
      method: 'get'
    })
  }

}
