<template>
  <div class="textfield-input">
    <input
      type="text"
      name=""
      id=" "
      :placeholder="Placeholder"
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)"
      @blur="handleSearch"
    />
    <div class="icon-wrapper icon-delete icon-delete-textfield"></div>
    <div class="icon-wrapper icon-search mr-8" @click="handleSearch"></div>
  </div>
</template>

<script>
export default {
  name: "Search",
  props: ["Placeholder", "modelValue"],
  emits: ["update:modelValue", "search"],
  methods: {
    handleSearch() {
      this.$emit("search");
    },
  },
};
</script>

<style scoped>
@import url(../css/components/search.css);
</style>
