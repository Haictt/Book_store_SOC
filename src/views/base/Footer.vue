<template>
  <footer class="footer">
    <div class="footer-container">
      <div class="container-fluid flex-row">
        <div class="col-3">
          <h4 class="title-footer">Liên kết</h4>
          <div class="content-footer">
            <ul class="footer-link">
              <li>Về chúng tôi</li>
              <li>Chính sách và điều khoản</li>
            </ul>
          </div>
        </div>
        <div class="col-3"></div>
      </div>
      <div class="copy-right"></div>
    </div>
  </footer>
</template>

<script>
export default {
  name: "Footer",
};
</script>

<style scoped>
.footer {
  background: #2a2a2a;
  line-height: 1.6;
  height: 20vh;
}
.footer-container {
  display: block;
  padding: 30px 0 0;
  color: #aaaaaa;
}
.container-fluid {
  max-width: 1400px;
  width: 100%;
  padding-right: 15px;
  padding-left: 15px;
  flex-wrap: wrap;
  margin-right: -15px;
  margin-left: -15px;
}
.title-footer {
  position: relative;
  font-weight: 700;
  font-size: 18px;
  padding-bottom: 12px;
  color: #fff;
  margin: 0px;
  padding: 15px 0;
}
li {
  padding-left: 15px;
  position: relative;
}
li::before {
  content: "";
  width: 4px;
  height: 4px;
  background: #aaaaaa;
  left: 0;
  opacity: 1;
  position: absolute;
  top: 0;
  border-radius: 50%;
  bottom: 0;
  margin: auto;
}
</style>
