

export const tableOption = {
  border: true,
  index: true,
  indexLabel: '序号',
  menuAlign: 'center',
  align: 'center',
  refreshBtn: true,
  showClomnuBtn: false,
  searchSize: 'mini',
  editBtn: false,
  delBtn: false,
  dialogHeight: 300,
  column: [{
    label: '类型',
    prop: 'type',
    'search': true,
    rules: [{
      required: true,
      message: '请输入字典类型',
      trigger: 'blur'
    }]
  }, {
    label: '描述',
    prop: 'description',
    rules: [{
      required: true,
      message: '请输入字典描述',
      trigger: 'blur'
    }]
  }, {
    label: '备注信息',
    prop: 'remarks'
  }, {
    width: 150,
    label: '创建时间',
    editDisabled: true,
    prop: 'createTime',
    type: 'datetime',
    format: 'yyyy-MM-dd HH:mm',
    valueFormat: 'yyyy-MM-dd HH:mm:ss'
  }, {
    width: 150,
    label: '修改时间',
    prop: 'updateTime',
    editDisplay: false,
    type: 'datetime',
    format: 'yyyy-MM-dd HH:mm',
    valueFormat: 'yyyy-MM-dd HH:mm:ss'
  }]
}



export const dictItemOption = {
  border: true,
  index: true,
  indexLabel: '序号',
  menuAlign: 'center',
  align: 'center',
  refreshBtn: true,
  showClomnuBtn: false,
  searchSize: 'mini',
  editBtn: false,
  dialogHeight:300,
  delBtn: false,
  column: [
    {
      label: '类型',
      prop: 'type',
      formslot:true,
      disabled: true,
    }, {
      width: 150,
      label: '数据值',
      prop: 'value',
      rules: [{
        required: true,
        message: '请输入数据值',
        trigger: 'blur'
      }]
    }, {
      label: '标签名',
      prop: 'label',
      rules: [{
        required: true,
        message: '请输入标签名',
        trigger: 'blur'
      }]
    }, {
      label: '描述',
      prop: 'description',
      rules: [{
        required: true,
        message: '请输入字典描述',
        trigger: 'blur'
      }]
    }, {
      label: '排序',
      prop: 'sort',
      type: 'number',
      rules: [{
        required: true,
        message: '请输入排序',
        trigger: 'blur'
      }]
    }]
}
