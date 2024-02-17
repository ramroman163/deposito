/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.deposito.servlets;

import com.mycompany.deposito.logica.Categoria;
import com.mycompany.deposito.logica.ControladoraLogica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Roman
 */
@WebServlet(name = "CargarProductosSv", urlPatterns = {"/cargarProducto"})
public class CargarProductosSv extends HttpServlet {

    ControladoraLogica control = null;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        control = new ControladoraLogica();

        List<Categoria> listaCategorias = control.obtenerCategorias();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaCategorias", listaCategorias);

        response.sendRedirect("/deposito/cargar/cargaProducto.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        control = new ControladoraLogica();

        String nombre = request.getParameter("nombre");
        String categoriaId = request.getParameter("categoria");
        String cantidad = request.getParameter("cantidad");
        String precioCosto = request.getParameter("precioCosto");
        String precioVenta = request.getParameter("precioVenta");

        if (nombre == null
                || categoriaId == null
                || cantidad == null
                || precioCosto == null
                || precioVenta == null || "".equals(nombre) || "".equals(categoriaId) || "".equals(cantidad)
                || "".equals(precioCosto) || "".equals(precioVenta)) {
            HttpSession sesion = request.getSession();
            
            response.sendRedirect("/deposito/cargarProducto");

        } else {
            control.guardarProducto(nombre, categoriaId, cantidad, precioCosto, precioVenta);

            response.sendRedirect("/deposito/mostrarProductos");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
