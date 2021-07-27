import axios from 'axios'
import cookie from 'js-cookie'
import {Message} from "element-ui";
// 创建axios实例
const service = axios.create({
    baseURL: 'http://localhost:8000', // api的base_url
    timeout: 20000 // 请求超时时间
})
// 拦截器:对于每一个请求，如果guli_token（cookie）存在，则会在请求头添加对应的value
// cookie并不能作为request中的值！
service.interceptors.request.use(
    config => {
        if (cookie.get('guli_token')) {
            config.headers['token'] = cookie.get('guli_token');
        }
        return config
    },
    err => {
        return Promise.reject(err);
    })

export default service
