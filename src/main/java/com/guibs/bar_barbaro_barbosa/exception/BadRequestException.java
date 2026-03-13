package com.guibs.bar_barbaro_barbosa.exception;
import lombok.Getter;

@Getter

public class BadRequestException extends RuntimeException{

    public BadRequestException(String message){
        super("400 - BAD REQUEST: " + message);
    }
}
