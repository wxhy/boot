<template>
  <div>
    <div class="bt">
      <el-button type="primary" size="medium" icon="el-icon-upload" @click="upload">上传文件</el-button>

      <el-button size="medium" icon="el-icon-folder-add" @click="createFolder">新建文件夹</el-button>

      <div id="search">
        <input placeholder="请输入内容" class="search" v-model="keywords" />
        <i class="el-icon-search"></i>
      </div>
    </div>
    <Breadcrumb />
    <el-table :data="tableData" tooltip-effect="dark" :height="height" style="width: 100%">
      <el-table-column prop="fileName" label="文件名" width="800" sortable>
        <template slot-scope="scope">
          <FileIcon :type="scope.row.type" />
          <a
            class="file-name"
            @click="getFileList(scope.row.id, scope.row.fileName)"
            v-if="scope.row.type === 'folder'"
          >{{scope.row.fileName}}</a>

          <a
            class="file-name"
            target="_blank"
           href="http://localhost:9000/oss/afa9b6f3da3dd154aa46235d9db2ae21..pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20190719%2F%2Fs3%2Faws4_request&X-Amz-Date=20190719T055746Z&X-Amz-Expires=432000&X-Amz-SignedHeaders=host&X-Amz-Signature=f1ac040e7cd05f6a4a21da1ee7f31c5e18d5f3537c079a8ca80e43a80261e40c"
            v-if="scope.row.type === 'doc'"
          >{{scope.row.fileName}}</a>

          <a class="file-name" v-else>{{scope.row.fileName}}</a>
        </template>
      </el-table-column>
      <el-table-column prop="fileSize" label="大小" width="250" :formatter="formatterSize" sortable></el-table-column>
      <el-table-column prop="updateTime" label="修改日期" width="250" sortable></el-table-column>
      <el-table-column label="操作" min-width="22">
        <template slot-scope="scope">
          <FileOperator v-on:flush="flushAccordingToLevelList" :scope="scope" />
        </template>
      </el-table-column>
    </el-table>

    <FileTree v-on:flush="flushAccordingToLevelList" v-if="fileTreeDialogVisible" />
    <el-dialog title="预览" :fullscreen="true" :visible.sync="previewVisible">
<PdfRender visible="previewVisible" path="http://localhost:9000/oss/afa9b6f3da3dd154aa46235d9db2ae21..pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20190719%2F%2Fs3%2Faws4_request&X-Amz-Date=20190719T055746Z&X-Amz-Expires=432000&X-Amz-SignedHeaders=host&X-Amz-Signature=f1ac040e7cd05f6a4a21da1ee7f31c5e18d5f3537c079a8ca80e43a80261e40c"/>
    </el-dialog>
    
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import { addObj, fetchList } from "@/api/pan/pan";
import { formatBytes } from "@/util/util";
import store from "@/store";
import FileIcon from "./FileIcon";
import Breadcrumb from "./Breadcrumb";
import FileOperator from "./FileOperator";
import FileTree from "./FileTree";
import Bus from "@/const/bus";
import PdfRender from './PdfRender'
export default {
  name: "PanRight",
  components: { FileIcon, Breadcrumb, FileOperator, FileTree, PdfRender },
  data() {
    return {
      height: window.innerHeight - 62 - 80 - 40,
      tableData: [],
      keywords: "",
      previewVisible:false,
      loading: false,
      uploadParams: {}
    };
  },
  computed: {
    ...mapGetters(["fileTreeDialogVisible", "filePdfVisible"]),
    levelList() {
      return store.getters.levelList;
    }
  },
  watch: {
    levelList() {
      this.flushAccordingToLevelList();
    },
    "$store.state.flushFileListEvent"() {
      this.flushAccordingToLevelList();
    }
  },
  created() {
    if (this.levelList.length === 0) {
      this.getFileList(0, "全部文件");
      this.uploadParams = {
        parentId: 0
      };
    } else {
      this.flushAccordingToLevelList();
    }
  },
  mounted() {
    // 文件选择后的回调
    Bus.$on("fileAdded", () => {
      console.log("文件已选择");
    });
    // 文件上传成功的回调
    Bus.$on("fileSuccess", () => {
      this.flushAccordingToLevelList();
    });
  },
  destroyed() {
    Bus.$off("fileAdded");
    Bus.$off("fileSuccess");
  },
  methods: {
    createFolder() {
      let parentId = this.levelList[this.levelList.length - 1].parentId;
      this.$prompt("请输入文件夹名", "新建文件夹", {
        confirmButtonText: "确定",
        cancelButtonText: "取消"
      })
        .then(({ value }) => {
          addObj(
            Object.assign({}, { fileName: value, parentId: parentId })
          ).then(res => {
            if (res.data.code == 0) {
              this.$message({
                type: "success",
                message: "添加成功!"
              });
              this.flushAccordingToLevelList();
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
    getFileList(parentId, name) {
      this.loading = true;
      fetchList({
        parentId: parentId
      }).then(response => {
        let len = this.levelList.length;
        this.tableData = response.data.data;
        this.loading = false;
        if (len !== 0 && this.levelList[len - 1].parentId === parentId) {
          return;
        }
        this.$store.commit("pushLevelList", {
          parentId: parentId,
          name: name
        });
      });
    },
    flushAccordingToLevelList() {
      let lastVal = this.levelList[this.levelList.length - 1];
      this.uploadParams = {
        parentId: lastVal.parentId
      };
      this.getFileList(lastVal.parentId, lastVal.name);
    },
    formatterSize(row) {
      if (row.type === "folder") {
        return "-";
      }
      return formatBytes(row.fileSize);
    },
    upload() {
      console.log("选择文件上传");
      Bus.$emit("openUploader", this.uploadParams);
    },
    getPdfRender(id) {}
  }
};
</script>
<style scoped>
a.file-name {
  cursor: pointer;
}
.bt {
  max-width: 100%;
  background-color: white;
  height: 40px;
  padding: 15px 15px 0px 15px;
  font: 12px/1.5 "Microsoft YaHei", arial, SimSun, "宋体";
  line-height: 30px;
}
.nav {
  max-width: 100%;
  background-color: white;
  height: 20px;
  font-size: 8px;
  line-height: 20px;
}

.el-table-column {
  max-height: 48px;
  line-height: 48px;
}

.el-table {
  max-width: 100%;
  font: 12px/1.5 "Microsoft YaHei", arial, SimSun, "宋体";
}

#search {
  width: 315px;
  border-radius: 33px;
  background-color: #f7f7f7;
  float: right;
  text-align: center;
  height: 32px;
  line-height: 32px;
}

.search {
  border: none;
  background-color: #f7f7f7;
  height: 30px;
  width: 248px;
}

img {
  width: 30px;
  height: 30px;
}

a {
  color: #424e67;
  text-decoration: none;
}

a:hover {
  color: #09aaff;
}
.el-icon-delete {
  color: #f56c6c;
}
.img-style {
  cursor: default;
  display: block;
  height: 26px;
  width: 26px;
  position: absolute;
  left: 0px;
  top: 10px;
}
.file-name {
  position: absolute;
  left: 50px;
  top: 12px;
}
.drawer-footer {
  z-index: 10;
  width: 100%;
  position: absolute;
  bottom: 0;
  left: 0;
  border-top: 1px solid #e8e8e8;
  padding: 10px 16px;
  text-align: right;
  background: #fff;
}
</style>
