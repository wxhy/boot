/*
 *    Copyright (c) 2018-2025, lengleng All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the pig4cloud.com developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * Author: lengleng (wangiegie@gmail.com)
 */

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
