export default {
  methods: {
    formatCurrency(value) {
      if (value) {
        return value.toLocaleString("vi-VN", {
          style: "currency",
          currency: "VND",
        });
      }
    },
    formatUsd(value) {
      if (value) {
        return value.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
        });
      }
    },
    toUsd(value) {
      const exchangeRate = 0.000043;
      const convertedAmount = value * exchangeRate;
      return convertedAmount.toFixed(2);
    },
    updateCart(carts, book, qty, config) {
      let isDuplicatedCart = carts.some((cart) => {
        return cart.book.id == book.id;
      });
      if (isDuplicatedCart) {
        carts.find((cart) => {
          return cart.book.id == book.id;
        }).quantity += qty;
        carts.forEach((cart) => {
          this.$axios.put(this.$API.updateCart, cart, config);
        });
      } else {
        this.$axios.post(
          this.$API.addCart,
          { quantity: qty, bookId: book.id },
          config
        );
      }
      this.$axios
        .get(this.$API.getAllCart, {
          headers: {
            Authorization: "Bearer " + this.$cookies.get("myCookie"),
          },
        })
        .then((res) => {
          return res.data;
        });
    },
  },
};
