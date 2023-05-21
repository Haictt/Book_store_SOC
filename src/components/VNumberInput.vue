<template>
  <div class="number-input flex-row">
    <a @click="changeQty(-1)" class="btn-subtract-qty side-btn">
      <img
        src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/ico_minus2x.png"
        alt=""
      />
    </a>
    <input
      type="text"
      name=""
      :id="Id"
      maxvalue="999"
      minvalue="1"
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)"
      @blur="$emit('onBlurEvent', $event.target.id)"
      @keypress="validateNumber"
    />
    <a @click="changeQty(1)" class="btn-add-qty side-btn">
      <img
        class="fix"
        src="https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/ico_plus2x.png"
        alt=""
      />
    </a>
  </div>
</template>

<script>
export default {
  name: "number-input",
  props: ["Id", "modelValue"],
  emits: ["update:modelValue", "onBlurEvent", "onChangeQty"],
  data() {
    return {};
  },
  methods: {
    validateNumber($event) {
      const keyCode = $event.keyCode;
      // Allow numeric keys, plus backspace and delete
      const numericKeys = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 8, 46];
      if (!numericKeys.includes(keyCode)) {
        $event.preventDefault();
      }
    },
    changeQty(value) {
      this.$emit("onChangeQty", value);
    },
  },
};
</script>

<style scoped>
.number-input {
  justify-content: flex-start;
  border: 1px solid #c1c1c1;
  border-radius: 4px;
  height: 32px;
}
img {
  width: 12px;
  height: auto;
  max-width: 100%;
  border: 0;
}
.fix {
  position: relative;
  top: 5px;
}
.side-btn {
  text-align: center;
  cursor: pointer;
  padding: 0 8px 0 16px;
  user-select: none;
}
input {
  border: none !important;
  width: 3em !important;
  color: #0d0e0f;
  font-weight: 700;
  font-size: 1.2em;
  height: 100%;
  display: inline;
  text-align: center;
  padding: 2px;
}
input:focus,
input:active {
  outline: none;
}
</style>
