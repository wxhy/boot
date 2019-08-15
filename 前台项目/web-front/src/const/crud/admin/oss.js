
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
  labelWidth:150,
  addBtn: false,
  editBtn: false,
  delBtn: true,
  viewBtn: true,
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
  }, {
    label: '缩略图(点击预览)',
    type: 'upload',
    imgWidth: 100,
    imgFullscreen: true,
    editDisplay: false,
    addDisplay: false,
    listType: 'picture-img',
    prop: 'url'
  }]
}
