<%-- 
    Document   : index
    Created on : 8 ene. 2026, 18:11:00
    Author     : crisf
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Estudiantes</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>📚 Sistema de Registro de Cursos</h1>
            <p>Registro de estudiantes para cursos virtuales</p>
        </header>
        
        <main>
            <!-- Mensajes de éxito/error -->
            <% if (request.getAttribute("mensaje") != null) { %>
                <div class="alert success">
                    ✅ <%= request.getAttribute("mensaje") %>
                </div>
            <% } %>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert error">
                    ❌ <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <!-- Formulario de registro -->
            <div class="form-container">
                <h2>📝 Registro Nuevo Estudiante</h2>
                <form action="RegistroServlet" method="POST">
                    <input type="hidden" name="accion" value="guardar">
                    
                    <div class="form-group">
                        <label for="nombre">Nombre completo:</label>
                        <input type="text" id="nombre" name="nombre" required 
                               placeholder="Ej: Juan Pérez">
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Correo electrónico:</label>
                        <input type="email" id="email" name="email" required 
                               placeholder="Ej: juan@email.com">
                    </div>
                    
                    <div class="form-group">
                        <label for="curso">Curso seleccionado:</label>
                        <select id="curso" name="curso" required>
                            <option value="">-- Seleccione un curso --</option>
                            <option value="Java Básico">Java Básico</option>
                            <option value="Web con JSP">Desarrollo Web con JSP</option>
                            <option value="Base de Datos">Base de Datos SQL</option>
                            <option value="Spring Boot">Spring Boot Avanzado</option>
                            <option value="Frontend">Desarrollo Frontend</option>
                        </select>
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn btn-primary">
                            💾 Guardar Registro
                        </button>
                        
                        <button type="button" class="btn btn-secondary" 
                                onclick="location.href='index.jsp'">
                            🔄 Limpiar
                        </button>
                    </div>
                </form>
            </div>
            
            <!-- Botón para ver registros -->
            <div class="actions-container">
                <form action="RegistroServlet" method="POST">
                    <input type="hidden" name="accion" value="mostrar">
                    <button type="submit" class="btn btn-list">
                        👥 Mostrar Todos los Registros 
                        (<%= datos.BaseDatosSimulada.contarEstudiantes() %>)
                    </button>
                </form>
            </div>
            
            <!-- Información del sistema -->
            <div class="info-box">
                <h3>ℹ️ Información del Sistema</h3>
                <ul>
                    <li><strong>Tecnologías:</strong> Java, JSP, Servlets</li>
                    <li><strong>Patrón:</strong> MVC (Modelo-Vista-Controlador)</li>
                    <li><strong>Base de datos:</strong> ArrayList en memoria</li>
                    <li><strong>Método:</strong> POST para envío de datos</li>
                </ul>
            </div>
        </main>
        
        <footer>
            <p>Actividad #2 - Integración Java Web | JSP + Servlets | POO</p>
        </footer>
    </div>
</body>
</html>
