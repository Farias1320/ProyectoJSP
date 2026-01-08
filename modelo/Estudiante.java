/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Estudiante {
    private String nombre;
    private String email;
    private String curso;
    
    public Estudiante(String nombre, String email, String curso) {
        this.nombre = nombre;
        this.email = email;
        this.curso = curso;
    }
    
    // Getters
    public String getNombre() { return nombre; }
    public String getEmail() { return email; }
    public String getCurso() { return curso; }
    
    // Setters
    public void setNombre(String nombre) { this.nombre = nombre; }
    public void setEmail(String email) { this.email = email; }
    public void setCurso(String curso) { this.curso = curso; }
}