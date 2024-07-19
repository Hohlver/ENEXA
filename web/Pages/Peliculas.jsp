<%-- 
    Document   : Peliculas
    Created on : 11-07-2024, 16:48:05
    Author     : Laboratorio
--%>

<%@page import="service.DAOPeliculas"%>
<%@page import="db.ConexionSingleton"%>
<%@page import="java.util.List"%>
<%@page import="model.Peliculas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <%
        ConexionSingleton oConexion = ConexionSingleton.getInstance();
        DAOPeliculas oDAOPeliculas = new DAOPeliculas(oConexion);
        List<Peliculas> oList = oDAOPeliculas.getAll().get();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Peliculas</title>
        <link rel="stylesheet" href="../css/materialize.css"/>
    </head>
    <body>
        <nav>
            <div class="nav-wrapper">  
                <a href="../index.jsp" class="brand-logo">Inicio</a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="Peliculas.jsp">Peliculas</a> </li>
                    <li><a href="Libros.jsp">Libros</a></li>
                    
                </ul>
            </div>
        </nav>

        <div class="row">
            <div class="card-panel">
                <h4>Añadir Pelicula</h4>
                <form name="datosP" method="post" action="../AgregarPelicula.do">
                    <div class="input-field">
                        <input id="nombre" type="text" name="txtTit" placeholder="Titulo">

                    </div>
                    <div class="input-field">
                        <input id="director" type="text" name="txtDir" placeholder="Director">

                    </div>
                    <div class="input-field">
                        <input id="director" type="text" name="txtGen" placeholder="Genero">

                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Crear</button>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="card-panel">
                <h4>Lista Peliculas</h4>
                <table class="responsive-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Titulo</th>
                            <th>Director</th>
                            <th>Genero</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Peliculas oPeliculas : oList) {%>
                        <tr>
                            <td><%= oPeliculas.getId()%></td>
                            <td><%= oPeliculas.getTitulo()%></td>
                            <td><%= oPeliculas.getDirector()%></td>
                            <td><%= oPeliculas.getGenero()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
                    
        <div class="row">
            <div class="card-panel">
                <h4>Editar Pelicula</h4>
                <form name="datosUs" method="post" action="../EditarPelicula.do">
                    <div class="input-field">
                        <input id="id" type="number" name="txtIdEd" placeholder="ID">

                    </div>
                    <div class="input-field">
                        <input id="titulo" type="text" name="txtTitEd" placeholder="Titulo">

                    </div>
                    <div class="input-field">
                        <input id="director" type="text" name="txtDirEd" placeholder="Director">

                    </div>
                    <div class="input-field">
                        <input id="genero" type="text" name="txtGenEd" placeholder="Genero">

                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Editar</button>
                </form>
            </div>
            
        </div>

        <div class="row">
            <div class="card-panel">
                <h4>Eliminar Pelicula</h4>
                <form name="datosUs" method="post" action="../EliminarPelicula.do">
                    <div class="input-field">
                        <input id="id" type="number" name="txtIdE" placeholder="ID">

                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Eliminar</button>
                </form>
            </div>
        </div>



        <footer class="page-footer">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">Footer Content</h5>
                        <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
                    </div>
                    <div class="col l4 offset-l2 s12">
                        <h5 class="white-text">Links</h5>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    © 2024 Copyright Text
                    <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
                </div>
            </div>
        </footer>
    </body>
</html>
