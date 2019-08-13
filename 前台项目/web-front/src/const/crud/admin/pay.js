

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
      label: '商品名称',
      prop: 'name',
      search: true
    }, {
      label: '商品编号',
      prop: 'productNo'
    }, {
      label: '支付编号',
      prop: 'payNo'
    }, {
      label: '支付金额',
      prop: 'money'
    }, {
      label: '商品描述',
      prop: 'remark'
    }, {
      width: 80,
      label: '状态',
      type:'select',
      dicUrl: '/admin/dict/item/type/pay_status',
      prop: 'status'
    }, {
      width: 150,
      label: '创建时间',
      prop: 'createTime',
      type: 'datetime',
      format: 'yyyy-MM-dd HH:mm',
      valueFormat: 'yyyy-MM-dd HH:mm:ss'
    }, {
      width: 150,
      label: '修改时间',
      prop: 'updateTime',
      type: 'datetime',
      format: 'yyyy-MM-dd HH:mm',
      valueFormat: 'yyyy-MM-dd HH:mm:ss'
    }]
  }
  