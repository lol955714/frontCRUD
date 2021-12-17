<template>
  <div>
      <form ref="formulario">
        <label>Correo</label>
          <input type="email" v-model="form.username">
        <label>contraseña</label>
        <input type="password" v-model="form.password">

      </form>
        <button @click="registro">registrarse</button>
        <br>
        {{message}}
  </div>
</template>
<script>
  import instancia from "@/collection/archivo.js"
  export default{
    data(){
      return{
        form:{
          'username':'',
          'password':''
        },
        message:''
      }
    },
    methods:{
      registro: function(){
        instancia.post('register',this.form)
        .then(this.message="se creo el usuario:   "+this.form.username)
        this.$refs.formulario.reset()
      }
    }
  }
</script>
<style>
</style>
