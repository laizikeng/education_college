import request from '@/utils/request'
export default {
  // 生成订单
  createOrder(courseId) {
    return request({
      url: `/eduorder/order/generateOrder/${courseId}`,
      method: 'post',
    })
  },
  // 根据订单id查询订单信息
  getOrderInfo(orderId) {
    return request({
      url: `/eduorder/order/getOrderInfo/${orderId}`,
      method: 'post',
    })
  },

  // 生成支付二维码
  createOrderQR(orderNo){
    return request({
      url: `/eduorder/pay-log/createOrderQR/${orderNo}`,
      method: 'post',
    })

  },

  // 查询订单状态
  getOrderStatus(orderNo){
    return request({
      url:`/eduorder/pay-log/getOrderStatus/${orderNo}`,
      methods:'get',
    })
  },
}
