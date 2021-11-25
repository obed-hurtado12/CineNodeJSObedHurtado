const express = require('express');
const router = express.Router();
const pool = require('../database.js');

router.get('/',async (req,res)=>{
    let listcategoria = await pool.query('SELECT * FROM categoria;');
    res.json({
        status : 200,
        message: "se ha listado correctamente",
        listcategoria: listcategoria
    });
});
router.get('/:id',async (req,res)=>{
    const {id}= req.params;
    let listcategoria = await pool.query('SELECT * FROM categoria where id = ?',[id]);
    res.json({
        status : 200,
        message: "se ha obtenido correctamente",
        listcategoria: listcategoria
    });
});
router.post('/create',(req,res)=>{
    const {Nombre} = req.body;
const categoria ={
    Nombre
};
    pool.query('Insert into categoria set ?',[categoria]);
    res.json({
        status : 200,
        message: "se ha creado correctamente",
        categoria : categoria
    });
});
router.post('/update/:id',(req,res)=>{
const {id}=req.params;
const {Nombre} = req.body;
const categoria ={
    Nombre
};
pool.query('update categoria set ? where id= ?',[categoria,id ]);
res.json({
    status : 200,
    message: "se ha actualizado correctamente",
    categoria : categoria
});
});
router.post('/delete/:id',async (req,res)=>{
    const {id}=req.params;
    await pool.query('DELETE FROM categoria where id = ?',[id]);
    res.json({
        status : 200,
        message: "se ha eliminado correctamente",
        
    });
});
module.exports = router;


