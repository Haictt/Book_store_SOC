<template>
  <div class="dialog message-box">
    <div class="message-box-bg"></div>
    <div class="message-box-box-outline">
      <div
        class="message-box-icon icon-wrapper icon-delete"
        @click="$emit('closeDialog')"
      ></div>
      <div class="message-box-container">
        <div class="message-box-header">
          <div class="message-box-content">
            <div class="message-box-title">{{ Title }}</div>
            <div class="message-box-description">
              <slot name="before"></slot>
              <span>
                <slot name="content"></slot>
              </span>
              <slot name="after"></slot>
            </div>
          </div>
        </div>
        <div class="message-box-footer">
          <div class="message-box-button">
            <Button
              v-if="NeedCancel"
              @click="$emit('closeDialog')"
              Type="secondary"
              >{{ dialog.AllowDelete.ButtonCancel }}</Button
            >
            <Button
              v-if="CloseMasterForm"
              @click="$emit('closeMasterForm')"
              Type="secondary"
              >{{ dialog.DataChangeConfirm.ButtonNegate }}</Button
            >
            <Button @click="handlePrimaryButton" :Type="Type" :For="For">{{
              ButtonText
            }}</Button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Dialog from "../js/locale/VN/dialog.js";
export default {
  name: "Dialog",
  props: [
    "Type",
    "Title",
    "ButtonText",
    "For",
    "NeedCancel",
    "CloseMasterForm",
  ],
  emits: ["closeDialog", "onMainAction", "closeMasterForm"],
  data() {
    return {
      dialog: Dialog,
    };
  },
  methods: {
    handlePrimaryButton() {
      if (this.NeedCancel || this.CloseMasterForm) {
        this.$emit("onMainAction");
      } else this.$emit("closeDialog");
    },
  },
};
</script>

<style scoped>
@import url(../css/components/dialog.css);
@import url(../css/components/button.css);
</style>
