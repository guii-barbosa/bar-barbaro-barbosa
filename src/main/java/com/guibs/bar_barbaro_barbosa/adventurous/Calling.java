package com.guibs.bar_barbaro_barbosa.adventurous;

public enum Calling {

    PERSONAL(1),
    SCHOOL(2),
    WORK(3);

    private final int code;

    Calling(int code){
        this.code = code;
    }

    public int getCode(){
        return code;
    }

    public static Calling fromCode(int code){
        for(Calling c : Calling.values()){
            if(c.code == code){
                return c;
            }
        }
        throw new IllegalArgumentException("Invalid code");
    }
}