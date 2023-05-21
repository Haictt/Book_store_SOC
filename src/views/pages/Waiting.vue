<template>
  <Loading></Loading>
  <div class="notfound flex-column">Đang thanh toán...</div>
</template>

<script>
export default {
  name: "waiting",
  emits: [],
  props: ["id"],
  data() {
    return {
      config: {
        headers: {
          Authorization: "Bearer " + this.$cookies.get("myCookie"),
        },
      },
    };
  },
  mounted() {
    let a = this.$route.query;
    setTimeout(() => {
      this.$axios
        .get(
          this.$API.getPaypal +
            `?paymentId=${a.paymentId}&PayerID=${a.PayerID}`,
          this.config
        )
        .then((res) => {
          if (res.data.message == "purchase success") {
            this.$tinyemit.emit("showToast", "Success");
            window.location.href = "http://localhost:5173/account/order";
          }
        });
    }, 1500);
  },
  methods: {},
};
</script>

<style scoped>
.notfound {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  font-weight: 800;
}
</style>
