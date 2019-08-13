import request from '@/router/axios'

export function fetchList(query) {
  return request({
    url: '/pay/pay/page',
    method: 'get',
    params: query
  })
}


export function addObj(object) {
  return request({
    url: '/pay/pay/payTrage',
    method: 'post',
    data: object
  })
}


export function notify(params) {
  return request({
    url: 'pay/pay/notify',
    method: 'get',
    params: params
  })
}


