<template>
  <el-container style="padding-left:10px">

      <!-- <el-aside>
        <PanLeft></PanLeft>
      </el-aside> -->
      <el-main>
        <PanRight></PanRight>
      </el-main>
  </el-container>
</template>

<script>
import PanLeft from "./panLeft";
import PanRight from "./panRight";
export default {
  name: "pan",
  components: {
    PanLeft,
    PanRight
  },
  data() {
    return {};
  }
};
</script>