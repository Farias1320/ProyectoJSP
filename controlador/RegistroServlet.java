/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;


import model.Estudiante;
import datos.BaseDatosSimulada;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Determinar qué acción ejecutar
        String accion = request.getParameter("accion");
        
        if ("guardar".equals(accion)) {
            // Guardar nuevo estudiante
            String nombre = request.getParameter("nombre");
            String email = request.getParameter("email");
            String curso = request.getParameter("curso");
            
            // Validar datos básicos
            if (nombre != null && !nombre.trim().isEmpty() &&
                email != null && !email.trim().isEmpty()) {
                
                Estudiante nuevoEst = new Estudiante(nombre, email, curso);
                BaseDatosSimulada.agregarEstudiante(nuevoEst);
                
                // Guardar mensaje de éxito
                request.setAttribute("mensaje", "Estudiante registrado exitosamente!");
            } else {
                request.setAttribute("error", "Por favor complete todos los campos obligatorios");
            }
            
            // Volver al formulario
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
        } else if ("mostrar".equals(accion)) {
            // Mostrar todos los registros
            request.setAttribute("listaEstudiantes", BaseDatosSimulada.obtenerTodos());
            request.setAttribute("totalEstudiantes", BaseDatosSimulada.contarEstudiantes());
            
            request.getRequestDispatcher("listar.jsp").forward(request, response);
        }
    }
}