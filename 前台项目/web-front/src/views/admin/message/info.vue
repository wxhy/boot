<template>
  <span class="app-container calendar-list-container">
    <basic-container>
      <el-row :span="24" style="min-height:700px;height: auto;">
        <el-col :xs="24" :sm="24" :md="5">
          <el-tabs v-model="activeName" tab-position="left" @tab-click="switchTab">
            <el-tab-pane label="未读消息" name="0"/>
            <el-tab-pane label="已读消息" name="1"/>
          </el-tabs>
        </el-col>
        <el-col :xs="24" :sm="24" :md="19">
          <div class="messagetb" v-if="!cardVisible" style="min-height:700px;height: auto;">
            <el-button v-if="activeName == 0" @click="doAllRead()">全部标记为已读</el-button>
            <el-table :data="data" style="width:100%" v-loading="loading">
              <el-table-column prop="id" label="#" width="50">
                <template slot-scope="scope">{{scope.row.messageId}}</template>
              </el-table-column>
              <el-table-column prop="title" width="600">
                <template slot-scope="scope">
                  <span
                    class="message-title"
                    @click="lookDetail(scope.row.id)"
                  >[{{findKey(scope.row.type)}}] {{scope.row.title}}</span>
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
                    v-if="activeName==0"
                    size="mini"
                    type="danger"
                    @click="handleRead(scope.row, scope.$index)"
                  >标记为已读</el-button>
                  <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.row, scope.$index)"
                  >删除</el-button>
                </template>
              </el-table-column>
            </el-table>

            <div class="pgbottom">
              <el-pagination
                @current-change="handleCurrentChange"
                :current-page="page.currentPage"
                :page-size="page.pageSize"
                layout="total,  prev, pager, next, jumper"
                :total="page.total"
              ></el-pagination>
            </div>
          </div>

          <el-card class="box-card" v-if="cardVisible">
            <span slot="header">
              <el-button type="text" @click="goBack()" style="float:left;">
                <span>
                  <i class="el-icon-arrow-left"></i>
                  返回
                </span>
              </el-button>

              <span style="font-weight: bold;">{{detail.title}}</span>
            </span>
            <div v-html="detail.content"></div>
          </el-card>
        </el-col>
      </el-row>
    </basic-container>
  </span>
</template>


<script>
import {
  fetchMessageList,
  doRead,
  doReadAll,
  getMessageObj,
  removeMessage,
  delMessage
} from "@/api/admin/message";
import { remote } from "@/api/admin/dict";
import { mapGetters } from "vuex";
export default {
  data() {
    return {
      data: [],
      loading: false,
      cardVisible: false,
      detail: {},
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 10 // 每页显示多少条
      },
      activeName: "0",
      dictData: []
    };
  },
  created() {
    this.getList(this.page, { status: this.activeName, delflag: "0" });
    remote("message_type").then(response => {
      this.dictData = response.data.data;
    });
  },
  mounted: function() {
    this.$store.commit("SET_HAS_NEWS", false);
  },
  computed: {
    ...mapGetters(["permissions"])
  },
  methods: {
    switchTab(tab, event) {
      this.activeName = tab.name;
      this.page.currentPage = 1;
      this.getList(this.page, { status: this.activeName, delflag: "0" });
    },
    getList(page, params) {
      this.loading = true;
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
        this.loading = false;
      });
    },
    findKey(value) {
      let label = "";
      this.dictData.forEach(el => {
        if (el.value === value) {
          label = el.label;
        }
      });
      return label;
    },
    handleRead(row, index) {
      doRead(row.id).then(response => {
        this.refreshChange();
        this.data.splice(index, 1);
        this.$message.success("已标记为阅读");
      });
    },
    doAllRead() {
      doReadAll().then(response => {
        this.data = [];
        this.$message.success("已全部标记为阅读");
      });
    },
    handleDelete(row, index) {
      removeMessage(row.id).then(response => {
        this.refreshChange();
        this.data.splice(index, 1);
        this.$message.success("删除成功");
      });
    },
    handleCurrentChange(val) {
      this.page.currentPage = val;
      this.refreshChange();
    },
    /**
     * 刷新回调
     */
    refreshChange() {
      this.getList(this.page, { status: this.activeName, delflag: "0" });
    },
    lookDetail(id) {
      doRead(id);
      getMessageObj(id).then(response => {
        this.detail = response.data.data;
        this.cardVisible = true;
      });
    },
    goBack() {
      this.cardVisible = false;
    }
  }
};
</script>

<style>
.app-container .el-tabs__header {
  width: 300px;
}
.el-card__header {
  padding-top: 0px;
  text-align: center;
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
