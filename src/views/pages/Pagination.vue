<template>
  <div class="box-pagination flex-row">
    <div class="pagination-left flex-row">
      <div class="page-caption">Tổng số:</div>
      <div class="total-page">
        <span> {{ data?.length }} </span>
      </div>
      <div class="page-caption">sản phẩm</div>
    </div>
    <div class="flex-row">
      <span class="page-caption">Trang hiện tại:</span>
      <div class="page-size">
        <input type="number" v-model.lazy="currentPage" />
      </div>
    </div>
    <div class="pagination-right flex-row">
      <div
        @click="handlePrevPage"
        class="navigate prev icon-prev disabled pointer"
      ></div>
      <div
        @click="handleNextPage"
        class="navigate next icon-next disabled pointer"
      ></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Pagination",
  emits: [],
  props: [],
  data() {
    return {
      bookPerPage: 16,
      currentPage: 1,
      data: null,
    };
  },

  watch: {
    currentPage: {
      handler(newVal) {
        if (!newVal) {
          this.currentPage = 1;
        }
        if (newVal > this.totalPage) {
          this.currentPage = this.totalPage;
        }
        document.documentElement.scrollTop = 0;
        document.body.scrollTop = 0;
        this.$tinyemit.emit("getCurrentPage", this.currentPage);
        this.$tinyemit.emit(
          "getStartAndEndRow",
          this.currentStartRow,
          this.currentEndRow
        );
      },
    },
  },
  created() {
    this.$axios.get(this.$API.getAllBook).then((res) => {
      console.log(res.data);
      this.data = res.data;
    });
  },
  mounted() {
    this.$tinyemit.on("updateData", (data) => {
      this.data = data;
      this.currentPage = 1;
    });
    this.$tinyemit.on("resetPage", () => {
      this.currentPage = 1;
    });
  },
  beforeUnmount() {
    this.$tinyemit.off("updateData");
    this.$tinyemit.off("resetPage");
  },
  computed: {
    totalPage() {
      return Math.ceil(this.totalBooks / this.bookPerPage);
    },
    totalBooks() {
      return this.data.length;
    },
    hasNextPage() {
      return this.currentPage < this.totalPage;
    },
    hasPrevPage() {
      return this.currentPage > 1;
    },
    currentStartRow() {
      return (this.currentPage - 1) * this.bookPerPage + 1;
    },
    currentEndRow() {
      return Math.min(this.currentPage * this.bookPerPage, this.totalBooks);
    },
  },
  methods: {
    handleNextPage() {
      if (this.hasNextPage) {
        this.currentPage += 1;
      }
    },
    handlePrevPage() {
      if (this.hasPrevPage) {
        this.currentPage -= 1;
      }
    },
  },
};
</script>

<style scoped>
.box-pagination {
  margin-top: 12px;
  display: flex;
  position: relative;
  background: #fff;
  left: 30%;
  margin-right: 0;
  border-radius: 4px;
  box-shadow: 0 0 4px rgba(0, 0, 0, 0.1);
  min-width: 640px;
  min-height: 48px;
  justify-content: space-between;
  align-items: center;
}
.page-size {
  width: 80px;
}
.total-page {
  font-weight: 800;
  padding: 0 2px;
}
.flex-row {
  align-items: center;
}
.navigate {
  height: 36px;
  width: 36px;
  position: relative;
}
.prev {
  transform: rotate(-180deg);
  margin-top: 7px;
  height: 36px;
  width: 36px;
  position: relative;
}
.pagination-right {
  justify-content: center;
}
.page-caption {
  margin-right: 4px;
}
input[type="number"] {
  border: 1px solid #c7c6c6;
  border-radius: 4px;
  width: 40px;
  height: 20px;
}

input[type="number"]:focus {
  border-color: var(--color-primary);
}
input[type="number"]:hover {
  border-color: var(--color-secondary);
}
</style>
