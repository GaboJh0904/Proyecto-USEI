package com.usei.usei.util;

public class TokenData {
    private String id;
    private String type;
    private String username;
    private String message;

    public TokenData(String id, String type, String username, String message) {
        this.id = id;
        this.type = type;
        this.username = username;
        this.message = message;
    }

    public TokenData() {
    }


    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
