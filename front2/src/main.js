//import Vue from 'vue'
//import App from './App.vue'
//import './index.css'
//import router from "@/Router/index.js"

//Vue.config.productionTip = false


//createApp(App).mount('#app')
import { createApp } from 'vue';
import App from '@/App.vue';
import "bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import { FontAwesomeIcon } from './plugins/font-awesome'
import store from "./store";
import router from '@/Router';

createApp(App)
.use(router)
.use(store)
.component("font-awesome-icon", FontAwesomeIcon)
.mount('#App')
