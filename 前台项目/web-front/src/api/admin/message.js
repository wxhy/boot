import request from '@/router/axios'

export function fetchList (query) {
  return request({
    url: '/admin/message/page',
    method: 'get',
    params: query
  })
}

export function addObj(obj) {
  return request({
    url:'/admin/message',
    method:'post',
    data: obj
  });
}

export function getObj (id) {
  return request({
    url: '/admin/message/' + id,
    method: 'get'
  })
}

export function delObj(id){
  return request({
    url:'/admin/message/' + id,
    method:'delete'
  })
}

export function putObj (obj) {
  return request({
    url: '/admin/message',
    method: 'put',
    data:obj
  })
}


export function fetchMessageList (query) {
  return request({
    url: '/admin/messageSend/page',
    method: 'get',
    params: query
  })
}