<%-- 
    Document   : listar
    Created on : 8 ene. 2026, 18:10:54
    Author     : crisf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Estudiante" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Estudiantes</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <div class="container">
        <header>
            <h1> Listado de Estudiantes Registrados</h1>
            <p>Total de registros: <%= request.getAttribute("totalEstudiantes") %></p>
        </header>
        
        <main>
            <!-- Botón para volver -->
            <div class="back-button">
                <a href="index.jsp" class="btn btn-back">← Volver al Registro</a>
            </div>
            
            <!-- Tabla de estudiantes -->
            <%
                List<Estudiante> estudiantes = (List<Estudiante>) request.getAttribute("listaEstudiantes");
                if (estudiantes != null && !estudiantes.isEmpty()) {
            %>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Correo Electrónico</th>
                            <th>Curso</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            int contador = 1;
                            for (Estudiante est : estudiantes) { 
                        %>
                        <tr>
                            <td><%= contador++ %></td>
                            <td><%= est.getNombre() %></td>
                            <td><%= est.getEmail() %></td>
                            <td><span class="badge-curso"><%= est.getCurso() %></span></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <% } else { %>
            <div class="empty-state">
                <div class="empty-icon">📭</div>
                <h3>No hay estudiantes registrados</h3>
                <p>Regresa al formulario para agregar nuevos registros.</p>
                <a href="index.jsp" class="btn btn-primary">Ir al Formulario</a>
            </div>
            <% } %>
            
            <!-- Resumen -->
            <div class="summary">
                <h3> Resumen de Cursos</h3>
                <%
                    if (estudiantes != null && !estudiantes.isEmpty()) {
                        java.util.Map<String, Integer> cursosCount = new java.util.HashMap<>();
                        for (Estudiante est : estudiantes) {
                            String curso = est.getCurso();
                            cursosCount.put(curso, cursosCount.getOrDefault(curso, 0) + 1);
                        }
                        
                        for (java.util.Map.Entry<String, Integer> entry : cursosCount.entrySet()) {
                %>
                <div class="course-summary">
                    <span class="course-name"><%= entry.getKey() %></span>
                    <span class="course-count"><%= entry.getValue() %> estudiantes</span>
                </div>
                <% 
                        }
                    }
                %>
            </div>
        </main>
        
        <footer>
            <p>Sistema de Registro | Estudiantes registrados: <%= request.getAttribute("totalEstudiantes") %></p>
        </footer>
    </div>
</body>
</html>
