<template>
  <div class="execution">
    <basic-container>
      <avue-crud
        ref="crud"
        :data="tableData"
        :option="tableOption"
        v-model="quartz_job"
        :table-loading="tableLoading"
        :page="page"
        @on-load="getList"
        @refresh-change="refreshChange"
        @row-del="rowDel"
        @row-save="handleSave"
        @row-update="handleUpdate"
      >
        <template slot="jobStatus" slot-scope="scope">
          <el-tag type="success" size="medium">{{scope.row.$jobStatus}}</el-tag>
        </template>
        <template slot="jobExecuteStatus" slot-scope="scope">
          <el-tag
            type="success"
            size="medium"
            v-if="scope.row.$jobExecuteStatus"
          >{{scope.row.$jobExecuteStatus}}</el-tag>
        </template>
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

        <template slot="menuLeft">
          <el-button size="medium" @click="handleAdd" type="primary">新建任务</el-button>
          <el-button size="medium" @click="pauseAllJob" type="warning">暂停全部任务</el-button>
          <el-button size="medium" @click="startAllJob" type="success">启动全部任务</el-button>
          <el-button size="medium" @click="refreshAllJob" type="danger">重置全部任务</el-button>
        </template>

        <template slot-scope="scope" slot="menu">
          <el-button type="text" @click="showlogList(scope.row.jobId)" icon="el-icon-info" size="small">日志</el-button>
          <el-button
            type="text"
            @click="handleStart(scope.row,scope.index)"
            icon="el-icon-caret-right"
            size="small"
          >启动</el-button>
          <el-button
            type="text"
            @click="handlePause(scope.row,scope.index)"
            icon="el-icon-error"
            size="small"
          >暂停</el-button>
          <el-button
            type="text"
            icon="el-icon-edit"
            @click="handleEdit(scope.row,scope.index)"
            size="small"
          >修改</el-button>
          <el-button
            type="text"
            @click="handleDel(scope.row,scope.index)"
            icon="el-icon-delete"
            size="small"
          >删除</el-button>
        </template>
      </avue-crud>
    </basic-container>

    <el-dialog title="执行日志" width="90%" :visible.sync="logVisible">
      <avue-crud
        :data="logtableData"
        :option="logTableOption"
        :page="logPage"
        @on-load="getLogList"
        @refresh-change="logRefresh"
      >
        <template slot-scope="scope" slot="jobLogStatus">
          <el-tag type="success" size="medium">{{scope.row.$jobLogStatus}}</el-tag>
        </template>
          <template slot-scope="scope" slot="exceptionInfo">
           <avue-text-ellipsis :text="scope.row.exceptionInfo" :height="30" :width="150" use-tooltip placement="top">
          </avue-text-ellipsis>
        </template>
         
      </avue-crud>
    </el-dialog>
  </div>
</template>

<script>
import {
  addObj,
  putObj,
  delObj,
  jobLog,
  validJobName,
  startJob,
  pauseJob,
  refreshAll,
  startAll,
  pauseAll,
  fetchList
} from "@/api/admin/quartz";
import { tableOption, logTableOption } from "@/const/crud/admin/quartz";
import { mapGetters } from "vuex";

export default {
  name: "quartz",
  data() {
    return {
      tableData: [],
      logtableData: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      logPage: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 10 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption,
      logTableOption: logTableOption,
      logVisible: false,
      cronPopover: false,
      quartz_job: {},
      jobId: 0
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
    showlogList(id) {
      this.logVisible = true;
      this.jobId = id;
    },
    getLogList(logPage) {
      jobLog(
        Object.assign(
          {
            current: logPage.currentPage,
            size: logPage.pageSize
          },
          { jobId: this.jobId }
        )
      ).then(response => {
        this.logtableData = response.data.data.records;
        this.logPage.total = response.data.data.total;
      });
    },
    logRefresh() {
      this.getLogList(this.logPage);
    },
    handleAdd() {
      this.$refs.crud.rowAdd();
    },
    handleSave: function(row, done) {
      validJobName(row.jobName, row.jobGroup).then(data => {
        if (data.data === 1) {
          this.$message.error("任务名称和任务组联合重复");
          return;
        }
        addObj(row).then(data => {
          this.tableData.push(Object.assign({}, row));
          this.$message({
            showClose: true,
            message: "添加成功",
            type: "success"
          });
          this.refreshChange();
          done();
        });
      });
    },
    handleEdit(row, index) {
      this.$refs.crud.rowEdit(row, index);
    },
    handleUpdate: function(row, index, done) {
      validJobName(row.jobName, row.jobGroup).then(data => {
        if (data.data === 1) {
          this.$message.error("任务名称和任务组联合重复");
          return;
        }
        putObj(row).then(data => {
          this.$message({
            showClose: true,
            message: "修改成功",
            type: "success"
          });
          this.refreshChange();
          done();
        });
      });
    },
    handlePause(row, index) {
      var _this = this;
      this.$confirm(
        "即将暂停(任务名称：" + row.jobName + ")是否继续?",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      )
        .then(function() {
          return pauseJob(row.jobId);
        })
        .then(data => {
          _this.tableData.splice(index, 1, Object.assign({}, row));
          _this.$message({
            showClose: true,
            message: "暂停成功",
            type: "success"
          });
          this.refreshChange();
        })
        .catch(function(err) {});
    },
    handleDel(row, index) {
      this.$refs.crud.rowDel(row, index);
    },
    rowDel: function(row, index) {
      var _this = this;
      this.$confirm("是否确认删除" + row.jobName + "?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(function() {
          return delObj(row.jobId);
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
    handleStart(row, index) {
      startJob(row.jobId).then(data => {
        this.$message({
          showClose: true,
          message: "启动成功",
          type: "success"
        });
        this.refreshChange();
      });
    },
    startAllJob() {
      startAll().then(data => {
        this.$message({
          showClose: true,
          message: "启动成功",
          type: "success"
        });
        this.refreshChange();
      });
    },
    pauseAllJob() {
      pauseAll().then(data => {
        this.$message({
          showClose: true,
          message: "暂停成功",
          type: "success"
        });
        this.refreshChange();
      });
    },
    refreshAllJob() {
      refreshAll().then(data => {
        this.$message({
          showClose: true,
          message: "刷新成功",
          type: "success"
        });
        this.refreshChange();
      });
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

