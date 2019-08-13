

<template>
  <div class="execution">
    <basic-container>
      <avue-crud
        ref="crud"
        :page="page"
        :data="tableData"
        :table-loading="tableLoading"
        :option="tableOption"
        @on-load="getList"
        @refresh-change="refreshChange"
        @row-update="handleUpdate"
        @row-save="handleSave"
        @search-change="searchChange"
        @row-del="rowDel"
      >
        <template slot-scope="scope" slot="menu">
          <el-button
            type="text"
            v-if="permissions.sys_dict_edit"
            icon="el-icon-check"
            size="small"
            @click="handleEdit(scope.row,scope.index)"
          >编辑</el-button>
          <el-button
            type="text"
            v-if="permissions.sys_dict_del"
            icon="el-icon-delete"
            size="small"
            @click="handleDel(scope.row,scope.index)"
          >删除</el-button>
          <el-button
            type="text"
            icon="el-icon-menu"
            size="small"
            @click="handlItem(scope.row,scope.index)"
          >字典项</el-button>
        </template>
      </avue-crud>
    </basic-container>

    <el-dialog title="字典项管理" :visible.sync="itemVisible" width="90%">
      <avue-crud
        ref="crud_item"
        :data="dictItems"
        :table-loading="itemLoading"
        :option="dictItemOption"
        @on-load="getItemList"
        @row-update="handleItemUpdate"
        @row-save="handleItemSave"
        @row-del="rowItemDel"
        @refresh-change="refreshItemChange"
      >
        <template slot-scope="scope" slot="typeForm">
            <avue-input :disabled="scope.disabled" :label="scope.column.label" v-model="dictItem.type"></avue-input>
        </template>

        <template slot-scope="scope" slot="menu">
          <el-button
            type="text"
            v-if="permissions.sys_dict_edit"
            icon="el-icon-check"
            size="samll"
            plain
            @click="handleItemEdit(scope.row,scope.index)"
          >编辑</el-button>
          <el-button
            type="text"
            v-if="permissions.sys_dict_del"
            icon="el-icon-delete"
            size="samll"
            plain
            @click="handleItemDel(scope.row,scope.index)"
          >删除</el-button>
        </template>
      </avue-crud>
    </el-dialog>
  </div>
</template>

<script>
import { addObj, delObj, fetchList, putObj } from "@/api/admin/dict";
import { addItem, delItem, fetchItemList, putItem } from "@/api/admin/dictItem";
import { tableOption, dictItemOption } from "@/const/crud/admin/dict";
import { mapGetters } from "vuex";

export default {
  name: "dict",
  data() {
    return {
      tableData: [],
      dictItem: {},
      dictItems: [],
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20 // 每页显示多少条
      },
      tableLoading: false,
      itemLoading: false,
      itemVisible: false,
      tableOption: tableOption,
      dictItemOption: dictItemOption
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
    handleEdit(row, index) {
      this.$refs.crud.rowEdit(row, index);
    },
    handleDel(row, index) {
      this.$refs.crud.rowDel(row, index);
    },
    rowDel: function(row, index) {
      var _this = this;
      this.$confirm(
        '是否确认删除标签名为"' +
          row.label +
          '",数据类型为"' +
          row.type +
          '"的数据项?',
        "警告",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      )
        .then(function() {
          return delObj(row);
        })
        .then(() => {
          this.getList(this.page);
          _this.$message({
            showClose: true,
            message: "删除成功",
            type: "success"
          });
        })
        .catch(function() {});
    },
    /**
     * @title 数据更新
     * @param row 为当前的数据
     * @param index 为当前更新数据的行数
     * @param done 为表单关闭函数
     *
     **/
    handleUpdate: function(row, index, done) {
      putObj(row).then(() => {
        this.tableData.splice(index, 1, Object.assign({}, row));
        this.$message({
          showClose: true,
          message: "修改成功",
          type: "success"
        });
        this.getList(this.page);
        done();
      });
    },
    /**
     * @title 数据添加
     * @param row 为当前的数据
     * @param done 为表单关闭函数
     *
     **/
    handleSave: function(row, done) {
      addObj(row).then(data => {
        this.tableData.push(Object.assign({}, row));
        this.$message({
          showClose: true,
          message: "添加成功",
          type: "success"
        });
        this.getList(this.page);
        done();
      });
    },
    handlItem(row) {
      this.dictItem.type = row.type;
      this.dictItem.dictId = row.id;
      this.itemVisible = true;
      this.getItemList();
    },
    searchChange(form) {
      this.getList(this.page, form);
    },
    refreshChange() {
      this.getList(this.page);
    },
    handleItemEdit(row, index) {
      this.$refs.crud_item.rowEdit(row, index);
    },
    handleItemDel(row, index) {
      this.$refs.crud_item.rowDel(row, index);
    },
    getItemList() {
      this.itemLoading = true;
      fetchItemList(this.dictItem).then(response => {
        this.dictItems = response.data.data
        this.itemLoading = false
      })
    },
    rowItemDel: function(row, index) {
      var _this = this;
      this.$confirm("是否确认删除?", "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(function() {
          return delItem(row);
        })
        .then(() => {
          this.getItemList();
          _this.$message({
            showClose: true,
            message: "删除成功",
            type: "success"
          });
        })
        .catch(function() {});
    },
    /**
     * @title 数据更新
     * @param row 为当前的数据
     * @param index 为当前更新数据的行数
     * @param done 为表单关闭函数
     *
     **/
    handleItemUpdate: function(row, index, done) {
      putItem(row).then(() => {
        this.tableData.splice(index, 1, Object.assign({}, row));
        this.$message({
          showClose: true,
          message: "修改成功",
          type: "success"
        });
        this.getList(this.page);
        done();
      });
    },
    /**
     * @title 数据添加
     * @param row 为当前的数据
     * @param done 为表单关闭函数
     *
     **/
    handleItemSave: function(row, done) {
      addItem(Object.assign(row, this.dictItem)).then(data => {
        this.dictItems.push(Object.assign({}, row));
        this.$message({
          showClose: true,
          message: "添加成功",
          type: "success"
        });
        this.getItemList();
        done();
      });
    },
    refreshItemChange(){
      this.getItemList();
    }
  }
};
</script>

<style lang="scss" scoped>
</style>

