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
import { formatBytes } from "@/util/util";
export const tableOption = {
  border: true,
  index: true,
  indexLabel: '序号',
  menuAlign: 'center',
  menuWidth: 150,
  align: 'center',
  refreshBtn: true,
  showClomnuBtn: true,
  searchSize: 'mini',
  selection: true,
  addBtn: false,
  editBtn: false,
  delBtn: false,
  viewBtn: false,
  props: {
    label: 'label',
    value: 'value'
  },
  column: [{
    label: '原文件名',
    prop: 'name',
    search: true
  }, {
    label: '存储文件名',
    prop: 'fkey',
    search: true
  }, {
    label: '缩略图(点击预览)',
    slot: true,
    prop: 'url'
  }, {
    label: '文件类型',
    prop: 'type'
  }, {
    label: '文件大小',
    prop: 'fileSize',
    formatter: (row, value, label, column) => {
      return formatBytes(value);
    }
  }, {
    label: '创建人',
    prop: 'crateBy'
  }, {
    width: 150,
    label: '创建时间',
    prop: 'createTime',
    type: 'datetime',
    format: 'yyyy-MM-dd HH:mm',
    valueFormat: 'yyyy-MM-dd HH:mm:ss'
  }]
}
