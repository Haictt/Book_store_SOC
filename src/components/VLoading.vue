<template>
  <div class="loading">
    <div class="loading-wrapper">
      <div class="icon-loading"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Loading",
};
</script>

<style scoped>
.loading {
  position: absolute;
  display: grid;
  width: 100%;
  height: 100%;
  min-height: 100px;
  place-items: center;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(255, 255, 255, 0.5);
  z-index: 1000000;
}

.loading-wrapper {
  width: 100px;
  height: 100px;
  background: transparent url(../assets/imgs/Double-Ring-1s-100px.svg);
}
</style>
