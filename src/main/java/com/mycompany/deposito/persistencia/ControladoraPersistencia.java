/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.deposito.persistencia;

import com.mycompany.deposito.logica.Categoria;
import com.mycompany.deposito.logica.Producto;
import com.mycompany.deposito.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Roman
 */
public class ControladoraPersistencia {
    CategoriaJpaController categoriaJpaController = new CategoriaJpaController();
    ProductoJpaController productoJpaController = new ProductoJpaController();

    public List<Categoria> obtenerCategorias() {
        return categoriaJpaController.findCategoriaEntities();
    }

    public Categoria traerCategoria(Long id) {
        return categoriaJpaController.findCategoria(id);
    }

    public void guardarProducto(Producto nuevoProducto) {
        productoJpaController.create(nuevoProducto);
    }

    public void guardarCategoria(Categoria nuevaCategoria) {
        categoriaJpaController.create(nuevaCategoria);
    }

    public List<Producto> obtenerProductos() {
        return productoJpaController.findProductoEntities();
    }

    public void eliminarProducto(Long id) {
        try {
            productoJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Producto traerProducto(Long id) {
        return productoJpaController.findProducto(id);
    }

    public void editarProducto(Producto nuevoProducto) {
        try {
            productoJpaController.edit(nuevoProducto);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
