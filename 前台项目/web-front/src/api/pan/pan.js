
import request from '@/router/axios'

export function fetchList(query) {
  return request({
    url: '/pan/virtualaddress/page',
    method: 'get',
    params: query
  })
}

export function addObj(obj) {
  return request({
    url: '/pan/virtualaddress/',
    method: 'post',
    data: obj
  })
}


export function delObj(id) {
  return request({
    url: '/pan/virtualaddress/' + id,
    method: 'delete'
  })
}

export function renameFile(id, fileName) {
  return request({
    url: '/pan/virtualaddress/' + id,
    method: 'put',
    params: {
      fileName
    }
  })
}

export function copyObj(id, parentId) {
  return request({
    url: '/pan/virtualaddress/copy/' + id + "/" + parentId,
    method: 'put'
  })
}

export function moveObj(id, parentId) {
  return request({
    url: '/pan/virtualaddress/move/' + id + "/" + parentId,
    method: 'put'
  })
}

export function fetchSubfolder(parentId) {
  return request({
    url: '/pan/virtualaddress/subFolder/' + parentId,
    method: 'get'
  })
}

export function merge(md5, parentId,name) {
  return request({
    url: '/pan/virtualaddress/merge/' + md5 + '/' + parentId +'/' +name,
    method: 'get'
  })
}

export function downloadResource(id) {
  return request({
    url: '/pan/virtualaddress/download/' + id,
    method: 'get'
  })
}