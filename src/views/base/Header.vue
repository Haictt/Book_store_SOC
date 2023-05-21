<template>
  <div class="main-nav">
    <div class="nav-container flex-row">
      <div class="top-nav-left flex-row">
        <div id="launcher" class="pointer flex-center"></div>
        <div class="logo-content flex-row">
          <!-- <a href="" class="nav-logo"></a> -->
          <RouterLink class="logo-title" to="/home">Trang chủ</RouterLink>
        </div>
      </div>
      <div class="flex flex1"></div>
      <div class="top-nav-right flex-row">
        <RouterLink class="notify right-btn pointer" to="/cart"></RouterLink>

        <RouterLink class="user pointer" to="/account/order">
          <div class="user-avatar">
            <img
              class="avatar"
              src="https://id.misa.vn/image/getavatar?userId=74c75e29-bc30-4210-87e2-d61a38f91a21&width=64&height=64"
              alt=""
            />
          </div>
        </RouterLink>
      </div>
    </div>
  </div>
</template>

<script>
import { RouterLink } from "vue-router";
export default {
  name: "heder",
  emits: [],
  props: [],
  data() {
    return {};
  },
  methods: {
    navigateToUser() {
      this.$router.push("/account/order");
    },
    navigateToCart() {
      this.$router.push("/cart");
    },
  },
};
</script>

<style scoped>
@import url(../../css/base/header.css);
</style>
