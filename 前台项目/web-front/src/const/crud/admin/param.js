const DIC = {
    status: [{
        label: '正常',
        value: "0"
    },
    {
        label: '冻结',
        value: "1"
    }
    ]
}


export const tableOption = {
    border: true,
    index: true,
    indexLabel: '序号',
    stripe: true,
    menuAlign: 'center',
    align: 'center',
    labelWidth:150,
    editBtn: false,
    delBtn: false,
    addBtn: false,
    column: [
        {
            label: '公共参数名称',
            prop: 'publicName'
        },
        {
            label: '键',
            prop: 'publicKey'
        },
        {
            label: '值',
            prop: 'publicValue'
        },
        {
            label: '状态',
            prop: 'status',
            type: 'select',
            dicData: DIC.status,
        },
        {
            label: '创建时间',
            addDisplay: false,
            editDisplay: false,
            prop: 'createTime'
        },
        {
            label: '修改时间',
            addDisplay: false,
            editDisplay: false,
            prop: 'updateTime'
        }

    ]
}
