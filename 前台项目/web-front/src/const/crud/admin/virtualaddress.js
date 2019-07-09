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
                label: '主键ID',
                prop: 'id'
            },
                    {
                label: '文件ID',
                prop: 'fileId'
            },
                    {
                label: '上传文件名',
                prop: 'fileName'
            },
                    {
                label: 'MD5',
                prop: 'md5'
            },
                    {
                label: '父路径',
                prop: 'parentPath'
            },
                    {
                label: '是否是文件夹',
                prop: 'isDir'
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
                label: '状态',
                prop: 'status'
            },
            ]
}
