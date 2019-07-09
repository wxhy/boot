import request from '@/router/axios'

export function fetchList (query) {
    return request({
        url: '/generator/virtualaddress/page',
        method: 'get',
        params: query
    })
}

export function addObj (obj) {
    return request({
        url: '/generator/virtualaddress/',
        method: 'post',
        data: obj
    })
}

export function getObj (id) {
    return request({
        url: '/generator/virtualaddress/' + id,
        method: 'get'
    })
}

export function delObj (row) {
    return request({
        url: '/generator/virtualaddress/' + row.id,
        method: 'delete'
    })
}

export function putObj (obj) {
    return request({
        url: '/generator/virtualaddress/',
        method: 'put',
        data: obj
    })
}

