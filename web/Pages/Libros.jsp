<%-- 
    Document   : Libros
    Created on : 11-07-2024, 16:48:14
    Author     : Laboratorio
--%>

<%@page import="model.Libros"%>
<%@page import="java.util.List"%>
<%@page import="service.DAOLibros"%>
<%@page import="db.ConexionSingleton"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        ConexionSingleton oConexion = ConexionSingleton.getInstance();
        DAOLibros oDAOLibros = new DAOLibros(oConexion);
        List<Libros> oList = oDAOLibros.getAll().get();
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
                <h4>Añadir Libro</h4>
                <form name="datosP" method="post" action="../AgregarLibro.do">
                    <div class="input-field">
                        <input id="isbn" type="number" name="txtIsbn" placeholder="ISBN">

                    </div>
                    <div class="input-field">
                        <input id="titulo" type="text" name="txtTit" placeholder="Titulo">

                    </div>
                    <div class="input-field">
                        <input id="autor" type="text" name="txtAut" placeholder="Autor">

                    </div>
                    <div class="input-field">
                        <input id="idioma" type="text" name="txtIdi" placeholder="Idioma">

                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Crear</button>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="card-panel">
                <h4>Lista Libro</h4>
                <table class="responsive-table">
                    <thead>
                        <tr>
                            <th>ISBN</th>
                            <th>Titulo</th>
                            <th>Autor</th>
                            <th>Idioma</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Libros oLibros : oList) {%>
                        <tr>
                            <td><%= oLibros.getIsbn()%></td>
                            <td><%= oLibros.getTitulo()%></td>
                            <td><%= oLibros.getAutor()%></td>
                            <td><%= oLibros.getIdioma()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
                    
        <div class="row">
            <div class="card-panel">
                <h4>Editar Libro</h4>
                <form name="datosL" method="post" action="../EditarLibro.do">
                    <div class="input-field">
                        <input id="isbn" type="number" name="txtIsbnEd" placeholder="ISBN">

                    </div>
                    <div class="input-field">
                        <input id="titulo" type="text" name="txtTitEd" placeholder="Titulo">

                    </div>
                    <div class="input-field">
                        <input id="autor" type="text" name="txtAutEd" placeholder="Autor">

                    </div>
                    <div class="input-field">
                        <input id="idioma" type="text" name="txtIdiEd" placeholder="Idioma">

                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Editar</button>
                </form>
            </div>
            
        </div>

        <div class="row">
            <div class="card-panel">
                <h4>Eliminar Libro</h4>
                <form name="datosUs" method="post" action="../EliminarLibro.do">
                    <div class="input-field">
                        <input id="isbnE" type="number" name="txtIsbnE" placeholder="ISBN">

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
