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
  leaveStatus: [{
    label: '未提交',
    value: "0"
  },
  {
    label: '审核中',
    value: "1"
  },
  {
    label: '已完成',
    value: "2"
  },
  {
    label: '驳回',
    value: "9"
  }
  ]
}
export const tableOption = {
  border: true,
  index: true,
  stripe: true,
  menuAlign: 'center',
  align: 'center',
  menuBtn: true,
  editBtn: false,
  delBtn: false,
  addBtn: false,
  menuType: 'menu',
  dicUrl: '/admin/dict/item/type/leave_status',
  column: [
    {
      label: 'ID',
      prop: 'leaveId',
      editDisabled: true,
      addVisdiplay: false
    },
    {
      label: '申请人',
      prop: 'username',
      editDisabled: true,
      addVisdiplay: false
    },
    {
      label: '天数',
      prop: 'days',
      type: 'number'
    },
    {
      label: '开始时间',
      prop: 'leaveStartTime',
      type: 'datetime',
      overHidden: true,
      format: 'yyyy-MM-dd HH:mm',
      valueFormat: 'yyyy-MM-dd hh:mm:ss'
    },
    {
      label: '结束时间',
      prop: 'leaveEndTime',
      type: 'datetime',
      overHidden: true,
      format: 'yyyy-MM-dd HH:mm',
      valueFormat: 'yyyy-MM-dd hh:mm:ss'
    },
    {
      label: '提交时间',
      prop: 'createTime',
      type: 'datetime',
      overHidden: true,
      format: 'yyyy-MM-dd HH:mm',
      editDisabled: true,
      addVisdiplay: false,
      hide: true
    },
    {
      label: '状态',
      prop: 'state',
      type: 'select',
      dicData: DIC.leaveStatus,
      search: true,
      addVisdiplay: false
    },
    {
      label: '备注',
      prop: 'content',
      type: 'textarea',
      overHidden: true,
      minRows: 2,
      row: true,
      span: 24
    }
  ]
}
