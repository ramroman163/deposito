/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.deposito.logica;

import com.mycompany.deposito.persistencia.ControladoraPersistencia;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.List;

/**
 *
 * @author Roman
 */
public class ControladoraLogica {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public List<Categoria> obtenerCategorias(){
        return controlPersis.obtenerCategorias();
    }

    public void guardarProducto(String nombre, String categoriaId, String cantidad, String precioCosto, String precioVenta) {
        Producto nuevoProducto = new Producto();
        
        int cantidadParseada = Integer.parseInt(cantidad);
        
        double precioCostoParseado = 0;
        double precioVentaParseado = 0;
        
        try {
            precioCostoParseado = Double.parseDouble(precioCosto);
            precioVentaParseado = Double.parseDouble(precioVenta);
        } catch (Exception e) {
            return;
        }
        
        
        nuevoProducto.setNombre(nombre);
        nuevoProducto.setCantidad(cantidadParseada);
        nuevoProducto.setPrecioCosto(precioCostoParseado);
        nuevoProducto.setPrecioVenta(precioVentaParseado);
        
        Long idCategoriaParseada = Long.valueOf(categoriaId);
        
        Categoria categoria = traerCategoria(idCategoriaParseada);
        
        nuevoProducto.setCategoria(categoria);
        
        controlPersis.guardarProducto(nuevoProducto);
    }
    
    public Categoria traerCategoria(Long id){
        return controlPersis.traerCategoria(id);
    }

    public void guardarCategoria(String nombre) {
        Categoria nuevaCategoria = new Categoria();
        
        nuevaCategoria.setNombre(nombre);
        
        controlPersis.guardarCategoria(nuevaCategoria);
    }

    public List<Producto> obtenerProductos() {
        return controlPersis.obtenerProductos();
    }

    public void eliminarProducto(Long id) {
        controlPersis.eliminarProducto(id);
    }

    public Producto traerProducto(Long id) {
        return controlPersis.traerProducto(id);
    }

    public void editarProducto(String id, String nombre, String categoriaId, String cantidad, String precioCosto, String precioVenta) {
        Producto nuevoProducto = new Producto();
        
        Long idProductoParseado = Long.valueOf(id);
        int cantidadParseada = Integer.parseInt(cantidad);
        double precioCostoParseado = 0;
        double precioVentaParseado = 0;
        
        try {
            precioCostoParseado = Double.parseDouble(precioCosto);
            precioVentaParseado = Double.parseDouble(precioVenta);
        } catch (Exception e) {
            return;
        }
        
        nuevoProducto.setId(idProductoParseado);
        nuevoProducto.setNombre(nombre);
        nuevoProducto.setCantidad(cantidadParseada);
        nuevoProducto.setPrecioCosto(precioCostoParseado);
        nuevoProducto.setPrecioVenta(precioVentaParseado);
        
        Long idCategoriaParseada = Long.valueOf(categoriaId);
        
        Categoria categoria = traerCategoria(idCategoriaParseada);
        
        nuevoProducto.setCategoria(categoria);
        
        controlPersis.editarProducto(nuevoProducto);
    }

    public String eliminarCategoria(Long idCategoria) {
        Categoria categoriaAEliminar = controlPersis.traerCategoria(idCategoria);
        
        if(!categoriaAEliminar.getProductos().isEmpty()){
            return "La categoría tiene productos";
        } else {
            controlPersis.eliminarCategoria(idCategoria);
        }
        
        return "";
    }
}
