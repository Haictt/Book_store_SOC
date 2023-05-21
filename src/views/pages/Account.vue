<template>
  <div class="account">
    <div class="container">
      <div class="header">
        <h1>TÀI KHOẢN CỦA TÔI</h1>
      </div>
      <div class="body flex-row">
        <div class="sidebar col">
          <h3 class="account-title">Tài khoản</h3>
          <div class="account-list flex-column">
            <div @click="navigateToUserDetail" class="link pointer">
              Chi tiết tài khoản
            </div>
            <div @click="navigateToOrder" class="link pointer">
              Đơn hàng của bạn
            </div>
            <div @click="navigateToHome" to="/" class="link pointer">
              Đăng xuất
            </div>
          </div>
        </div>
        <div class="main-content col">
          <RouterView></RouterView>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { RouterLink, RouterView } from "vue-router";

export default {
  name: "account",
  emits: [],
  props: [],
  data() {
    return {};
  },
  methods: {
    navigateToHome() {
      this.$cookies.remove("myCookie");
      this.$router.replace("/");
    },
    navigateToOrder() {
      this.$router.push("/account/order");
    },
    navigateToUserDetail() {
      this.$router.push("/account/userDetail");
    },
  },
};
</script>

<style scoped>
@import url(../../css/pages/account.css);
</style>
