<template>
  <div
    :class="[
      'textfield-input',
      Invalid ? 'invalid' : '',
      Disable ? 'disabled' : '',
    ]"
  >
    <input
      ref="input"
      v-bind="$attrs"
      :type="Type"
      name=""
      :id="Id"
      :placeholder="Placeholder"
      :value="modelValue"
      :disabled="Disable"
      @input="$emit('update:modelValue', $event.target.value)"
      @blur="$emit('onBlurEvent', $event.target.id)"
    />
  </div>
</template>

<script>
export default {
  name: "input",
  props: ["Id", "Placeholder", "modelValue", "Clicked", "Invalid", "Disable","Type"],
  emits: ["update:modelValue", "onBlurEvent"],
  inheritAttrs: false,
  data() {
    return {};
  },
  mounted() {
    if (this.Clicked) {
      this.$refs.input.focus();
    }
  },
  methods: {
    focus() {
      this.$refs.input.focus();
    },
  },
};
</script>

<style scoped>
@import url(../css/components/input.css);
</style>
