const API = {
  login: "http://localhost:8080/api/auth/authenticate", // post
  register: "http://localhost:8080/api/auth/register", // post
  getAllBook: "http://localhost:8080/api/book/all", // get
  getBook: "http://localhost:8080/api/book/", // get
  getBookByName: "http://localhost:8080/api/book/name",
  searchBook: "http://localhost:8080/api/book/search",
  filterBook: "http://localhost:8080/api/book/filter", //post
  addBook: "http://localhost:8080/api/book/add",
  getUser: "http://localhost:8080/api/user",
  getAllCheckout: "http://localhost:8080/api/checkout/all",
  getCheckout: "http://localhost:8080/api/checkout/",
  postPaypal: "http://localhost:8080/api/checkout/paypal",
  getPaypal: "http://localhost:8080/api/checkout/paypal/success",
  getAllComment: "http://localhost:8080/api/comment/all",
  addComment: "http://localhost:8080/api/comment/add",
  getAllGenre: "http://localhost:8080/api/genre/all",
  getAllCart: "http://localhost:8080/api/order/all",
  getAllPurchasedCart: "http://localhost:8080/api/order/purchased",
  addCart: "http://localhost:8080/api/order/add",
  updateCart: "http://localhost:8080/api/order/update",
  deleteCart: "http://localhost:8080/api/order/delete",
};
export default API;
