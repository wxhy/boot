import { getStore, setStore } from '@/util/store'

const pan = {
    state: {
        levelList: [],
        flushFileListEvent: 0,
        fileTreeDialogVisible: false,
        fileTreeInfo: {
            title: '设置'
        },
    },
    mutations: {
        pushLevelList(state, val) {
            state.levelList.push(val)
        },
        spliceLevelList(state, index) {
            state.levelList.splice(index + 1, state.levelList.length - index)
        },
        openFileTreeDialog(state, info) {
            state.fileTreeDialogVisible = true
            state.fileTreeInfo = info
        },
        closeFileTreeDialog(state) {
            state.fileTreeDialogVisible = false
        },
        flushFileListEvent(state) {
            state.flushFileListEvent++
        }
    }

}

export default pan