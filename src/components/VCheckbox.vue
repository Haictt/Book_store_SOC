<template>
  <label :for="Id" :class="['checkbox', Disable ? 'disabled' : '', 'pointer']">
    <input
      v-bind="$attrs"
      ref="input"
      type="checkbox"
      name=""
      :id="Id"
      :value="inputValue"
      v-model="model"
      :checked="checked"
      :disabled="Disable"
    />
    <span class="checkbox-checkmark"></span>
    <span v-if="HaveText" class="checkbox-text">{{ inputValue }}</span>
  </label>
</template>

<script>
export default {
  name: "Checkbox",
  props: {
    Id: String,
    inputValue: String,
    checked: {
      type: Boolean,
      default: false,
    },
    HaveText: Boolean,
    modelValue: Array,
    Disable: Boolean,
  },
  emits: ["update:modelValue", "checkAll"],
  computed: {
    model: {
      get() {
        return this.modelValue;
      },
      set(value) {
        this.$emit("update:modelValue", value);
      },
    },
  },
  methods: {
    focus() {
      this.$refs.input.focus();
    },
  },
  inheritAttrs: false,
};
</script>

<style scoped>
@import url(../css/components/checkbox.css);
</style>
