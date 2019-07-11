import { getStore, setStore } from '@/util/store'

const pan = {
    state: {
        levelList: [],
        flushFileListEvent: 0
    },
    mutations: {
        pushLevelList(state, val) {
            state.levelList.push(val)
        },
        spliceLevelList(state, index) {
            state.levelList.splice(index + 1, state.levelList.length - index)
        },
        flushFileListEvent(state) {
            state.flushFileListEvent++
        }
    }

}

export default pan