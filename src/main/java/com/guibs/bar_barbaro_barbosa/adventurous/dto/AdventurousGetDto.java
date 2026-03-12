package com.guibs.bar_barbaro_barbosa.adventurous.dto;

import com.guibs.bar_barbaro_barbosa.adventurous.Calling;

public record AdventurousGetDto(
    Long id,
    String name,
    String nickname,
    String email,
    String country,
    Calling calling
){}
