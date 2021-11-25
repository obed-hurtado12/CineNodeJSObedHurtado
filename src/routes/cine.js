const express = require('express');
const router = express.Router();
const pool = require('../database.js');

router.get('/',async (req,res)=>{
    let listpelicula = await pool.query('SELECT * FROM pelicula inner join categoria;');
    res.json({
        status : 200,
        message: "se ha listado correctamente",
        listpelicula: listpelicula
    });
});
router.get('/:id',async (req,res)=>{
    const {id}= req.params;
    let listpelicula = await pool.query('SELECT * FROM pelicula inner join categoria where pelicula.id = ? and pelicula.categoria=categoria.id',[id]);
    res.json({
        status : 200,
        message: "se ha obtenido correctamente",
        listpelicula: listpelicula
    });
});
router.post('/create',(req,res)=>{
    const {titulo, descripcion, sinopsis, raiting, fecha_de_registro, fecha_de_actualizacion,  categoria, Nombre } = req.body;
    const categoria ={
        Nombre
    };
const pelicula ={
    titulo, descripcion, sinopsis, raiting, fecha_de_registro, fecha_de_actualizacion, estado :1, categoria
};
    pool.query('Insert into pelicula set ?,Insert into categoria set ?',[pelicula,categoria]);
    res.json({
        status : 200,
        message: "se ha creado correctamente",
        pelicula : pelicula
    });
});
router.post('/update/:id',(req,res)=>{
const {id}=req.params;
const {titulo, descripcion, sinopsis, raiting, fecha_de_registro, fecha_de_actualizacion,  categoria} = req.body;

const pelicula ={
    id, titulo, descripcion, sinopsis, raiting, fecha_de_registro, fecha_de_actualizacion, estado:1, categoria
};
pool.query('update pelicula set ? where id= ?',[pelicula,id ]);
res.json({
    status : 200,
    message: "se ha actualizado correctamente",
    pelicula : pelicula
});
});
router.post('/delete/:id',async (req,res)=>{
    const {id}=req.params;
    await pool.query('update pelicula set estado = 0 where id = ?',[id]);
    res.json({
        status : 200,
        message: "se ha eliminado correctamente",
        
    });
});
module.exports = router;


