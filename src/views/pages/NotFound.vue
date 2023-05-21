<template>
  <div class="notfound flex-column">
    Không tìm thấy trang
    <div @click="navigateBack" class="back pointer">Về trang chủ</div>
  </div>
</template>

<script>
export default {
  name: "notfound",
  emits: [],
  props: [],
  data() {
    return {};
  },
  methods: {
    navigateBack() {
      this.$router.replace("/");
    },
  },
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
.back {
  margin-top: 20px;
  text-decoration: underline;
  color: rgb(88, 88, 88);
}
</style>
