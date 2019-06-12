<template>
  <div class="app-container calendar-list-container">
    <basic-container>
      <el-row :span="24" style="min-height:650px;">
        <el-col :xs="24" :sm="24" :md="5">
          <el-tabs v-model="activeName" tab-position="left" @tab-click="switchTab">
            <el-tab-pane label="未读消息" name="0"/>
            <el-tab-pane label="已读消息" name="1"/>
          </el-tabs>
        </el-col>
        <el-col :xs="24" :sm="24" :md="19">
          <el-button>全部标记为已读</el-button>
          <el-table :data="data" style="width:100%">
            <el-table-column prop="id" label="#" width="50">
              <template slot-scope="scope">{{scope.row.messageId}}</template>
            </el-table-column>
            <el-table-column prop="title" width="800">
              <template slot-scope="scope">
                <span class="message-title">[{{scope.row.type}}] {{scope.row.title}}</span>
              </template>
            </el-table-column>
            <el-table-column prop="createTime" width="200">
              <template slot-scope="scope">
                <i class="el-icon-time"></i>
                <span style="margin-left: 10px">{{ scope.row.createTime }}</span>
              </template>
            </el-table-column>
            <el-table-column>
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="danger"
                  @click="handleDelete(scope.$index, scope.row)"
                >标记为已读</el-button>
                <el-button
                  size="mini"
                  type="danger"
                  @click="handleDelete(scope.$index, scope.row)"
                >删除</el-button>
              </template>
            </el-table-column>
          </el-table>

          <div class="pgbottom">
            <el-pagination
              :current-page="page.currentPage"
              :page-size="page.pageSize"
              layout="total,  prev, pager, next, jumper"
              :total="page.total"
            ></el-pagination>
          </div>
        </el-col>
      </el-row>
    </basic-container>
  </div>
</template>


<script>
import { fetchMessageList, addObj, getObj, putObj, delObj } from "@/api/admin/message";
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      data: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      activeName:"0"
    };
  },
  created() {
    this.getList(this.page);
  },
  mounted: function() {},
  computed: {
    ...mapGetters(["permissions"])
  },
  methods: {
    switchTab(tab, event) {
      this.activeName = tab.name;
      this.page.currentPage = 1;
      this.getList(this.page,{status:this.activeName})
    },
    getList(page, params) {
      this.tableLoading = true;
      fetchMessageList(
        Object.assign(
          {
            current: page.currentPage,
            size: page.pageSize
          },
          params
        )
      ).then(response => {
        this.data = response.data.data.records;
        this.page.total = response.data.data.total;
      });
    },
    handleDelete(row, index) {}
  }
};
</script>

<style>
.el-tabs__header {
  width: 300px;
}
.el-tabs__header .el-tabs__item {
  text-align: center !important;
}
.pane {
  padding: 10px;
  margin: 0 20px;
  border-bottom: 1px dashed #d2d3d2;
}
.message-title {
  color: #2d8cf0;
  background: 0 0;
  text-decoration: none;
  outline: 0;
  cursor: pointer;
  transition: color 0.2s ease;
  margin: 0px 30px 0px 0px;
}
.pgbottom {
  bottom: 0px;
  position: absolute;
  right: 0px;
}
</style>
