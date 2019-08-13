

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
      >
        <template slot="menuLeft">
          <el-button
            class="filter-item"
            size="small"
            @click="addPay"
            type="primary"
            icon="el-icon-plus"
          >新增</el-button>
        </template>
      </avue-crud>
    </basic-container>
  </div>
</template>

<script>
import { fetchList } from "@/api/admin/pay";
import { tableOption } from "@/const/crud/admin/pay";
import { mapGetters } from "vuex";

export default {
  name: "pay",
  data() {
    return {
      tableData: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      tableOption: tableOption
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
    addPay() {
      this.$router.push({ path: "/pay/info" });
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

