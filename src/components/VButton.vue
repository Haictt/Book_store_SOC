<template>
    <button v-bind="$attrs"
        :class="['button', 'button-' + Type, 'button-single', For == 'error' ? 'button-error' : '', '' + Additional]">
        <div :class="['button-text', 'button-text-' + Type]">
            <slot></slot>
        </div>
    </button>
</template>

<script>
export default {
    name: 'button',
    props: ['Type', 'For', 'Additional'],
    data() {
        return {

        }
    },
    inheritAttrs: false
}
</script>

<style scoped>
@import url(../css/components/button.css);
</style>