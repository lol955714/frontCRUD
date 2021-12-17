<template>
  <div>
      <form ref="formulario">
        <label>Correo</label>
          <input type="email" v-model="form.username">
        <label>contraseña</label>
        <input type="password" v-model="form.password">

      </form>
        <button @click="ingresar">ingresar</button>
          {{token}}
  </div>
</template>
<script>
import instancia from "@/collection/archivo.js"
export default{
  data(){
    return{
      form:{
        username:'',
        password:''
      },
      token:null
    }
  },
  methods:{
    ingresar: function(){
      try{
      instancia.post('login_check',this.form)
      .then(response=>this.token=response.data.token)
      this.$refs.formulario.reset()
    }
    catch(error){
      console.log(error)
    }
    }
  }
}
</script>
<style>
</style>
