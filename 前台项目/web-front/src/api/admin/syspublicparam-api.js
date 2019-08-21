import request from '@/router/axios'

export function fetchList (query) {
    return request({
        url: '/upms/syspublicparam/page',
        method: 'get',
        params: query
    })
}

export function addObj (obj) {
    return request({
        url: '/upms/syspublicparam/',
        method: 'post',
        data: obj
    })
}

export function getObj (id) {
    return request({
        url: '/upms/syspublicparam/' + id,
        method: 'get'
    })
}

export function delObj (row) {
    return request({
        url: '/upms/syspublicparam/' + row.id,
        method: 'delete'
    })
}

export function putObj (obj) {
    return request({
        url: '/upms/syspublicparam/',
        method: 'put',
        data: obj
    })
}

