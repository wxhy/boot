import request from '@/router/axios'

export function fetchList (query) {
  return request({
    url: '/quartz/job/page',
    method: 'get',
    params: query
  })
}

export function addObj (obj) {
  return request({
    url: '/quartz/job',
    method: 'post',
    data: obj
  })
}

export function getObj (id) {
  return request({
    url: '/quartz/job/' + id,
    method: 'get'
  })
}

export function delObj (id) {
  return request({
    url: '/quartz/job/' + id,
    method: 'delete'
  })
}

export function putObj (obj) {
  return request({
    url: '/quartz/job',
    method: 'put',
    data: obj
  })
}