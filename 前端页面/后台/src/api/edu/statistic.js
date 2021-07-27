import request from '@/utils/request'

export default {
  // 生成统计数据
  createStatistics(day) {
    return request({
        url: `/statistics-daily/registerCount/${day}`,
        method: 'post',
      }
    )
  },

  // 获取统计数据
  getDataStatistics(searchObj){
    return request({
      url:`/statistics-daily/getData/${searchObj.type}/${searchObj.begin}/${searchObj.end}`,
      method:'get'
    })
  }

}
