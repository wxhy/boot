export const tableOption = {
    border: true,
    index: true,
    indexLabel: '序号',
    stripe: true,
    menuAlign: 'center',
    align: 'center',
    editBtn: false,
    delBtn: false,
    addBtn: false,
    column: [
            {
            label: '编号',
            prop: 'publicId'
        },
            {
            label: '公共参数名称',
            prop: 'publicName'
        },
            {
            label: '键,英文大写+下划线',
            prop: 'publicKey'
        },
            {
            label: '值',
            prop: 'publicValue'
        },
            {
            label: '状态：1有效；2无效；',
            prop: 'status'
        },
            {
            label: '创建时间',
            prop: 'createTime'
        },
            {
            label: '修改时间',
            prop: 'updateTime'
        },
            {
            label: '删除状态：0-正常；1-已删除',
            prop: 'delFlag'
        },
        ]
}
