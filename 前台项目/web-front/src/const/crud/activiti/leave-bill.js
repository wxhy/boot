

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
