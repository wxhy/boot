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
  <div class="message">
    <basic-container>
      <avue-crud ref="crud"
                 :page="page"
                 :data="tableData"
                 :table-loading="tableLoading"
                 :option="tableOption"
                 @on-load="getList"
                 @search-change="searchChange"
                 @refresh-change="refreshChange"
                 @row-del="rowDel">
        <template slot-scope="scope"
                  slot="menuLeft">
          <el-button type="primary"
                     icon="el-icon-plus"
                     size="mini"
                     @click="handleAdd()">新增
          </el-button>
        </template>
      </avue-crud>
    </basic-container>

    <el-dialog title="发送新消息"
        :visible.sync="createVisible">
      <avue-form ref="form" v-model="obj" :option="formOption">
          <template slot="content" slot-scope="{item,value,label}">
              <span></span>
          </template>
      </avue-form>
    </el-dialog>
  </div>
</template>

<script>
  import {fetchList} from '@/api/admin/message'
  import {tableOption,formOption} from '@/const/crud/admin/message'
  import {mapGetters} from 'vuex'
import { truncate } from 'fs';

  export default {
    name: 'message',
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
        formOption:formOption,
        createVisible:false,
        obj:{}
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
          current: page.currentPage,
          size: page.pageSize
        }, params)).then(response => {
          this.tableData = response.data.data.records
          this.page.total = response.data.data.total
          this.tableLoading = false
        })
      },
      handleAdd(){
        this.createVisible = true;
      },
      /**
       * 搜索回调
       */
      searchChange(form) {
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

