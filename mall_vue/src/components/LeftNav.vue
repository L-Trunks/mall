<template>
  <el-col :span="4" :offset="2">
    <h5>全部分类</h5>
    <el-cascader-panel :options="options"></el-cascader-panel>
  </el-col>
</template>

<script>
export default {
  name: "leftNav",
  data() {
    return {
      options: []
    };
  }
};
</script>

<style scoped>
h5 {
  padding: 10px;
  text-align: center;
  font-size: 24px;
  font-weight: 100;
  background: #67c23a;
  color: #fff;
  transition: all 0.5s;
}
h5:hover {
  background: #4a9126;
  transition: all 0.5s;
}
</style>