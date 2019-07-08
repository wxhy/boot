<template>
  <div>
    <div v-html="result.data"></div>
    <div v-html="result.message"></div>
  </div>
</template>


<script>
import { notify } from "@/api/admin/pay";
export default {
  data() {
    return {
      result: {}
    };
  },
  mounted: function() {
    notify(this.$route.query).then(result => {
      this.result = result.data;
      console.log(this.result)
    });
    console.log(this.$route.query);
  }
};
</script>
