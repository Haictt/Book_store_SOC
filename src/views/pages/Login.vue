<template>
  <div class="customer-login">
    <div class="tab-navigate flex-row">
      <h4 class="active">Đăng nhập</h4>
      <h4 @click="navigateToRegister">Đăng ký</h4>
    </div>
    <div class="tab-login">
      <div v-if="error" class="error">Sai tài khoản hoặc mật khẩu</div>
      <div class="field email">
        <Input Placeholder="Email" v-model="user.email"></Input>
      </div>
      <div class="field password">
        <Input Type="password" Placeholder="Mật khẩu" v-model="user.password"></Input>
      </div>
      <div class="btn-login">
        <Button @click="handleLogin" Type="primary">Đăng nhập</Button>
      </div>
      <a class="google" href="http://localhost:8080/oauth2/authorization/google"
        >Google</a
      >
    </div>
  </div>
</template>

<script>
export default {
  name: "login",
  emits: [],
  props: [],
  data() {
    return {
      user: {
        email: "",
        password: "",
      },
      error: false,
      config: { headers: { "Access-Control-Allow-Origin": "*" } },
    };
  },
  methods: {
    navigateToRegister() {
      this.$router.push("/register");
    },
    navigateToHome() {
      this.$router.replace("/home");
    },
    handleLogin() {
      this.$axios
        .post("http://localhost:8080/api/auth/authenticate", this.user)
        .then((res) => {
          let expirationDate = new Date();
          expirationDate.setTime(expirationDate.getTime() + 60 * 60 * 1000);
          this.$cookies.set("myCookie", res.data.token, {
            expires: expirationDate,
          });
          this.navigateToHome();
        })
        .catch((err) => (this.error = true));
    },
  },
};
</script>

<style scoped>
@import url(../../css/pages/login.css);
</style>
