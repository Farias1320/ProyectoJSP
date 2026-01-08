/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package datos;

import model.Estudiante;
import java.util.ArrayList;
import java.util.List;

public class BaseDatosSimulada {
    private static final List<Estudiante> estudiantes = new ArrayList<>();
    
    // Agregar estudiante
    public static void agregarEstudiante(Estudiante estudiante) {
        estudiantes.add(estudiante);
    }
    
    // Obtener todos los estudiantes
    public static List<Estudiante> obtenerTodos() {
        return new ArrayList<>(estudiantes); // Retorna copia
    }
    
    // Contar estudiantes
    public static int contarEstudiantes() {
        return estudiantes.size();
    }
    
    // Limpiar base de datos (opcional)
    public static void limpiar() {
        estudiantes.clear();
    }
}