<template>
  <div class="customer-register">
    <div class="tab-navigate flex-row">
      <h4 @click="navigateToLogin">Đăng nhập</h4>
      <h4 class="active">Đăng ký</h4>
    </div>
    <div class="tab-register">
      <div class="field name">
        <Input
          :Invalid="invalidity.name"
          v-model="form.name"
          Placeholder="Họ và tên"
          ref="name"
          Id="name"
          autofocus
          @onBlurEvent="blurEventHandler"
        ></Input>
      </div>
      <div class="field address">
        <Input
          :Invalid="invalidity.address"
          v-model="form.address"
          Placeholder="Địa chỉ"
          ref="address"
          Id="address"
          @onBlurEvent="blurEventHandler"
        ></Input>
      </div>
      <div class="field tel">
        <Input
          :Invalid="invalidity.tel"
          v-model="form.tel"
          Placeholder="Số điện thoại"
          ref="tel"
          Id="tel"
          @onBlurEvent="blurEventHandler"
        ></Input>
      </div>
      <div class="field email">
        <Input
          :Invalid="invalidity.email"
          v-model="form.email"
          Placeholder="Email"
          ref="email"
          Id="email"
          @onBlurEvent="blurEventHandler"
        ></Input>
      </div>
      <div class="field password">
        <Input
          Type="password"
          :Invalid="invalidity.pwd"
          v-model="form.pwd"
          Placeholder="Mật khẩu"
          ref="pwd"
          Id="pwd"
          @onBlurEvent="blurEventHandler"
        ></Input>
      </div>
      <div class="btn-login">
        <Button @click="handleRegister" Type="primary">Đăng ký</Button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "register",
  emits: [],
  props: [],
  data() {
    return {
      form: {
        name: "",
        address: "",
        tel: "",
        email: "",
        pwd: "",
      },
      invalidity: {
        name: false,
        address: false,
        tel: false,
        email: false,
        pwd: false,
      },
    };
  },
  watch: {
    form: {
      handler(newVal) {
        Object.keys(this.form).forEach((prop) => {
          if (!this.form[prop].length) {
            this.invalidity[prop] = true;
          } else this.invalidity[prop] = false;
        });
      },
      deep: true,
    },
  },
  methods: {
    navigateToLogin() {
      this.$router.push("/login");
    },
    handleRegister() {
      if (this.validateForm()) {
        this.$axios
          .post(this.$API.register, {
            name: this.form.name,
            email: this.form.email,
            password: this.form.pwd,
            address: this.form.address,
            telephoneNumber: this.form.tel,
          })
          .then((res) => this.navigateToLogin())
          .catch((err) => alert(err));
      }
    },
    validateForm() {
      let res = true;
      Object.keys(this.invalidity).forEach((prop) => {
        if (this.invalidity[prop] == true) {
          this.$refs[prop].focus();
          res = false;
        }
      });
      return res;
    },
    blurEventHandler(id) {
      console.log(id);
      if (!this.form[id].length) {
        this.invalidity[id] = true;
      }
    },
  },
};
</script>

<style scoped>
.customer-register {
  max-width: 620px;
  margin: 35px auto 50px;
  background: #ffffff;
  padding: 25px 30px 30px;
}
.tab-navigate {
  margin-bottom: 45px;
  align-items: center;
  justify-content: center;
}
h4 {
  padding: 0px 30px;
  font-size: 24px;
  font-weight: bold;
  cursor: pointer;
  margin: 0;
  line-height: 1.2;
  color: #cacaca;
  transition: 0.3s ease;
}
h4:hover {
  color: #000;
}
h4 + h4 {
  border-left: 2px solid gray;
}
.active {
  color: #000;
}
.tab-login {
}

.field {
  margin-bottom: 25px;
}
.btn-login {
}
.error {
  margin-bottom: 10px;
  color: #252a2b;
}
</style>
