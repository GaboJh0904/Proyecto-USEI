package com.usei.usei.dto;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class SuccessfulResponse {

    private String timeStamp;
    private String status;
    private String message;
    private Object result;

    public SuccessfulResponse(String status, String message, Object result) {
        this.timeStamp = LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        this.status = status;
        this.message = message;
        this.result = result;
    }

    public String getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
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

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
