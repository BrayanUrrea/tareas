const express = require('express');
const app =express();
const bd = require('../bd/bd')


app.use(express.json())
app.use(express.urlencoded({extended : true}))

var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}


app.use(allowCrossDomain);

bd.client.connect()

app.get('/', (req, res)=>{

    console.log('Connected successfuly')
    bd.client.query("select * from task ")
    .then(results => res.send(results.rows))
    
})

app.post('/', (req, res)=>{
    bd.client.query("insert into task (id,descripcion,fecha,prioridad,realizada) values "+"("+"'"+req.body.id+"'"+","+"'"+req.body.des+"'"+","+"'"+req.body.fecha+"'"+","+"'"+req.body.prioridad+"'"+","+"''"+")")
}) 

app.delete('/', (req,res)=>{
    bd.client.query("delete from task where task.id = "+"'"+req.body.id+"'")
    
})

app.put('/', (req, res) =>{
    bd.client.query("update task set realizada = 'checked' where task.id = "+"'"+req.body.id+"'")
    
})

const port = process.env.PORT || 3000;
app.listen(port, () =>{
    console.log(`listening on port ${port}`)
});