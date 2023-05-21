<template>
  <div class="order-detail-title">
    <h3 class="order-name">
      Đơn hàng: {{ id }}
      <span class="order-date"> Đặt lúc - {{ date }}</span>
    </h3>
  </div>
  <div class="flex-column full-container">
    <div class="col-full">
      <p
        @click="navigateToOrder"
        style="opacity: 0.7; text-decoration: underline"
        class="pointer"
      >
        Quay lại tài khoản
      </p>
    </div>
    <div class="col-full">
      <div class="order-detail-table-wrapper">
        <div class="order-detail-table-bg">
          <p class="title-detail">Chi tiết đơn hàng</p>
          <Loading v-if="isLoading"></Loading>
          <div class="table-responsive">
            <div class="table-overflow">
              <table id="order-detail">
                <thead>
                  <tr>
                    <th class></th>
                    <th class>Sản phẩm</th>
                    <th class="text-center">Mã sản phẩm</th>
                    <th class="text-center">Đơn giá</th>
                    <th class="text-center">Số lượng</th>
                    <th class="text-right">Thành tiền</th>
                  </tr>
                </thead>
                <tbody>
                  <template
                    v-for="orderDetail in orderDetails"
                    :key="orderDetail.id"
                  >
                    <tr>
                      <td class="order-image pointer">
                        <img
                          :src="orderDetail.book.imageUrl"
                          alt=""
                          @click="navigateProductDetail(orderDetail.book.id)"
                        />
                      </td>
                      <td class="name pointer">
                        <p @click="navigateProductDetail(orderDetail.book.id)">
                          {{ orderDetail.book.name }}
                        </p>
                      </td>
                      <td class="sku text-center">{{ orderDetail.book.id }}</td>
                      <td class="money text-center">
                        {{ this.formatCurrency(orderDetail.book.price) }}
                      </td>
                      <td class="quantity text-center">
                        {{ orderDetail.quantity }}
                      </td>
                      <td class="total-money text-right">
                        {{
                          this.formatCurrency(
                            orderDetail.quantity * orderDetail.book.price
                          )
                        }}
                      </td>
                    </tr>
                  </template>
                </tbody>
              </table>
            </div>
          </div>
          <div class="table-ordership-wrapper">
            <table class="table-customer-summary">
              <tbody>
                <tr class="order-summary">
                  <td class="text-left" colspan="4">
                    <b>Giá sản phẩm</b>
                  </td>
                  <td class="total-money text-right">
                    <b>{{ this.formatCurrency(totalMoney) }}</b>
                  </td>
                </tr>
                <tr class="order-summary">
                  <td class="text-left" colspan="4">
                    <b>Phí ship, dịch vụ</b>
                  </td>
                  <td class="total-money text-right">
                    <b>{{ this.formatCurrency(20000) }}</b>
                  </td>
                </tr>
                <tr class="order-summary order-total">
                  <td class="text-left" colspan="4">
                    <b>Tổng tiền</b>
                  </td>
                  <td class="total-money text-right">
                    <b>{{ this.formatCurrency(totalMoney + 20000) }}</b>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "orderDetail",
  props: ["id"],
  data() {
    return {
      orderDetails: null,
      date: null,
      config: {
        headers: {
          Authorization: "Bearer " + this.$cookies.get("myCookie"),
        },
      },
      isLoading: false,
    };
  },
  mounted() {
    this.$axios.get(this.$API.getCheckout + ``);
  },
  computed: {
    totalMoney() {
      if (this.orderDetails) {
        let res = 0;
        this.orderDetails.forEach((orderDetail) => {
          res += orderDetail.quantity * orderDetail.book.price;
          console.log(res);
        });
        return res;
      }
    },
  },
  methods: {
    navigateToOrder() {
      this.$router.replace("/account/order");
    },
    navigateProductDetail(id) {
      this.$router.push(`/product/${id}`);
    },
  },
  created() {
    this.isLoading = true;
    this.$axios
      .get(`http://localhost:8080/api/checkout/${this.id}`, this.config)
      .then((res) => {
        this.isLoading = false;
        this.orderDetails = res.data.orders;
        this.date = res.data.date;
        console.log(this.orderDetails);
      })
      .catch((err) => console.log(err));
    // this.$tinyemit.on("orderId", (paymentId) => {
    //   this.getOrder(paymentId);
    // });
  },
};
</script>

<style scoped>
@import url(../../css/pages/orderDetail.css);
</style>
