import request from '@/router/axios'

export function fetchItemList(query) {
  return request({
    url: '/admin/dict/item/page',
    method: 'get',
    params: query
  })
}

export function addItem(obj) {
  return request({
    url: '/admin/dict/item/',
    method: 'post',
    data: obj
  })
}

export function getItem(id) {
  return request({
    url: '/admin/dict/item/' + id,
    method: 'get'
  })
}

export function delItem(row) {
  return request({
    url: '/admin/dict/item/' + row.id + '/' + row.type,
    method: 'delete'
  })
}

export function putItem(obj) {
  return request({
    url: '/admin/dict/item/',
    method: 'put',
    data: obj
  })
}

export function remote(type) {
  return request({
    url: '/admin/dict/item/type/' + type,
    method: 'get'
  })
}
