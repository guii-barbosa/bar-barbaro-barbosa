package com.guibs.bar_barbaro_barbosa.feature.adventurous.dto;

import com.guibs.bar_barbaro_barbosa.feature.adventurous.Calling;

public record AdventurousGetDto(
    Long id,
    String name,
    String nickname,
    String email,
    String country,
    Calling calling
){}
