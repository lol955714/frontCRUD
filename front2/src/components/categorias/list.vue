<template>
  <div>
    <div v-if="id==0">
      <!---<button @click="create">Crear</button>-->
      <router-link :to="{name:'create', params:{'id':id}}">Crear Categoria  </router-link>
    </div>
    <router-view/>
    <div >
          <span v-for="index in max" :key="index" v-on:click="page=index">
              <button>Pagina {{index}}</button>
          </span>
      <table>
        <thead>
            <tr>
              <td>ID</td>
              <td>Nombre</td>
              <td>Edad minima</td>
              <td>acciones</td>
            </tr>
        </thead>
        <tbody>
          <tr v-for = "instancia in datos['hydra:member']" :key = "instancia.id" @click="setear(instancia.id)">
            <td> {{instancia.id}}</td>
            <td>{{instancia.nombre}}</td>
            <td>{{instancia.edadMinima}}</td>
            <td><router-link :to="{name:'create', params:{'id':instancia.id}}">Ver Categoria </router-link></td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>
</template>
<script>
  import instancia from "@/collection/archivo.js"

  //import create from "@/components/categorias/create.vue"
  export default{
  components:{
    //create
  },
  data(){
    return{
      datos: false,
      id:0,
      creando:-1,
      page:1,
      max:0
    }
  },
  methods: {
    setear(idEntrante){
      this.id=+idEntrante
    },
    create(){
      this.id=-1
    },
    cancelar(){
      this.id=0
    },
    traerData:function(){
      instancia
      .get('http://localhost:9988/api/categorias?page='+this.page)
      .then(response => {
              this.datos = response.data
              const hydra = response.data['hydra:view']['hydra:last'].split('?')[1]
              const hydraurl = new URLSearchParams(hydra)
              this.max=+hydraurl.get('page')
            })
        },
  },
  created(){
  },
  watch:{
    page :function(){
      this.traerData()
    },
    id :function(){
      this.traerData()
    }
  },
  mounted(){
    this.traerData()

  }
}
</script>
<style>
</style>
