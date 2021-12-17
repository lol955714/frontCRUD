//import Vue from 'vue'
//import App from './App.vue'
//import './index.css'
//import router from "@/Router/index.js"

//Vue.config.productionTip = false


//createApp(App).mount('#app')
import { createApp } from 'vue';
import App from '@/App.vue';
import store from "./store";
import router from '@/Router';

createApp(App)
.use(router)
.use(store)
.mount('#App')
