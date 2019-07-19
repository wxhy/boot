<template>
  <div id="app">
    <router-view />
    <!-- 将上传组件全局注册 -->
    <global-uploader ref="panuploader"></global-uploader>
  </div>
</template>

<script>
import globalUploader from "@/components/GlobalUploader.vue";
export default {
  name: "app",
  components: {
    globalUploader
  },
  data() {
    return {};
  },
  watch: {},
  created() {},
  methods: {},
  computed: {}
};
</script>
<style lang="scss">
#app {
  width: 100%;
  height: 100%;
  overflow: hidden;
}
</style>
