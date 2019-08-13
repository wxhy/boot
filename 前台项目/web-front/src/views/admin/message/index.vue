

<template>
  <div class="message">
    <basic-container>
      <avue-crud
        ref="crud"
        :page="page"
        :data="tableData"
        :table-loading="tableLoading"
        :option="tableOption"
        @on-load="getList"
        @search-change="searchChange"
        @refresh-change="refreshChange"
      >
        <template slot-scope="scope" slot="menuLeft">
          <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAdd()">新增</el-button>
        </template>

        <template slot-scope="scope" slot="content">
          <avue-text-ellipsis :text="scope.row.content" :height="30" :width="220" use-tooltip placement="top">
          </avue-text-ellipsis>
        </template>

        <template slot="menu" slot-scope="scope">
          <el-button
            size="small"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row,scope.index)"
          >编辑</el-button>
          <el-button
            size="small"
            type="text"
            icon="el-icon-delete"
            @click="deletes(scope.row,scope.index)"
          >删除撤回</el-button>
        </template>
      </avue-crud>
    </basic-container>

    <el-dialog title="发送新消息" :visible.sync="createVisible" :fullscreen="true">
      <avue-form ref="form" v-model="obj" :option="formOption" @submit="handleSubmit()">
        <template slot="userIds" slot-scope="scope">
          <div v-if="obj.ranger == 1">
            <avue-userSelect v-model="obj.userIds"></avue-userSelect>
          </div>
        </template>
      </avue-form>
    </el-dialog>

    <el-dialog title="编辑消息" :visible.sync="updateVisible" :fullscreen="true">
      <avue-form ref="form" v-model="message" :option="updateOption" @submit="handleUpdateSubmit()"></avue-form>
    </el-dialog>
  </div>
</template>

<script>
import { fetchList, addObj, getObj, putObj, delObj } from "@/api/admin/message";
import {
  tableOption,
  formOption,
  updateOption
} from "@/const/crud/admin/message";
import { mapGetters } from "vuex";

export default {
  name: "message",
  data() {
    return {
      tableData: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption,
      formOption: formOption,
      updateOption: updateOption,
      createVisible: false,
      updateVisible: false,
      obj: {
        userIds: []
      },
      message: {}
    };
  },
  created() {},
  mounted: function() {},
  computed: {
    ...mapGetters(["permissions"])
  },
  methods: {
    getList(page, params) {
      this.tableLoading = true;
      fetchList(
        Object.assign(
          {
            current: page.currentPage,
            size: page.pageSize
          },
          params
        )
      ).then(response => {
        this.tableData = response.data.data.records;
        this.page.total = response.data.data.total;
        this.tableLoading = false;
      });
    },
    handleAdd() {
      this.createVisible = true;
    },
    handleSubmit() {
      addObj(this.obj).then(() => {
        this.refreshChange();
        this.createVisible = false;
        this.$notify({
          title: "成功",
          message: "创建成功",
          type: "success",
          duration: 2000
        });
      });
    },
    handleUpdateSubmit() {
      putObj(this.message).then((response) => {
        this.refreshChange();
        this.updateVisible = false;
        this.$notify({
          title: "成功",
          message: "修改成功",
          type: "success",
          duration: 2000
        });
      });
    },
    deletes(row, index) {
      this.$confirm("您确认要删除吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        delObj(row.messageId)
          .then(() => {
            this.tableData.splice(index, 1);
            this.$notify({
              title: "成功",
              message: "删除成功",
              type: "success",
              duration: 2000
            });
          })
          .catch(() => {
            this.$notify({
              title: "失败",
              message: "删除失败",
              type: "error",
              duration: 2000
            });
          });
      });
    },
    handleUpdate(row, index) {
      getObj(row.messageId).then(response => {
        this.message = response.data.data;
        this.updateVisible = true;
      });
    },
    /**
     * 搜索回调
     */
    searchChange(form) {
      this.getList(this.page, form);
    },
    /**
     * 刷新回调
     */
    refreshChange() {
      this.getList(this.page);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>

