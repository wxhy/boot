<template>
  <div class="execution">
    <basic-container>
      <avue-crud ref="crud"
                 :data="tableData" 
                 :option="tableOption" 
                 v-model="quartz_job"
                 :table-loading="tableLoading"
                 @on-load="getList"
                 @refresh-change="refreshChange"
                 @row-del="rowDel">
        <template slot-scope="scope" slot="cronExpressionForm">
          <el-popover v-model="cronPopover">
            <vueCron
              @change="changeCron"
              @close="cronPopover=false"
              :data="quartz_job.cronExpression"
              i18n="cn"
            ></vueCron>
            <el-input
              slot="reference"
              @click="cronPopover=true"
              v-model="quartz_job.cronExpression"
              placeholder="请输入定时策略"
            ></el-input>
          </el-popover>
        </template>
      </avue-crud>
    </basic-container>
  </div>
</template>

<script>
import { delObj, fetchList } from "@/api/admin/quartz";
import { tableOption } from "@/const/crud/admin/quartz";
import { mapGetters } from "vuex";

export default {
  name: "quartz",
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
      cronPopover: false,
      quartz_job: {}
    };
  },
  created() {},
  mounted: function() {},
  computed: {
    ...mapGetters(["permissions"])
  },
  methods: {
    changeCron(val) {
        this.quartz_job.cronExpression = val;
    },
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
    handleDel(row, index) {
      this.$refs.crud.rowDel(row, index);
    },
    rowDel: function(row, index) {
      var _this = this;
      this.$confirm("是否强制" + row.username + "下线?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(function() {
          return delObj(row.access_token);
        })
        .then(data => {
          _this.tableData.splice(index, 1);
          _this.$message({
            showClose: true,
            message: "删除成功",
            type: "success"
          });
        })
        .catch(function(err) {});
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

