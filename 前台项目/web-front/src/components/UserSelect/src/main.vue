
<template>
  <div>
    <el-button size="small" icon="icon-md-person-add" @click="choseUser">选择发送用户</el-button>
    <span class="clear">清空已选</span>

    <el-collapse class="collapse">
      <el-collapse-item>
        <template slot="title">
          已选择
          <span class="select-count">{{users.length}}</span>
          人
        </template>
        <p>
          <el-tag
            class="mr10"
            size="mini"
            v-for="(user,index) in users"
            :key="user.id"
            closable
            type="info"
            @close="handleCloseTag(user.id,index)"
          >{{user.name}}</el-tag>
        </p>
      </el-collapse-item>
    </el-collapse>
    <avue-drawer title="选择用户" show-close v-model="dialogVisible" :width=1000>
      <avue-crud
        :option="option"
        :page="page"
        @on-load="getList"
        :table-loading="listLoading"
        @search-change="handleFilter"
        @refresh-change="handleRefreshChange"
        :data="list"
      >
        <template slot="username" slot-scope="scope">
          <span>{{scope.row.username}}</span>
        </template>
        <template slot="role" slot-scope="scope">
          <span v-for="(role,index) in scope.row.roleList" :key="index">
            <el-tag>{{role.roleName}}</el-tag>&nbsp;&nbsp;
          </span>
        </template>
        <template slot="deptId" slot-scope="scope">{{scope.row.deptName}}</template>
        <template slot="lockFlag" slot-scope="scope">
          <el-tag>{{scope.label}}</el-tag>
        </template>

        <template slot="menu" slot-scope="scope">
            <el-button 
                         size="small"
                         type="primary"
                         @click="handleAdd(scope.row,scope.index)">添加该用户
              </el-button>
        </template>
      </avue-crud>
    </avue-drawer>
  </div>
</template>


<script>
import { fetchList } from "@/api/admin/user";
import { tableOption } from "@/const/crud/admin/user";
import _ from 'lodash';

export default {
  name: "AvueUserSelect",
  data() {
    return {
      size: 0,
      dialogVisible: false,
      page: {
        total: 0, // 总页数
        currentPage: 1, // 当前页数
        pageSize: 20, // 每页显示多少条,
        isAsc: false //是否倒序
      },
      option: tableOption,
      list: [],
      listLoading: false,
      users:[],
      userIds:[]
    };
  },
   props: {
    value: {
      type: Array,
      default: ()=>{
        return [];
      }
    }
  },
  watch: {
    value(){
      this.userIds = this.value;
    }
  },
  created() {
    this.getList(this.page);
  },
  methods: {
    getList(page, params) {
      this.listLoading = true;
      fetchList(
        Object.assign(
          {
            current: page.currentPage,
            size: page.pageSize
          },
          params
        )
      ).then(response => {
        this.list = response.data.data.records;
        this.page.total = response.data.data.total;
        this.listLoading = false;
      });
    },
    handleFilter(param) {
      this.page.page = 1;
      this.getList(this.page, param);
    },
    handleRefreshChange() {
      this.getList(this.page);
    },
    choseUser() {
      this.dialogVisible = true;
    },
    handleAdd(item,index){
      const result = _.some(this.users,{id:item.userId,name:item.username});
      if(result){
        this.$message.warning("已经添加过啦,请勿重复选择")
        return;
      }
      this.users.push({
        id:item.userId,
        name:item.username
      })

      this.userIds.push(item.userId);
      this.$emit("input", this.userIds);
      this.$emit('change', this.userIds);
      this.$message.success("添加用户"+item.username+"成功");
    },
    handleCloseTag(id,index){
      this.users.splice(index,1);
      this.userIds.splice(index,1);
      this.$emit("input", this.userIds);
      this.$emit('change', this.userIds);
    }
  }
};
</script>

<style>
.clear {
  font-size: 12px;
  margin-left: 15px;
  color: #40a9ff;
  cursor: pointer;
}

.collapse {
  font-size: 12px;
  margin-top: 15px;
  width: 500px;
}
.select-count {
  font-size: 13px;
  font-weight: 600;
  color: #40a9ff;
}
.mr10 {
  margin-right: 10px;
  margin-bottom:10px;
}
</style>
