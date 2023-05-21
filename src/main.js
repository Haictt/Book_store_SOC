import "./assets/main.css";

import { VueElement, createApp } from "vue";
import App from "./App.vue";
import Input from "./components/VInput.vue";
import Button from "./components/VButton.vue";
import NumberInput from "./components/VNumberInput.vue";
import Checkbox from "./components/VCheckbox.vue";
import Search from "./components/VSearch.vue";
import Dropdown from "./components/VDropdown.vue";
import Textarea from "./components/VTextarea.vue";
import Toast from "./components/VToast.vue";
import Loading from "./components/VLoading.vue";
import Dialog from "./components/VDialog.vue";
import router from "./router/router";
import axios from "axios";
import emitter from "tiny-emitter/instance";
import Enum from "./js/enum.js";
import Cookies from "js-cookie";
import Config from "./js/locale/VN/config.js";
import mixins from "./js/mixins/mixins.js";
import API from "./js/locale/VN/api";
const app = createApp(App);
const globalConfig = app.config.globalProperties;
globalConfig.$axios = axios;
globalConfig.$tinyemit = emitter;
globalConfig.$enum = Enum;
globalConfig.$cookies = Cookies;
globalConfig.$config = Config;
globalConfig.$API = API;
app.component("Input", Input);
app.component("Button", Button);
app.component("Checkbox", Checkbox);
app.component("NumberInput", NumberInput);
app.component("Search", Search);
app.component("Textarea", Textarea);
app.component("Dropdown", Dropdown);
app.component("Toast", Toast);
app.component("Loading", Loading);
app.component("Dialog", Dialog);
app.mixin(mixins);
app.use(router);

app.mount("#app");
export { globalConfig };