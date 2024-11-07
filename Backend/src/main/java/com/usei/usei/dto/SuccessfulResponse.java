package com.usei.usei.dto;


import java.util.Map;

public class SuccessfulResponse {

    private String status;
    private String message;
    private String token;
    private int expiresIn;
    private Map<String, Object> data;

    public SuccessfulResponse(String status, String message, String token, int expiresIn, Map<String, Object> data) {
        this.status = status;
        this.message = message;
        this.token = token;
        this.expiresIn = expiresIn;
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(int expiresIn) {
        this.expiresIn = expiresIn;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
