<template>
  <div class="delete">
    <table class="table">
      <thead class="thead-light">
        <tr>
          <th scope="col">Id</th> 
          <th scope="col">Descripcion</th> 
          <th scope="col">Fecha</th> 
          <th scope="col">Prioridad</th> 
          <th scope="col">Eliminar Tarea</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="tarea in tareas" v-bind:key="tarea">
          <th scope="row">{{tarea.id}}</th>
          <td>{{tarea.descripcion}}</td>
          <td>{{tarea.fecha}}</td>
          <td>{{tarea.prioridad}}</td>
          <td><button v-on:click='formDelete(tarea.id)' type="button" class="btn btn-danger">Eliminar</button></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>


<script>
import axios from 'axios'

export default {
  name: 'delete',
  components: {
    
  },
  data(){
    return{
      tareas:[]
    }
  },
  methods:{
    getTareas: function(){
      axios.get('http://localhost:3000').then( response=>{
        this.tareas = response.data
      })
    },
    formDelete(id){
      axios.delete('http://localhost:3000' ,{
        data : {id}
      })
      

      
    }
  },
  mounted: function(){
    this.getTareas ()
  }
}
</script>


<style>
.delete{
    padding: 30px;
}
</style>