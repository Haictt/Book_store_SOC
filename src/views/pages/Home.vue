<template>
  <div class="home">
    <div class="home-container">
      <div class="home-flex flex-row">
        <div class="home-col-left">
          <div class="filter-wrapper">
            <Filter></Filter>
          </div>
        </div>
        <div class="home-col-right">
          <div class="collection-header-wrapper">
            <div class="collection-header flex-row">
              <div class="title-box">
                <Search
                  Placeholder="Tìm kiếm"
                  v-model="searchField"
                  @search="handleSearch"
                  @keyup.enter="handleSearch"
                ></Search>
              </div>
              <div class="sort-box">
                <Dropdown
                  :Content="sortBox"
                  v-model="sort"
                  @chooseItem="chosenItem('sort', $event)"
                ></Dropdown>
              </div>
            </div>
          </div>
          <Loading v-if="isLoading"></Loading>
          <div class="collection-wrapper">
            <div
              v-for="book in paginatedData(sortedRow)"
              :key="book.id"
              class="home-item"
            >
              <div
                @click="navigateProductDetail(book.id)"
                class="item-image pointer"
              >
                <img :src="book.imageUrl" alt="" />
              </div>
              <div
                @click="navigateProductDetail(book.id)"
                class="item-name pointer"
              >
                {{ book.name }}
              </div>
              <div class="item-price relative">
                {{ this.formatCurrency(book.price) }}
              </div>
              <div class="item-btn">
                <Button @click.stop="addItemToCart(book, 1)" Type="primary">
                  Thêm vào giỏ hàng</Button
                >
              </div>
            </div>
          </div>
        </div>
        <Pagination></Pagination>
      </div>
    </div>
  </div>
</template>

<script>
import Filter from "./Filter.vue";
import Pagination from "./Pagination.vue";
import { RouterLink } from "vue-router";
export default {
  name: "home",
  components: {
    Filter,
    Pagination,
  },
  data() {
    return {
      bookPerPage: 16,
      currentPage: 1,
      bookList: null,
      initBookList: null,
      isLoading: false,
      carts: null,
      searchField: "",
      filterList: [],
      sortBox: ["A -> Z", "Z -> A", "Giá: Thấp -> Cao", "Giá: Cao -> Thấp"],
      sort: "A -> Z",
      config: {
        headers: {
          Authorization: "Bearer " + this.$cookies.get("myCookie"),
        },
      },
    };
  },
  watch: {
    bookList: {
      handler(newVal) {
        this.$tinyemit.emit("updateData", newVal);
      },
    },
    deep: true,
    async searchField() {},
  },
  created() {
    this.isLoading = true;
    this.$axios.get(this.$API.getAllBook).then((res) => {
      console.log(res.data);
      this.isLoading = false;
      this.bookList = res.data;
      this.initBookList = res.data;
    });
    this.loadCart();
  },
  mounted() {
    this.$tinyemit.on("getRowPerPage", (data) => {
      this.bookPerPage = data;
    });
    this.$tinyemit.on("getCurrentPage", (page) => {
      this.currentPage = page;
    });
    this.$tinyemit.on("getStartAndEndRow", (start, end) => {
      this.currentStartRows = start;
    });
    this.$tinyemit.on("filter", (filterList) => {
      this.filterList = filterList;
      this.handleFilter();
    });
  },
  beforeUnmount() {
    this.$tinyemit.off("getRowPerPage");
    this.$tinyemit.off("getCurrentPage");
    this.$tinyemit.off("getStartAndEndRow");
    this.$tinyemit.off("filter");
  },
  computed: {
    currentEndRows() {
      if (!this.bookList) {
        return;
      } else {
        return Math.min(
          this.currentPage * this.bookPerPage,
          this.bookList.length
        );
      }
    },
    sortedRow() {
      if (this.isLoading || !this.bookList) {
        return;
      } else {
        this.$tinyemit.emit("resetPage");
        switch (this.sort) {
          case "A -> Z":
            return this.sortState("name");
          case "Z -> A":
            return this.sortState("name").reverse();
          case "Giá: Thấp -> Cao":
            return this.sortState("price");
          case "Giá: Cao -> Thấp":
            return this.sortState("price").reverse();
        }
      }
    },
  },
  methods: {
    loadCart() {
      if (this.$cookies.get("myCookie")) {
        this.$axios.get(this.$API.getAllCart, this.config).then((res) => {
          this.isLoading = false;
          this.carts = res.data;
          console.log(this.carts);
        });
      }
    },
    navigateProductDetail(id) {
      this.$router.push(`/product/${id}`);
    },
    addItemToCart(book, quantity) {
      if (this.$cookies.get("myCookie")) {
        console.log(this.carts);
        this.updateCart(this.carts, book, quantity, this.config);

        this.loadCart();

        this.$tinyemit.emit("showToast", "Add");
      } else this.$router.push("/login");
    },
    chosenItem(box, value) {
      eval(`this.${box} = '${value}'`);
    },
    sortState(property) {
      return this.bookList.sort((a, b) => {
        const nameA = a[property]; // Convert names to uppercase for case-insensitive sorting
        const nameB = b[property];

        if (nameA < nameB) {
          return -1; // a should be before b in the sorted order
        } else if (nameA > nameB) {
          return 1; // a should be after b in the sorted order
        }

        return 0; // names are equal, maintain their original order
      });
    },
    async optionSearch() {
      const response = await this.$axios.post(this.$API.searchBook, {
        name: this.searchField,
      });
      return Array.from(response.data);
    },
    async optionFilter() {
      if (!this.filterList.length) return Array.from(this.initBookList);
      else {
        const response = await this.$axios.post(this.$API.filterBook, {
          genreIds: this.filterList,
        });
        return Array.from(response.data);
      }
    },
    // search
    async handleSearch() {
      let searchData = await this.optionSearch();
      let filterData = await this.optionFilter();
      const mergedArray = searchData.filter((obj1) =>
        filterData.some((obj2) => obj2.id == obj1.id)
      );
      this.bookList = mergedArray;
    },
    // filter
    async handleFilter() {
      let searchData = await this.optionSearch();
      let filterData = await this.optionFilter();
      console.log(filterData, searchData);
      const mergedArray = searchData.filter((obj1) =>
        filterData.some((obj2) => obj2.id == obj1.id)
      );
      this.bookList = mergedArray;
    },
    // pagination
    paginatedData(data) {
      if (data)
        return Array.from(data).slice(
          this.currentStartRows - 1,
          this.currentEndRows
        );
    },
  },
};
</script>

<style scoped>
@import url(../../css/pages/home.css);
</style>
