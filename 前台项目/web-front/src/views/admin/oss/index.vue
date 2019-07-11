<!--
  -    Copyright (c) 2018-2025, lengleng All rights reserved.
  -
  - Redistribution and use in source and binary forms, with or without
  - modification, are permitted provided that the following conditions are met:
  -
  - Redistributions of source code must retain the above copyright notice,
  - this list of conditions and the following disclaimer.
  - Redistributions in binary form must reproduce the above copyright
  - notice, this list of conditions and the following disclaimer in the
  - documentation and/or other materials provided with the distribution.
  - Neither the name of the pig4cloud.com developer nor the names of its
  - contributors may be used to endorse or promote products derived from
  - this software without specific prior written permission.
  - Author: lengleng (wangiegie@gmail.com)
  -->

<template>
  <div class="log">
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
        @selection-change="selectionChange"
        @row-del="rowDel"
      >
        <template slot-scope="scope" slot="url">
          <img
            :id="scope.row.fkey"
            :src="handleImg(scope.row.fkey,scope.row.fkey)"
            @click="openPreview(scope.row)"
            class="imgStyle"
          />
        </template>
        <template slot="menuLeft">
          <el-button
            class="filter-item"
            @click="handleCreate"
            size="small"
            type="primary"
            icon="el-icon-upload"
          >上传</el-button>
          <el-button class="filter-item" @click="handleDelBatch" size="small" type="danger">批量删除</el-button>
        </template>
        <template slot-scope="scope" slot="menu">
          <el-button
            type="text"
            icon="el-icon-delete"
            size="mini"
            @click="handleDel(scope.row,scope.index)"
          >删除</el-button>
        </template>
      </avue-crud>
    </basic-container>

    <avue-drawer title="文件上传" show-close v-model="uploadVisible" :width="380">
      <el-upload
        class="upload-demo"
        drag
        :headers="headers"
        :before-close="refreshChange"
        action="/admin/file/upload"
        multiple
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">
          将文件拖到此处，或
          <em>点击上传</em>
        </div>
      </el-upload>
    </avue-drawer>

    <el-dialog title="预览" :visible.sync="prewVisible" style="text-align:center">
      <img id="pictureDetail" :src="avatarUrl" style="width: 100%; margin: 0px auto; display: block;"/>
    </el-dialog>
  </div>
</template>

<script>
import { delObj, fetchList, delBatchObj } from "@/api/admin/oss";
import { tableOption } from "@/const/crud/admin/oss";
import { handleImg } from "@/util/util";
import store from "@/store";
import _ from "lodash";
import { mapGetters } from "vuex";

export default {
  name: "oss",
  data() {
    return {
      tableData: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 10 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption,
      prewVisible: false,
      uploadVisible: false,
      avatarUrl: "",
      headers: {
        Authorization: "Bearer " + store.getters.access_token
      },
      selections: []
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
            descs: "create_time",
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
    handleDel(row, index) {
      this.$refs.crud.rowDel(row, index);
    },
    selectionChange(val) {
      this.selections = val;
    },
    handleDelBatch() {
      if (this.selections.length <= 0) {
        this.$message.warning("请至少选择一行");
        return;
      }
      delBatchObj(_.map(this.selections, "id").join("-")).then(response => {
        this.getList(this.page);
        this.$refs.crud.toggleSelection();
        this.$message.success("删除了" + response.data.data + "条记录");
      });
    },
    rowDel: function(row, index) {
      var _this = this;
      this.$confirm('是否确认删除"' + row.fkey + '"文件?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(function() {
          return delObj(row.id);
        })
        .then(data => {
          this.getList(this.page);
          _this.$message({
            showClose: true,
            message: "删除成功",
            type: "success"
          });
        })
        .catch(function(err) {});
    },
    handleCreate() {
      this.uploadVisible = true;
    },
    handleImg(key, id) {
      handleImg(key, id);
    },
    openPreview(row) {
      this.prewVisible = true;
      handleImg(row.fkey, "pictureDetail");
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
.imgStyle {
  cursor: pointer;
  width: 80px;
  height: 60px;
  margin: 10px 0px;
  object-fit: contain;
}
</style>

