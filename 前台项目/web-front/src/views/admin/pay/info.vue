<template>
  <div>
    <basic-container>
      <el-card class="box-card" style="padding:10px;">
        <div slot="header" class="clearfix">
          <span>确认订单</span>
        </div>
        <div style="width:600px;margin:0px auto;">
          <el-form :model="obj" label-position="right" label-width="80px">
            <el-form-item label="商品名称">
              <el-input v-model="obj.name"></el-input>
            </el-form-item>
            <el-form-item label="金额">
              <el-input v-model="obj.money"></el-input>
            </el-form-item>
            <el-form-item label="商品描述">
              <el-input v-model="obj.remark"></el-input>
            </el-form-item>

            <el-form-item size="large">
             <el-button type="primary"  @click="onSubmit">立即支付</el-button>
            </el-form-item>
          </el-form>
        </div>
        
      </el-card>
    </basic-container>
  </div>
</template>


<script>
import { addObj } from "@/api/admin/pay";
export default {
  data() {
    return {
      obj: {}
    };
  },
  methods: {
    onSubmit() {
      addObj(this.obj).then(res => {
        const div = document.createElement("div");
        console.log(res);
        div.innerHTML = res.data; //此处form就是后台返回接收到的数据
        document.body.appendChild(div);
        document.forms.punchout_form.submit();
      });
    }
  }
};
</script>
