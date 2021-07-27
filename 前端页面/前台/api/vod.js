import request from '@/utils/request'
export default {
  getPlayAuth(vid) {
    return request({
      url: `/eduvod/getPlayAuth/${vid}`,
      method: 'get',
    })
  },
}
