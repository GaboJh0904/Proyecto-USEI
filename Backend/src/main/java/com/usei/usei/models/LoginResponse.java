package com.usei.usei.models;

public class LoginResponse<T> {

    private T userDTO;
    private String token;
    private int tokenDurationMinutes;
    private String message;

    public LoginResponse() {
    }

    public LoginResponse(T userDTO, String token, int tokenDurationMinutes, String message) {
        this.userDTO = userDTO;
        this.token = token;
        this.tokenDurationMinutes = tokenDurationMinutes;
        this.message = message;
    }

    public LoginResponse(String message) {
        this.message = message;
    }

    public T getUserDTO() {
        return userDTO;
    }

    public void setUserDTO(T userDTO) {
        this.userDTO = userDTO;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getTokenDurationMinutes() {
        return tokenDurationMinutes;
    }

    public void setTokenDurationMinutes(int tokenDurationMinutes) {
        this.tokenDurationMinutes = tokenDurationMinutes;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
