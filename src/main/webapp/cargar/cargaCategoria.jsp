<%-- 
    Document   : cargaCategoria
    Created on : 11 feb. 2024, 14:57:26
    Author     : Roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                        <li><a class="dropdown-item active" aria-selected="true" href="/deposito/cargarCategoria">Categorias</a></li>
                    </ul>
                </li>
                <li class="nav-item " ><a href="/deposito/mostrarProductos" class="nav-link " >Visualizar</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Informes</a></li>
            </ul>
            
        </header>
        <main class="container ">
            <section class="w-50">
                <form action="/deposito/cargarCategoria" method="POST">
                    <div class="row mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre">
                    </div>
                    
                    <button type="submit" class="btn btn-primary row">Cargar</button>
                </form>
            </section>
        </main>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
    </body>
</html>
