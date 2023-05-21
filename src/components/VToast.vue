<template>
  <div :class="['toast', toast[Type].icon]">
    <div class="toast-container">
      <div class="toast-container-start">
        <div
          :class="['toast-icon', 'icon-wrapper', 'icon-' + toast[Type].icon]"
        ></div>

        <div class="toast-content">
          <span class="toast-title">{{ toast[Type].title }}</span
          >{{ toast[Type].msg }}
          <span v-if="toast[Type].icon == 'error'" class="toast-action"
            >Xem hướng dẫn
          </span>
        </div>
      </div>
      <div class="toast-container-end">
        <div class="toast-icon icon-wrapper icon-quit"></div>
      </div>
    </div>
  </div>
</template>

<script>
import Toast from "../js/locale/VN/toast.js";
export default {
  name: "Toast",
  props: ["Type"],
  data() {
    return {
      toast: Toast,
    };
  },
};
</script>

<style scoped>
@import url(../css/components/toast.css);
</style>
