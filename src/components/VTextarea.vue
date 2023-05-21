<template>
  <div :class="['flex', 'text-area', Disable ? 'disabled' : '']">
    <div class="flex-row border">
      <textarea
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        class="text-area flex1"
        :placeholder="Placeholder"
        :id="Id"
        v-bind="$attrs"
        :disabled="Disable"
      ></textarea>
    </div>
  </div>
</template>

<script>
export default {
  name: "Textarea",
  props: ["Id", "Placeholder", "modelValue", "Disable"],
  emits: ["update:modelValue"],
  inheritAttrs: false,
};
</script>

<style scoped>
@import url(../css/components/textarea.css);
</style>
