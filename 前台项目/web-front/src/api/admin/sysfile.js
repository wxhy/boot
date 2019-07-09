import request from '@/router/axios'

export function fetchList (query) {
    return request({
        url: '/generator/sysfile/page',
        method: 'get',
        params: query
    })
}

export function addObj (obj) {
    return request({
        url: '/generator/sysfile/',
        method: 'post',
        data: obj
    })
}

export function getObj (id) {
    return request({
        url: '/generator/sysfile/' + id,
        method: 'get'
    })
}

export function delObj (row) {
    return request({
        url: '/generator/sysfile/' + row.id,
        method: 'delete'
    })
}

export function putObj (obj) {
    return request({
        url: '/generator/sysfile/',
        method: 'put',
        data: obj
    })
}

