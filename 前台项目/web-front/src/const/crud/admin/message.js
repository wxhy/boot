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
  SENDER: [{
    label: '是',
    value: "0"
  }, {
    label: '否',
    value: "1"
  }],
  RANGER: [{
    label: '全体用户',
    value: 0
  }, {
    label: '指定用户成员',
    value: 1
  }]
}
export const tableOption = {
  border: true,
  index: true,
  indexLabel: '序号',
  menuAlign: 'center',
  align: 'center',
  refreshBtn: true,
  showClomnuBtn: false,
  searchSize: 'mini',
  addBtn: false,
  editBtn: false,
  delBtn: false,
  column: [{
    fixed: true,
    label: 'id',
    prop: 'messageId',
    span: 24,
    hide: true,
    editDisabled: true,
    addVisdiplay: false
  }, {
    label: '标题',
    prop: 'title'
  }, {
    label: '内容',
    slot:true,
    prop: 'content'
  }, {
    label: '类型',
    prop: 'type',
    dicUrl: '/admin/dict/item/type/message_type',
  }, {
    label: '新创建账号推送',
    prop: 'createSend',
    dicData: DIC.SENDER
  }, {
    label: '创建时间',
    prop: 'createTime',
    format: 'yyyy-MM-dd HH:mm',
    valueFormat: 'yyyy-MM-dd HH:mm:ss'
  }]
}


export const formOption = {
  row: true,
  span: 12,
  column: [
    {
      label: '消息类型',
      prop: 'type',
      dicUrl: '/admin/dict/item/type/message_type',
      type: 'select'
    },
    {
      label: '标题',
      span: 24,
      prop: 'title',
      rules: [{
        required: true,
        message: "请输入标题",
        trigger: "blur"
      }]
    },
    {
      label: '内容',
      prop: 'content',
      span: 24,
      component: 'editor',
      dataType: 'string'
    },
    {
      label: '新创建账号也推送',
      prop: 'createSend',
      type: 'radio',
      dicData: DIC.SENDER,
      valueDefault: "1"
    },
    {
      label: '发送范围',
      prop: 'ranger',
      dicData: DIC.RANGER,
      span: 24,
      type: 'radio',
      valueDefault: 0
    },
    {
      label: '',
      prop: 'userIds',
      component: 'userSelect',
      formslot: true,
      showClomnu: false,
      span: 24,

    }
  ]
}



export const updateOption = {
  row: true,
  span: 12,
  column: [
    {
      label: '消息类型',
      prop: 'type',
      dicUrl: '/admin/dict/item/type/message_type',
      type: 'select'
    },
    {
      label: '标题',
      span: 24,
      prop: 'title',
      rules: [{
        required: true,
        message: "请输入标题",
        trigger: "blur"
      }]
    },
    {
      label: '内容',
      prop: 'content',
      span: 24,
      component: 'editor',
      dataType: 'string'
    },
    {
      label: '新创建账号也推送',
      prop: 'createSend',
      type: 'radio',
      dicData: DIC.SENDER,
      valueDefault: 1
    }
  ]
}
