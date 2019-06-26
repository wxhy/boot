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

const DIC = {
    logType: [{
      label: '操作日志',
      value: "1"
    },
    {
      label: '登录日志',
      value: "0"
    }
    ]
  }
  export const tableOption = {
    border: true,
    index: true,
    indexLabel: '序号',
    stripe: true,
    menuAlign: 'center',
    menuWidth: 150,
    align: 'center',
    refreshBtn: true,
    showClomnuBtn: false,
    searchSize: 'mini',
    addBtn: false,
    editBtn: false,
    delBtn: false,
    viewBtn: true,
    props: {
      label: 'label',
      value: 'value'
    },
    column: [{
      label: '昵称',
      prop: 'nickname',
      search: true
    }, {
      label: '支付方式',
      prop: 'title'
    }, {
      label: '支付金额',
      prop: 'money'
    }, {
      label: '留言',
      prop: 'remark'
    }, {
      label: '邮箱地址',
      prop: 'email'
    }, {
      width: 80,
      label: '状态',
      prop: 'status'
    }, {
      width: 150,
      label: '创建时间',
      prop: 'createTime',
      type: 'datetime',
      format: 'yyyy-MM-dd HH:mm',
      valueFormat: 'yyyy-MM-dd HH:mm:ss'
    }]
  }
  