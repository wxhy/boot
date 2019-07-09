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
                prop: 'fileId'
            },
                    {
                label: '文件名称',
                prop: 'fileName'
            },
                    {
                label: '文件大小',
                prop: 'fileSize'
            },
                    {
                label: '文件类型',
                prop: 'fileType'
            },
                    {
                label: '文件路径',
                prop: 'filePath'
            },
                    {
                label: 'MD5',
                prop: 'md5'
            },
                    {
                label: '创建时间',
                prop: 'createTime'
            },
            ]
}
