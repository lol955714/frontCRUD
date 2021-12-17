import { createRouter, createWebHistory } from 'vue-router'
import CategoriaList from "@/components/categorias/list.vue"
import Home from "@/components/Layouts/Home.vue"
import Create from "@/components/categorias/create.vue"
import Login from "@/components/seguridad/login.vue"
import Register from "@/components/seguridad/register.vue"


const routes=[
  {
    path:"/categorias",
    name:"categoria-list",
    component:CategoriaList,
    props:true,
  },
  {
    path:"/categorias/create",
    name:"create",
    component:Create,
    props:true
  },
  {
    path:"/",
    name:"home",
    component:Home
  },
  {
    path:"/login",
    name:"login",
    component:Login
  },
  {
    path:"/register",
    name:"register",
    component:Register
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
