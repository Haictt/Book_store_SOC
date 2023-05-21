<template>
  <div class="cart-container">
    <div class="cart flex-row">
      <div class="col-2">
        <div class="main-cart">
          <h1 class="heading-cart">Giỏ hàng của bạn</h1>
          <div class="cart-form">
            <div class="cart-row">
              <div class="utility-row">
                <p v-if="carts?.length" class="title-number-cart">
                  Bạn đang có <strong>{{ carts.length }} sản phẩm</strong> trong
                  giỏ hàng
                </p>
                <p v-else class="title-number-cart">
                  Bạn chưa có sản phẩm nào trong giỏ hàng
                </p>
                <div>
                  <a
                    v-if="chosenCart.length"
                    @click="showDialog = true"
                    class="utility-btn pointer"
                    >Xóa</a
                  >
                  <a @click="chooseAll" class="utility-btn pointer"
                    >Chọn tất cả</a
                  >
                  <a @click="dropAll" class="utility-btn pointer">Bỏ chọn</a>
                </div>
              </div>
              <div class="table-view">
                <div class="table-cart">
                  <template v-for="cart in carts" :key="cart.id">
                    <div class="cart-item flex-row">
                      <Checkbox
                        v-model="chosenCart"
                        :inputValue="cart"
                      ></Checkbox>
                      <div class="media-left">
                        <div class="item-image">
                          <img :src="cart.book.imageUrl" alt="" />
                        </div>
                        <div class="item-remove">
                          <a
                            @click="showDialogSingle(cart.id)"
                            class="delete pointer"
                            >Xóa</a
                          >
                        </div>
                      </div>
                      <div class="media-right">
                        <div class="item-info">
                          <h3 class="item-title">
                            {{ cart.book.name }}
                          </h3>
                        </div>
                        <div class="item-price">
                          <span>{{
                            this.formatCurrency(cart.book.price)
                          }}</span>
                        </div>
                      </div>
                      <div class="media-total">
                        <span class="total-price">
                          {{
                            this.formatCurrency(cart.book.price * cart.quantity)
                          }}</span
                        >
                        <div class="qty-check">
                          <NumberInput
                            v-model="cart.quantity"
                            @onBlurEvent="
                              validateInStock(findProductById(cart.book.id))
                            "
                            Id="qty"
                            @onChangeQty="
                              onChangeQty($event, findProductById(cart.book.id))
                            "
                          ></NumberInput>
                        </div>
                      </div>
                    </div>
                  </template>
                  <!--  -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-1">
        <div class="order-summary">
          <h2 class="summary-title">Thông tin đơn hàng</h2>
          <div class="summary-total">
            <p>
              Tổng tiền:
              <span>{{ this.formatCurrency(totalMoney) || 0 }}</span>
            </p>
          </div>
          <div class="summary-action">
            <p>Phí vận chuyển sẽ được tính ở trang thanh toán.</p>
            <p>
              Chỉ áp dụng thanh toán với đoan hàng có giá trị tối thiểu
              <b>{{ this.formatCurrency(20000) }}</b>
            </p>
          </div>
          <div class="summary-button">
            <Button
              @click="navigateToCheckout"
              Type="primary"
              Additional="w-full"
              >Tới thanh toán</Button
            >
          </div>
        </div>
      </div>
    </div>

    <VDialog
      @closeDialog="closeDialog"
      :NeedCancel="true"
      @onMainAction="deleteAll"
      :Type="dialog.AllowDelete.Type"
      :ButtonText="dialog.AllowDelete.ButtonDelete"
      :Title="dialog.AllowDelete.Title"
      v-if="showDialog"
      For="error"
    >
      <template v-slot:before>{{ dialog.AllowDelete.ContentBefore }}</template>
      <template v-slot:content>
        {{ chosenCart.length }} {{ dialog.AllowDelete.ContentMid }}
      </template>
      <template v-slot:after>{{ dialog.AllowDelete.ContentAfter }}</template>
    </VDialog>
    <VDialog
      @closeDialog="closeDialog"
      :NeedCancel="true"
      @onMainAction="deleteSingle(dialogId)"
      :Type="dialog.AllowDelete.Type"
      :ButtonText="dialog.AllowDelete.ButtonDelete"
      :Title="dialog.AllowDelete.Title"
      v-if="dialogId"
      For="error"
    >
      <template v-slot:before>{{ dialog.AllowDelete.ContentBefore }}</template>
      <template v-slot:content> sản phẩm </template>
      <template v-slot:after>{{ dialog.AllowDelete.ContentAfter }}</template>
    </VDialog>
  </div>
</template>

<script>
import Dialog from "../../js/locale/VN/dialog.js";
import VDialog from "../../components/VDialog.vue";
export default {
  name: "cart",
  props: [],
  components: {
    VDialog,
  },
  data() {
    return {
      dialog: Dialog,
      carts: null,
      isLoading: false,
      instock: 999,
      config: {
        headers: {
          Authorization: "Bearer " + this.$cookies.get("myCookie"),
        },
      },
      chosenCart: [],
      showDialog: false,
      dialogId: false,
    };
  },
  watch: {
    carts: {
      handler(newVal, oldVal) {
        // iterate over the cart array and log the new and old qty values
        newVal.forEach((item, index) => {
          if (item.quantity) item.quantity = parseInt(item.quantity);
        });
        console.log(newVal);
        this.carts.forEach((cart) => {
          this.$axios.put(this.$API.updateCart, cart, this.config);
        });
      },
      deep: true,
    },
  },
  created() {
    this.initData();
  },
  mounted() {},
  beforeUnmount() {},
  computed: {
    totalMoney() {
      if (this.chosenCart) {
        let res = 0;
        this.chosenCart.forEach((cart) => {
          res += cart.quantity * cart.book.price;
          console.log(res);
        });
        return res;
      }
    },
  },
  methods: {
    initData() {
      this.isLoading = true;
      this.$axios.get(this.$API.getAllCart, this.config).then((res) => {
        this.isLoading = false;
        this.carts = res.data;
        this.chosenCart = [];
      });
    },
    validateInStock(product) {
      if (!product.quantity) {
        product.quantity = 1;
      }
      if (product.quantity > this.instock) {
        product.quantity = this.instock;
      }
    },
    onChangeQty(value, product) {
      console.log(product, value);
      if (product.quantity == 1 && value == -1) {
        return;
      } else if (product.quantity == this.instock && value == 1) {
        return;
      } else product.quantity += value;
    },
    findProductById(id) {
      return this.carts.find((product) => {
        return product.book.id == id;
      });
    },
    navigateToCheckout() {
      if (this.chosenCart.length) {
        console.log(this.chosenCart, this.totalMoney);
        this.$router.push("/checkout");
        this.$cookies.set("cartCookie", JSON.stringify(this.chosenCart));
      } else alert("Ban chua chon mat hang nao");
    },
    chooseAll() {
      if (this.carts) this.chosenCart = this.carts;
    },
    dropAll() {
      if (this.chosenCart) this.chosenCart = [];
    },
    deleteAll() {
      this.chosenCart.forEach(({ id }) => {
        this.removeCart(id);
        this.showDialog = false;
      });
    },
    deleteSingle(id) {
      this.removeCart(id);
      this.dialogId = false;
    },
    showDialogSingle(id) {
      this.dialogId = id;
    },
    removeCart(id) {
      this.$axios
        .delete(this.$API.deleteCart + `?id=${id}`, this.config)
        .then((response) => {
          this.initData();
        });
    },
    closeDialog() {
      this.showDialog = false;
      this.dialogId = false;
    },
  },
};
</script>

<style scoped>
@import url(../../css/pages/cart.css);
</style>
