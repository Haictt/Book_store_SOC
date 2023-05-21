<template>
  <div class="flex-column order-container">
    <div class="col-full">
      <p class="title-detail">Thông tin tài khoản</p>
      <h2 @click="test" class="name-account">{{ user.name }}</h2>
      <p class="email">Email: {{ user.email }}</p>
      <div class="address">
        <p>Địa chỉ: {{ user.address }}</p>
        <p>Số điện thoại: {{ user.telephoneNumber }}</p>
      </div>
    </div>
    <div class="col-full">
      <div class="order-table-wrapper">
        <div class="order-table">
          <div class="order-title">Danh sách đơn hàng</div>
          <Loading v-if="isLoading"></Loading>
          <div class="table-responsive">
            <div class="table-overflow">
              <table>
                <thead>
                  <tr>
                    <th class="text-center">Mã đơn hàng</th>
                    <th class="text-center">Ngày đặt</th>
                    <th class="text-right">Thành tiền</th>
                    <th class="text-center">Trạng thái thanh toán</th>
                  </tr>
                </thead>

                <tbody>
                  <template
                    v-for="(order, index) in orders"
                    :key="order.paymentId"
                  >
                    <tr class="odd">
                      <td
                        @click="navigateOrderDetail(order.paymentId)"
                        class="text-center pointer"
                      >
                        {{ order.paymentId }}
                      </td>
                      <td class="text-center">{{ order.createAt }}</td>
                      <td class="text-right">
                        {{ this.formatUsd(order.total) }}
                      </td>
                      <td class="text-center">
                        {{
                          order.paymentStatus == "approved"
                            ? "Đã thanh toán"
                            : "Chưa thanh toán"
                        }}
                      </td>
                    </tr>
                  </template>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "order",
  props: [],
  emits: [],
  data() {
    return {
      orders: null,
      config: {
        headers: {
          Authorization: "Bearer " + this.$cookies.get("myCookie"),
        },
      },
      isLoading: false,
      user: {},
    };
  },
  methods: {
    navigateOrderDetail(paymentId) {
      this.$router.push(`/account/order/${paymentId}`);
      this.$tinyemit.emit("orderId");
    },
    getAllOrder() {
      this.$axios
        .get(this.$API.getAllCheckout, this.config)
        .then((res) => {
          this.isLoading = false;
          this.orders = res.data;
        })
        .catch((err) => console.log(err));
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
  created() {
    this.isLoading = true;
    if (this.$cookies.get("myCookie")) {
      this.getAllOrder();
      this.getUser();
    }
  },
};
</script>

<style scoped>
@import url(../../css/pages/order.css);
</style>
