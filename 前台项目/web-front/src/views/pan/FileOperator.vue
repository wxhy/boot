<template>
  <el-dropdown>
    <span class="el-dropdown-link">
      <i class="el-icon-more operation"></i>
    </span>
    <el-dropdown-menu slot="dropdown">
      <el-dropdown-item @click.native="move">移动到</el-dropdown-item>
      <el-dropdown-item @click.native="copy" v-if="scope.row.type !== 'folder'">复制到</el-dropdown-item>
      <el-dropdown-item @click.native="rename">重命名</el-dropdown-item>
      <el-dropdown-item @click.native="download" v-if="scope.row.type !== 'folder'">
        下载
        <a style="display:none" ref="resourceDown" download>下载</a>
      </el-dropdown-item>
      <el-dropdown-item @click.native="deleteResource">删除</el-dropdown-item>
    </el-dropdown-menu>
  </el-dropdown>
</template>


<script>
import { delObj, renameFile } from "@/api/pan/pan";
export default {
  props: ["scope"],
  data() {
    return {};
  },
  methods: {
    move() {
      this.$store.commit("openFileTreeDialog", {
        title: "[" + this.scope.row.fileName + "] 移动到",
        id: this.scope.row.id,
        type: "move"
      });
    },
    copy() {
      this.$store.commit("openFileTreeDialog", {
        title: "[" + this.scope.row.fileName + "] 复制到",
        id: this.scope.row.id,
        type: "copy"
      });
    },
    rename() {
      this.$prompt("请输入新的文件名", "重新命名", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        inputValue: this.scope.row.fileName
      })
        .then(({ value }) => {
          renameFile(this.scope.row.id, value).then(res => {
            if (res.data.code == 0) {
              this.$message({
                type: "success",
                message: "修改成功!"
              });
              this.$emit("flush");
            } else {
              this.$message({
                type: "warning",
                message: res.data.message
              });
            }
          });
        })
        .catch(() => {});
    },
    download() {},
    deleteResource() {
      this.$confirm("是否确定要删除该文件？", "删除", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          delObj(this.scope.row.id).then(res => {
            if (res.data.code == 0) {
              this.$message({
                type: "success",
                message: "删除成功!"
              });
              this.$emit("flush");
            }
          });
        })
        .catch(() => {});
    }
  }
};
</script>

<style lang="scss" scoped>
.el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.el-icon-arrow-down {
  font-size: 12px;
}
</style>