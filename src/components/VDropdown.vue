<template>
  <div class="w-100 input-editor">
    <div class="text-container relative">
      <div
        :class="['select', Invalid ? 'invalid' : '', Disable ? 'disabled' : '']"
      >
        <input
          ref="input"
          @focus="onFocusEvent"
          @blur="onBlurEvent"
          type="text"
          class="dropdown pointer"
          placeholder=""
          :value="modelValue"
          @input="$emit('update:modelValue', $event.target.value)"
          :id="Id"
          v-bind="$attrs"
          @mousedown.prevent="showDropDown"
          readonly
        />
        <div
          @mousedown.prevent="showDropDown"
          class="icon-wrapper icon-dropdown icon-dropdown-combobox"
        ></div>
      </div>
      <ul v-if="isShowDropDown" class="dropdown-container scroller">
        <li
          @mousedown.stop="$emit('chooseItem', content)"
          v-for="content in Content"
          @click="isShowDropDown = false"
        >
          {{ content }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "Dropdown",
  props: ["modelValue", "Id", "Content", "Disable", "Invalid"],
  emits: ["update:modelValue", "chooseItem", "onBlurEvent"],
  inheritAttrs: false,
  data() {
    return {
      isShowDropDown: false,
      isFocus: false,
    };
  },
  methods: {
    showDropDown() {
      this.isShowDropDown = !this.isShowDropDown;
      this.isFocus = true;
    },
    onFocusEvent() {
      this.isFocus = true;
      console.log(this.isFocus);
    },
    onBlurEvent($event) {
      this.isFocus = false;
      this.isShowDropDown = false;
      this.$emit("onBlurEvent", $event.target.id);
    },
    focus() {
      this.$refs.input.focus();
    },
  },
  watch: {
    isFocus() {
      if (this.isFocus) {
        this.$refs.input.focus();
      }
    },
  },
};
</script>

<style scoped>
@import url(../css/components/dropdown.css);
input {
  flex: unset !important;
  width: calc(100% - 12px);
}
ul {
  display: block !important;
}
li {
  padding-top: 0 !important;
  padding-bottom: 0 !important;
}
</style>
