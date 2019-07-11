<template>
  <div>
    <div class="bt">
      <el-button
        type="primary"
        size="medium"
        icon="el-icon-upload"
        @click="dialogVisible = true"
      >上传文件</el-button>
      <el-button size="medium" icon="el-icon-folder-add" @click="createFolder">新建文件夹</el-button>

      <div id="search">
        <input placeholder="请输入内容" class="search" v-model="keywords" />
        <i class="el-icon-search"></i>
      </div>
    </div>
    <Breadcrumb />
    <el-table :data="tableData" tooltip-effect="dark" :height="height" style="width: 100%">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="fileName" label="文件名" width="800" sortable>
        <template slot-scope="scope">
          <FileIcon :type="scope.row.type" />
          <a
            class="file-name"
            @click="getFileList(scope.row.id, scope.row.fileName)"
            v-if="scope.row.type === 'folder'"
          >{{scope.row.fileName}}</a>
          <a class="file-name" v-else>{{scope.row.fileName}}</a>
        </template>
      </el-table-column>
      <el-table-column prop="fileSize" label="大小" width="150" :formatter="formatterSize"></el-table-column>
      <el-table-column prop="updateTime" label="修改日期" width="150"></el-table-column>
      <el-table-column>
        <template slot-scope="{row,$index}">
          <el-tooltip class="item" effect="dark" content="下载" placement="bottom-start">
            <el-button type="text">
              <i class="el-icon-download" @click="download(row.name)"></i>
            </el-button>
          </el-tooltip>
          <el-tooltip class="item" effect="dark" content="删除" placement="bottom-start">
            <el-button type="text">
              <i class="el-icon-delete" @click="del(row.name,$index)"></i>
            </el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { addObj, fetchList } from "@/api/pan/pan";
import { formatBytes } from "@/util/util";
import store from "@/store";
import FileIcon from "./FileIcon";
import Breadcrumb from "./Breadcrumb";
export default {
  name: "PanRight",
  components: { FileIcon, Breadcrumb },
  data() {
    return {
      height: window.innerHeight - 62 - 80 - 40,
      tableData: [],
      keywords: "",
      loading: false,
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      dialogVisible: false
    };
  },
  computed: {
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
    } else {
      this.flushAccordingToLevelList();
    }
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
        current: this.page.currentPage,
        size: this.page.pageSize,
        parentId: parentId
      }).then(response => {
        this.tableData = response.data.data.records;
        this.page.total = response.data.data.total;
        let len = this.levelList.length;
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
      this.getFileList(lastVal.parentId, lastVal.name);
    },
    formatterSize(row) {
      if (row.type === "folder") {
        return "-";
      }
      return formatBytes(row.fileSize);
    }
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
  /*font: 12px/1.5 "Microsoft YaHei", arial, SimSun, "宋体";*/
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
  top: 18px;
}
</style>
