import request from '@/router/axios'

export function fetchList (query) {
    return request({
      url: '/admin/oss/page',
      method: 'get',
      params: query
    })
  }
  
  export function addObj(obj) {
    return request({
      url:'/admin/oss',
      method:'post',
      data: obj
    });
  }
  
  export function getObj (id) {
    return request({
      url: '/admin/oss/' + id,
      method: 'get'
    })
  }
  
  export function delObj(id){
    return request({
      url:'/admin/oss/' + id,
      method:'delete'
    })
  }
  
  export function putObj (obj) {
    return request({
      url: '/admin/oss',
      method: 'put',
      data:obj
    })
  }


  export function delBatchObj(params) {
    return request({
      url: '/admin/oss/removeBatch/' + params,
      method: 'delete'
    })
  }