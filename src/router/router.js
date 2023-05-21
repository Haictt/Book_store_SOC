import { createRouter, createWebHistory } from "vue-router";
import Home from "../views/pages/Home.vue";
import User from "../views/pages/UserDetail.vue";
import NotFound from "../views/pages/NotFound.vue";
import OrderDetail from "../views/pages/OrderDetail.vue";
import ProductDetail from "../views/pages/ProductDetail.vue";
import Cart from "../views/pages/Cart.vue";
import Checkout from "../views/pages/Checkout.vue";
import Cookies from "js-cookie";
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/home",
      name: "home",
      component: Home,
    },
    {
      path: "/login",
      name: "login",
      component: () => import("../views/pages/Login.vue"),
    },
    {
      path: "/register",
      name: "register",
      component: () => import("../views/pages/Register.vue"),
    },
    {
      path: "/product/:id",
      name: "product-detail",
      component: ProductDetail,
      props: true,
    },
    {
      path: "/cart",
      name: "cart",
      component: Cart,
      meta: { requiresAuth: true },
    },
    {
      path: "/checkout",
      name: "checkout",
      component: Checkout,
      meta: { requiresAuth: true },
    },
    {
      path: "/waiting",
      name: "waiting",
      component: () => import("../views/pages/Waiting.vue"),
      props: true,
    },
    {
      path: "/account",
      name: "account",
      component: () => import("../views/pages/Account.vue"),
      meta: { requiresAuth: true },
      children: [
        {
          path: "userDetail",
          name: "user-detail",
          component: User,
          meta: { requiresAuth: true },
        },
        {
          path: "order",
          name: "order",
          component: () => import("../views/pages/Order.vue"),
          meta: { requiresAuth: true },
        },
        {
          path: "order/:id",
          name: "orderDetail",
          component: OrderDetail,
          props: true,
          meta: { requiresAuth: true },
        },
      ],
    },
    {
      path: "/",
      redirect: {
        name: "home",
      },
    },
    {
      path: "/:pathMatch(.*)*",
      component: NotFound,
      name: "not-found",
      meta: {
        fullPage: true,
      },
    },
  ],
});
router.beforeEach((to, from, next) => {
  const isAuthenticated = !!Cookies.get("myCookie"); // Implement your own logic to check if the user is authenticated

  if (to.meta.requiresAuth && !isAuthenticated) {
    next("/login"); // Redirect to login page if the route requires authentication but the user is not authenticated
  } else {
    next(); // Proceed to the next route
  }
});
export default router;
