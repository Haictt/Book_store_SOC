<template>
  <div class="main-right">
    <div class="main-view relative">
      <RouterView></RouterView>
    </div>
  </div>
  <teleport to="body">
    <Toast v-if="isShowToast == true" :Type="toastType"></Toast>
  </teleport>
</template>

<script>
import { RouterView } from "vue-router";
export default {
  name: "main",
  emits: [],
  props: [],
  data() {
    return {
      isShowToast: false,
      toastType: "Add",
    };
  },
  created() {
    this.$tinyemit.on("showToast", (type) => {
      this.isShowToast = false;
      this.toastType = type;
      this.isShowToast = true;
      setTimeout(() => {
        this.isShowToast = false;
      }, 1000);
    });
  },
};
</script>

<style scoped>
@import url(../../css/base/main.css);
</style>
