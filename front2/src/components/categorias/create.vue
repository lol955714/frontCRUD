<template>
    <div>
      {{id}}
      <div v-if="id==0">
        <h1>Creando</h1>
      </div>
      <div v-else>
        <h1>Editando</h1>
      </div>
      <br/>
      <form ref="formulario" >
        {{nombreLabel}}
        <input type="text" v-model="form.nombre" placeholder= place>
        <br>
        {{edadLabel}}
          <input type="number" v-model.number="form.edadMinima">
          <br>
      </form>
      <div v-if="datos==0">
        <button @click="onSubmit">Guardar nuevo</button>
        <button @click="goAway">Cancelar</button>
      </div>
      <div v-else>
        <div v-if="id!=0">
          <button @click="eliminar">Eliminar</button>
        </div>
        <button @click="update">Actualizar</button>
        <button @click="goAway">Cancelar</button>
        <br/>
        <br/><br/>
      </div>
    </div>
</template>
<script>
  import instancia from "@/collection/archivo.js"
      export default{
        name:'create',
        data(){
          return{
            nombreLabel:'Ingrese el nombre de la categoria',
            edadLabel: 'ingrese la edad minima',
            form:{
              nombre:'',
              edadMinima:''
            },
            datos:this.id,
            place:'ecribe'
          }
        },
        props:{
          id:{
            default: function(id){
              return +id
            }
          }
        },
        watch:{
          datos(nuevo){
            this.actualizarID(nuevo)
          }
        },
        mounted(){
          if(this.id<=0) return
          this.datos=this.id
          this.actualizarID(this.datos)
        },
        methods: {
         onSubmit: function() {
            this.$emit('actualizar',true)
             instancia
             .post('categorias',this.form )
             .then (
              this.goAway()
             )
             .catch(function (error) {
               console.log(error);
             });
           },
           update: function(){
             instancia.put('categorias/'+this.datos,this.form)
             .then(
             this.goAway()
           )
           .catch(function (error) {
             console.log(error);
           });
           },
           eliminar : function(){
            if(window.confirm("Desea borrar la categoría")){
              instancia.delete('categorias/'+this.id)
                this.goAway()
            }
           },
        actualizarID: function(ide){
          if (!ide)return
            console.log(this.datos)
          instancia.get('categorias/'+ide).
          then(response=>this.actualizarForm(response.data))
            },
        actualizarForm: function(datos){
          this.datos=datos.id,
          this.form.nombre=datos.nombre,
          this.form.edadMinima=datos.edadMinima
        },
        goAway: function(){
          this.$router.push({name:"categoria-list"})
        }
      }
    }
</script>
<style>
</style>
