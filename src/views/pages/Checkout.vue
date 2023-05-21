<template>
  <div class="checkout-container flex-row flex1">
    <div class="main flex-column">
      <div class="main-header">
        <h1 class="logo">Hoàn tất thanh toán</h1>
        <p @click="backToCart" class="back pointer">Trở về giỏ hàng</p>
      </div>
      <div class="main-content">
        <div class="step">
          <div class="section-header">
            <h2 class="section-title">Thông tin giao hàng</h2>
          </div>
          <div class="section-content">
            <div class="current-logged-in">
              <div class="avatar-wrapper">
                <div class="avatar"></div>
              </div>
              <p class="info">{{ user.name }} ({{ user.email }})</p>
              <div class="input-field">
                <div class="fieldset">
                  <Input
                    :Invalid="invalidity.name"
                    v-model="user.name"
                    Disable="true"
                    Placeholder="Họ và tên"
                    ref="name"
                    Id="name"
                    @onBlurEvent="blurEventHandler"
                  ></Input>
                </div>
                <div class="fieldset">
                  <Input
                    :Invalid="invalidity.address"
                    v-model="user.address"
                    Placeholder="Địa chỉ"
                    ref="address"
                    Id="address"
                    @onBlurEvent="blurEventHandler"
                    autofocus
                  ></Input>
                </div>
                <div class="fieldset">
                  <Input
                    :Invalid="invalidity.telephoneNumber"
                    v-model="user.telephoneNumber"
                    Placeholder="Số điện thoại"
                    ref="telephoneNumber"
                    Id="telephoneNumber"
                    @onBlurEvent="blurEventHandler"
                  ></Input>
                </div>
              </div>
            </div>
          </div>
          <div class="section-payment-method">
            <div class="section-header">
              <h2 class="section-title">Phương thức thanh toán</h2>
            </div>
            <div class="section-content">
              <div class="content-box">
                <div class="radio-wrapper">
                  <label class="radio-label" for="paypal">
                    <div class="">
                      <label for="" class="radio">
                        <input
                          type="radio"
                          name="used"
                          id="paypal"
                          class=""
                          tabindex=""
                          checked
                          value="paypal"
                          v-model="paymentMethod"
                        />
                        <span class="radio-checkmark"></span>
                      </label>
                    </div>
                    <div class="input-content">
                      <span class="input-title">Thanh toán bang paypal</span>
                    </div>
                  </label>
                </div>
                <div class="radio-wrapper">
                  <label class="radio-label" for="cod">
                    <div class="">
                      <label for="" class="radio">
                        <input
                          type="radio"
                          name="used"
                          id="cod"
                          class=""
                          tabindex=""
                          value="cod"
                          v-model="paymentMethod"
                        />
                        <span class="radio-checkmark"></span>
                      </label>
                    </div>
                    <div class="input-content">
                      <span class="input-title">Thanh toán khi nhận hàng </span>
                    </div>
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="side">
      <div class="side-content">
        <div class="order-summary">
          <div class="total-money">
            <table>
              <thead></thead>
              <tbody>
                <tr class="subtotal">
                  <td class="sub-name">Tạm tính</td>
                  <td class="sub-price">
                    {{ this.formatCurrency(totalMoney) || 0 }}
                  </td>
                </tr>
                <tr class="shipping">
                  <td class="shipping-name">Phí vận chuyển</td>
                  <td class="shipping-price">
                    {{ this.formatCurrency(20000) }}
                  </td>
                </tr>
              </tbody>
              <tfoot>
                <tr class="total-line">
                  <td class="total-name">
                    <span class="total-line-label">Tổng cộng</span>
                  </td>
                  <td class="total-price">
                    <span class="total-line-price">{{
                      this.formatCurrency(totalMoney + 20000)
                    }}</span>
                  </td>
                </tr>
                <tr class="total-line">
                  <td class="total-name">
                    <span class="total-line-label">Quy đổi</span>
                  </td>
                  <td class="total-price">
                    <span class="total-line-price">{{
                      this.formatUsd(parseFloat(this.toUsd(totalMoney + 20000)))
                    }}</span>
                  </td>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
      <div class="side-footer">
        <Button @click="handleCheckout" Type="primary"
          >Hoàn tất đơn hàng</Button
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "checkout",
  emits: [],
  props: [],
  data() {
    return {
      form: {
        name: "",
        address: "",
        telephoneNumber: "",
      },
      invalidity: {
        name: false,
        address: false,
        telephoneNumber: false,
      },
      paymentMethod: "paypal",
      config: {
        headers: {
          Authorization: "Bearer " + this.$cookies.get("myCookie"),
        },
      },
      carts: null,
      user: {},
    };
  },
  watch: {
    user: {
      handler(newVal) {
        Object.keys(this.user).forEach((prop) => {
          if (!this.user[prop].length) {
            this.invalidity[prop] = true;
          } else this.invalidity[prop] = false;
        });
      },
      deep: true,
    },
  },
  mounted() {
    console.log("check");
    this.carts = JSON.parse(this.$cookies.get("cartCookie"));
    this.getUser();
  },
  beforeUnmount() {},
  computed: {
    totalMoney() {
      if (this.carts) {
        let res = 0;
        this.carts.forEach((cart) => {
          res += cart.quantity * cart.book.price;
          console.log(res);
        });
        return res;
      }
    },
  },
  methods: {
    backToCart() {
      this.$router.back();
    },
    validateForm() {
      let res = true;
      let invalid = Object.keys(this.invalidity).find((prop) => {
        return this.invalidity[prop] == true;
      });
      if (invalid) {
        this.$refs[invalid].focus();
        res = false;
      }
      return res;
    },
    blurEventHandler(id) {
      console.log(id);
      if (!this.user[id].length) {
        this.invalidity[id] = true;
      }
    },
    handleCheckout() {
      if (this.validateForm()) {
        let ids = this.carts.map((cart) => cart.id);
        this.$axios
          .post(
            this.$API.postPaypal,
            {
              orderIds: ids,
              total: this.toUsd(this.totalMoney),
              cancelUrl: "http://localhost:5173/cart",
              returnUrl: "http://localhost:5173/waiting",
            },
            this.config
          )
          .then((res) => {
            let data = res.data;
            window.location.href = data[1].href;
            console.log(link);
          });
      }
    },
    getUser() {
      this.$axios
        .post(
          this.$API.getUser,
          { token: this.$cookies.get("myCookie") },
          this.config
        )
        .then((res) => {
          this.user = res.data;
        });
    },
  },
};
</script>

<style scoped>
@import url(../../css/pages/checkout.css);
</style>
