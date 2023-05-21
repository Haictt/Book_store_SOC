<template>
  <div class="product-view">
    <div class="product-essential flex-row">
      <div class="product-media flex-column">
        <div class="product-image relative flex-row">
          <img :src="book?.imageUrl" alt="" />
        </div>
      </div>
      <div class="product-detail flex-column">
        <h1 class="name">
          {{ book?.name }}
        </h1>
        <h3 class="author">Tác giả: {{ book?.author }}</h3>
        <h3 class="publisher">Nhà xuất bản: {{ book?.publisher }}</h3>
        <h3 class="genre">Thể loại: {{ book?.genre.name }}</h3>
        <p class="price">{{ this.formatCurrency(book?.price) }}</p>
        <div class="quantity">
          <div class="quantity-box flex-row">
            <label for="qty">Số lượng:</label>
            <NumberInput
              v-model="qty"
              @onBlurEvent="validateInStock"
              @onChangeQty="onChangeQty"
              Id="qty"
            ></NumberInput>
          </div>
        </div>

        <div class="product-action flex-row">
          <Button @click.stop="addItemToCart(book, qty)" Type="primary"
            >Thêm vào giỏ hàng</Button
          >
        </div>
      </div>
    </div>
    <div class="comment-section flex-column">
      <div class="comment-header">Bình luận</div>
      <div class="flex-row no-comment" v-if="!this.$cookies.get('myCookie')">
        Bạn phải đăng nhập để mở tính năng bình luận
      </div>
      <template v-else>
        <div class="user-detail">
          <div class="avatar-wrapper">
            <div class="avatar"></div>
          </div>
          <div class="text-wrapper">
            <Textarea v-model="commentField"></Textarea>
          </div>
          <div class="button-wrapper">
            <Button @click="postComment" Type="primary">Gửi</Button>
          </div>
        </div>
        <div class="comment-input flex-column">
          <template v-for="comment in comments">
            <div class="comment-field">
              <div class="field-header flex-row">
                <h1 class="comment-name">{{ comment.name }}</h1>
                <div class="dot"></div>
                <p class="comment-date">{{ comment.creatAt }}</p>
              </div>
              <div class="field-content">
                <p>
                  {{ comment.content }}
                </p>
              </div>
            </div>
          </template>
        </div>
      </template>
    </div>
  </div>
</template>

<script>
export default {
  name: "product-detail",
  props: ["id"],
  data() {
    return {
      book: null,
      instock: 999,
      qty: 1,
      carts: null,
      config: {
        headers: {
          Authorization: "Bearer " + this.$cookies.get("myCookie"),
        },
      },
      comments: null,
      commentField: "",
    };
  },
  methods: {
    validateInStock() {
      if (!this.qty) {
        this.qty = 1;
      }
      if (this.qty > this.instock) {
        this.qty = this.instock;
      }
    },
    onChangeQty(value) {
      if (this.qty == 1 && value == -1) {
        return;
      } else if (this.qty == this.instock && value == 1) {
        return;
      } else this.qty += value;
    },
    addItemToCart(book, quantity) {
      if (this.$cookies.get("myCookie")) {
        console.log(book);
        this.updateCart(this.carts, book, quantity, this.config);
        this.loadCart();
        this.$tinyemit.emit("showToast", "Add");
      } else this.$router.push("/login");
    },
    loadCart() {
      if (this.$cookies.get("myCookie")) {
        this.$axios.get(this.$API.getAllCart, this.config).then((res) => {
          this.isLoading = false;
          this.carts = res.data;
          console.log(this.carts);
        });
      }
    },
    loadComment() {
      if (this.$cookies.get("myCookie")) {
        this.$axios
          .post(this.$API.getAllComment, { bookId: this.id }, this.config)
          .then((res) => {
            this.commentField = "";
            this.comments = res.data.reverse();
          });
      }
    },
    postComment() {
      if (this.$cookies.get("myCookie")) {
        if (this.commentField.length) {
          this.$axios
            .post(
              this.$API.addComment,
              { bookId: this.id, content: this.commentField },
              this.config
            )
            .then((res) => {
              this.loadComment();
              this.$tinyemit.emit("showToast", "Post");
            });
        } else {
          alert("Nhap binh luan");
        }
      }
    },
  },
  created() {
    this.$axios.get(this.$API.getBook + this.id).then((res) => {
      console.log(res.data);
      this.book = res.data;
    });
    if (this.$cookies.get("myCookie")) {
      this.$axios.get(this.$API.getAllCart, this.config).then((res) => {
        this.isLoading = false;
        this.carts = res.data;
      });
    }
  },
  mounted() {
    this.loadComment();
  },
  watch: {
    qty: {
      handler(newVal) {
        if (newVal) this.qty = parseInt(this.qty);
      },
    },
  },
};
</script>

<style scoped>
@import url(../../css/pages/productDetail.css);
</style>
