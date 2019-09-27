<template>
  <div class="home">
    <form>
      <div class="form-group">
        <label for="exampleFormControlInput1">Id</label>
        <input v-model="id" type="text" class="form-control" id="id_tarea" placeholder="e45t56fe">
      </div>
      <div class="form-group">
        <label for="exampleFormControlTextarea1">Descripcion</label>
        <textarea v-model="des" class="form-control" id="descripcion" rows="2" placeholder="Darle de comer al perro"></textarea>
      </div>
      <div class="form-group">
        <label for="exampleFormControlInput1">Fecha</label>
        <input v-model="fecha" type="text" class="form-control" id="fecha" placeholder="2018-08-30">
      </div>
      <div class="form-group">
        <label for="exampleFormControlSelect1">Prioridad</label>
        <select v-model="prioridad" class="form-control" id="prioridad">
          <option>Alta</option>
          <option>Media</option>
          <option>Baja</option>
        </select>
      </div>
      <div class="form-group row">
        <div class="col-sm-10">
          <button v-on:click="crear(id,des,fecha,prioridad)" type="submit" class="btn  btn-outline-success">Crear</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'home',
  components: {
    
  },
  data(){
    return{
      id:"",
      des:"",
      fecha:"",
      prioridad:""
    }
  },
  methods:{
    getTareas: function(){
      axios.get('http://localhost:3000').then( response=>{
        this.tareas = response.data
        console.log(response.data)
      })
    
    },
    crear(id,des,fecha,prioridad){
      axios.post('http://localhost:3000',{
        id,des,fecha,prioridad
      })
    }
    
  },
  mounted: function(){
    this.getTareas ()
  }
}
</script>

<style>
.home{
 max-width: 400px;
 border: 1px solid #42b983;
 border-radius: 10px;
 padding: 7px;
 margin: 0 auto;
 text-align: center;
 margin-bottom: 20px;
}


</style>