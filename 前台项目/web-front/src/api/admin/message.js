import request from '@/router/axios'

export function fetchList (query) {
  return request({
    url: '/admin/message/page',
    method: 'get',
    params: query
  })
}