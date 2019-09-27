<template>
  <div class="list">
  
    <table class="table">
      <thead class="thead-light">
        <tr>
          <th scope="col">Id</th>
          <th scope="col">Descripcion</th>
          <th scope="col">Fecha</th>
          <th scope="col">Prioridad</th>
          <th scope="col">Realizada</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="tarea in tareas" v-bind:key="tarea">
          <th scope="row">{{tarea.id}}</th>
          <td>{{tarea.descripcion}}</td>
          <td>{{tarea.fecha}}</td>
          <td>{{tarea.prioridad}}</td>
          <td><input @click="actualizar(tarea.id)" type="checkbox" v-text="tarea.realizada" ></td>
        </tr>
        
      </tbody>
    </table>
  </div>
</template>


<script>
import axios from 'axios'

export default {
  name: 'list',
  components: {
    
  },
  data(){
    return{
      tareas:[],
      realizada:[]
    }
  },
  methods:{
    getTareas: function(){
      axios.get('http://localhost:3000').then( response=>{
        this.tareas = response.data
      
      })
    },
    actualizar(id){
      axios.put('http://localhost:3000',{
        id
      })
    }
  },
  mounted: function(){
    this.getTareas ();
  }
}
</script>


<style>
.list{
  padding: 30px;
}
</style>