<template>
  <div>
        <nav>
          <router-link :to="{name:'home'}">Home</router-link>
          <br/>
          <router-link :to="{name:'categoria-list'}">Listado de categorias</router-link>
          <router-view/>
        </nav>
  </div>

</template>

<script>
export default{
  name: 'App',
}

</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
