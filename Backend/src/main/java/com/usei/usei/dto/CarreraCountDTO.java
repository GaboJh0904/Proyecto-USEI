package com.usei.usei.dto;

public class CarreraCountDTO {
    private String carrera;
    private Long count;

    public CarreraCountDTO(String carrera, Long count) {
        this.carrera = carrera;
        this.count = count;
    }

    // Getters y setters
    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }
}
