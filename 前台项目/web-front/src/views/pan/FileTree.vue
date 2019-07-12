<template>
  <el-dialog
    :title="fileTreeInfo.title"
    :visible.sync="fileTreeDialogVisible"
  >
    <el-tree
      :props="defaultProps"
      :load="loadNode"
      node-key="id"
      empty-text="没有文件夹"
      ref="fileTree"
      lazy
      check-strictly
      highlight-current
    ></el-tree>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$store.commit('closeFileTreeDialog')">取 消</el-button>
      <el-button type="primary" @click="operateNode">确 定</el-button>
    </div>
  </el-dialog>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import { copyObj,moveObj, fetchSubfolder } from "@/api/pan/pan";
export default {
  computed: {
    ...mapGetters(["fileTreeDialogVisible","fileTreeInfo"])
  },
  data() {
    return {
      defaultProps: {
        label: "fileName"
      }
    };
  },
  methods: {
    loadNode(node, resolve) {
      if (node.level === 0) {
        resolve([
          {
            id: 0,
            fileName: "全部文件"
          }
        ]);
      } else {
        fetchSubfolder(node.data.id).then(response => {
          if (this.fileTreeInfo.type === "move") {
            resolve(
              response.data.data.filter(item => {
                return item.id !== this.fileTreeInfo.id;
              })
            );
          } else {
            resolve(response.data.data);
          }
        });
      }
    },
    operateNode() {
      if (this.fileTreeInfo.type === "move") {
        this.moveNode();
      } else if (this.fileTreeInfo.type === "copy") {
        this.copyNode();
      }
    },
    moveNode() {
      let keys = this.$refs.fileTree.getCurrentKey();
      if (keys == null) {
        this.$message({
          message: "请选择一个将要移动的目标文件夹",
          type: "warning",
          duration: 3 * 1000
        });
      } else {
        moveObj(this.fileTreeInfo.id, keys).then(() => {
          this.$emit("flush");
          this.$store.commit("closeFileTreeDialog");
        });
      }
    },
    copyNode() {
      let keys = this.$refs.fileTree.getCurrentKey();
      if (keys == null) {
        this.$message({
          message: "请选择将要复制到的目标文件夹",
          type: "warning",
          duration: 3 * 1000
        });
      } else {
        copyObj(this.fileTreeInfo.id, keys).then(() => {
          this.$message({
            message: "复制成功",
            type: "success",
            duration: 3 * 1000
          });
          this.$store.commit("closeFileTreeDialog");
        });
      }
    }
  }
};
</script>