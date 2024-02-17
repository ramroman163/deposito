<%-- 
    Document   : mostrarProductos
    Created on : 11 feb. 2024, 14:58:09
    Author     : Roman
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.deposito.logica.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Depósito</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body class="bg-body-secondary">
        <header class="bg-light d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom container">
            <a href="/deposito/index.jsp" class="d-flex align-items-center ps-3 gap-2 mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-box-seam" viewBox="0 0 16 16">
                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2zm3.564 1.426L5.596 5 8 5.961 14.154 3.5zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464z"/>
                </svg>
                <span class="fs-4">Deposito</span>
            </a>

            <ul class="nav nav-pills">
                <li class="nav-item"><a href="/deposito/" class="nav-link">Inicio</a></li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Carga
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/deposito/cargarProducto">Productos</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/deposito/cargarCategoria">Categorias</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Visualizar
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item active" aria-selected="true" href="/deposito/mostrarProductos">Productos</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="/deposito/mostrarCategorias">Categorias</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a href="#" class="nav-link">Informes</a></li>
            </ul>
        </header>
        <main class="container">
            <div class="table-responsive-xl">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Categoría</th>
                            <th scope="col">$ Costo</th>
                            <th scope="col">$ Venta</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<Producto> listaProductos = (List) request.getSession().getAttribute("listaProductos"); %>
                        <% if (listaProductos.size() > 0) { %>
                        <%   for (Producto prod : listaProductos) {%>
                        <tr>
                            <th scope="row"><%=prod.getId()%></th>
                            <td><%=prod.getNombre()%> </td>
                            <td><%=prod.getCategoria().getNombre() %></td>
                            <td>$ <%=prod.getPrecioCosto()%> </td>
                            <td>$ <%=prod.getPrecioVenta()%> </td>
                            <td><%=prod.getCantidad()%> </td>
                            <td class="d-flex gap-3">
                                <form class="d-flex" action="/deposito/editarProducto" method="GET">
                                    <input type="hidden" name="id" value=<%=prod.getId()%>>
                                    <button class="btn btn-outline-primary d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
                                        </svg>
                                    </button>
                                </form>
                                <form class="d-flex" action="/deposito/eliminarProducto" method="POST">
                                    <input type="hidden" name="id" value=<%=prod.getId()%>>
                                    <button class="btn btn-outline-danger d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                        <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                                        </svg>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%  } %>
                        <% } else { %>
                    <h3>Sin productos para mostrar</h3>
                    <% }%>
                    </tbody>
                </table>
            </div>

        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
    </body>
</html>
