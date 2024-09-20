package com.usei.usei.dto.request;

public class LoginRequestDTO {

    private int ci;
    private String contrasena;

    // Getters y Setters
    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
}