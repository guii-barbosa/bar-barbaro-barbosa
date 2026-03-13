package com.guibs.bar_barbaro_barbosa.exception;
import lombok.Getter;

@Getter

public class NotFoundException extends RuntimeException{

    public NotFoundException(String message){
        super("404 - NOT FOUND: " + message);
    }
}
