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
  <div class="execution">
    <basic-container>
      <avue-crud ref="crud"
                 :page="page"
                 :data="tableData"
                 :table-loading="tableLoading"
                 :option="tableOption"
                 @on-load="getList"
                 @search-change="searchChange"
                 @refresh-change="refreshChange"
                 @row-update="handleUpdate"
                 @row-save="handleSave"
                 @row-del="rowDel">
        <template slot="menuLeft">
          <el-button type="primary"
                     @click="handleAdd"
                     size="small"
                     v-if="permissions.act_leavebill_add">新 增
          </el-button>
        </template>
        <template slot-scope="scope"
                  slot="menuBtn">
          <el-dropdown-item divided
                            v-if="permissions.act_leavebill_edit && scope.row.state == 0"
                            @click.native="handleSubmit(scope.row,scope.index)">提交
          </el-dropdown-item>
            <el-dropdown-item divided
                            v-if="permissions.act_leavebill_edit && scope.row.state != 0"
                            @click.native="handleHis(scope.row,scope.index)">审批历史
          </el-dropdown-item>
          <el-dropdown-item divided
                            v-if="permissions.act_leavebill_edit"
                            @click.native="handleEdit(scope.row,scope.index)">编辑
          </el-dropdown-item>

          <el-dropdown-item divided
                            v-if="permissions.act_leavebill_del"
                            @click.native="handleDel(scope.row,'suspend')">删除
          </el-dropdown-item>
        </template>
      </avue-crud>
    </basic-container>

    <el-dialog title="审批历史" 
       width="70%"
      :visible.sync="dialogHistoryVisible">
      <el-table
        :data="taskHistory"
        style="width: 100%">
        <el-table-column
          prop="taskName"
          label="任务名称"
          width="180">
        </el-table-column>
        <el-table-column
          prop="userId"
          label="处理人"
          width="180">
        </el-table-column>
        <el-table-column
          prop="deleteReason"
          label="审批操作">
        </el-table-column>
         <el-table-column
          prop="fullMessage"
          label="审批意见">
        </el-table-column>
          <el-table-column
          prop="time"
          label="创建时间">
        </el-table-column>
        <el-table-column
          prop="endTime"
          label="结束时间">
        </el-table-column>
    </el-table>
      <img :src="actPicUrl" width="100%">
    </el-dialog>
  </div>
</template>

<script>
  import {addObj, delObj, fetchList, getObj, putObj, submit,fetchHistory} from '@/api/activiti/leave-bill'
  import {tableOption} from '@/const/crud/activiti/leave-bill'
  import {mapGetters} from 'vuex'

  export default {
    name: 'leave-bill',
    data() {
      return {
        tableData: [],
        taskHistory:[],
        page: {
          total: 0, // 总页数
          currentPage: 1, // 当前页数
          pageSize: 20 // 每页显示多少条
        },
        tableLoading: false,
        dialogHistoryVisible: false,
        tableOption: tableOption,
        actPicUrl:'',
      }
    },
    created() {
    },
    mounted: function () {
    },
    computed: {
      ...mapGetters(['permissions'])
    },
    methods: {
      getList(page, params) {
        this.tableLoading = true
        fetchList(Object.assign({
          descs: 'create_time',
          current: page.currentPage,
          size: page.pageSize
        }, params)).then(response => {
          this.tableData = response.data.data.records
          this.page.total = response.data.data.total
          this.tableLoading = false
        })
      },
      /**
       * @title 打开新增窗口
       * @detail 调用crud的handleadd方法即可
       *
       **/
      handleAdd: function () {
        this.$refs.crud.rowAdd()
      },
      handleEdit(row, index) {
        this.$refs.crud.rowEdit(row, index)
      },
      handleDel(row, index) {
        this.$refs.crud.rowDel(row, index)
      },
      handleHis(row,index) {
        fetchHistory(row.proInstanceId)
        .then(response=>{
          this.taskHistory = response.data.data
        })

        this.dialogHistoryVisible = true;
        this.actPicUrl = `/act/task/view/` + row.proInstanceId
      },
      rowDel: function (row, index) {
        var _this = this
        this.$confirm('是否确认删除ID为' + row.leaveId, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function () {
          return delObj(row.leaveId)
        }).then(data => {
          _this.tableData.splice(index, 1)
          _this.$message({
            showClose: true,
            message: '删除成功',
            type: 'success'
          })
        })
      },
      handleSubmit: function (row, index) {
        var _this = this
        this.$confirm('是否确认提交ID为' + row.leaveId, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function () {
          return submit(row.leaveId)
        }).then(data => {
          _this.tableData.splice(index, 1)
          _this.$message({
            showClose: true,
            message: '提交成功',
            type: 'success'
          })
          this.getList(this.page)
        })
      },
      /**
       * @title 数据更新
       * @param row 为当前的数据
       * @param index 为当前更新数据的行数
       * @param done 为表单关闭函数
       *
       **/
      handleUpdate: function (row, index, done) {
        putObj(row).then(data => {
          this.tableData.splice(index, 1, Object.assign({}, row))
          this.$message({
            showClose: true,
            message: '修改成功',
            type: 'success'
          })
          done()
          this.getList(this.page)
        })
      },
      /**
       * @title 数据添加
       * @param row 为当前的数据
       * @param done 为表单关闭函数
       *
       **/
      handleSave: function (row, done) {
        addObj(row).then(data => {
          this.tableData.push(Object.assign({}, row))
          this.$message({
            showClose: true,
            message: '添加成功',
            type: 'success'
          })
          done()
          this.getList(this.page)
        })
      },
      /**
       * 搜索回调
       */
      searchChange(form) {
        this.page.state = form.state
        this.getList(this.page, form)
      },
      /**
       * 刷新回调
       */
      refreshChange() {
        this.getList(this.page)
      }
    }
  }
</script>

<style lang="scss" scoped>
</style>

