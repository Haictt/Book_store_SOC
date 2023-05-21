<template>
  <div class="filter">
    <div class="filter-header">Thể loại</div>
    <div class="filter-container">
      <ul class="checkbox-list">
        <li v-for="genre in genres" :key="genre.id">
          <Checkbox
            :Id="genre.id"
            v-model="filterList"
            :inputValue="genre.id"
          ></Checkbox>
          <label class="label" :for="genre.id">{{ genre.name }}</label>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "Filter",
  props: [],
  emits: [],
  data() {
    return {
      genres: null,
      filterList: [],
    };
  },
  watch: {
    filterList: {
      handler(newVal) {
        console.log(Array.from(newVal));
        this.$tinyemit.emit("filter", Array.from(newVal));
      },
    },
    deep: true,
  },
  created() {
    this.$axios.get(this.$API.getAllGenre).then((res) => {
      console.log(res.data);
      this.genres = res.data;
    });
  },
};
</script>

<style scoped>
@import url(../../css/components/filter.css);
</style>
