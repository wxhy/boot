
import request from '@/router/axios'

export function fetchList (query) {
    return request({
      url: '/pan/virtualaddress/page',
      method: 'get',
      params: query
    })
  }

export function addObj (obj) {
    return request({
      url: '/pan/virtualaddress/',
      method: 'post',
      data: obj
    })
  }