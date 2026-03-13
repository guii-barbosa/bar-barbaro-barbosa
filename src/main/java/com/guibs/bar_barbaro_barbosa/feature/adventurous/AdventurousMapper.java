package com.guibs.bar_barbaro_barbosa.feature.adventurous;

import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousGetDto;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousRegisterDto;
import org.springframework.stereotype.Component;

@Component
public class AdventurousMapper {


    public AdventurousGetDto toDto(Adventurous adventurous){
        return new AdventurousGetDto(
                adventurous.getId(),
                adventurous.getName(),
                adventurous.getNickname(),
                adventurous.getEmail(),
                adventurous.getCountry(),
                adventurous.getCalling()
        );
    }

    public Adventurous toEntity(AdventurousRegisterDto adventurousRegisterDto){
        Adventurous adventurous = new Adventurous();

        adventurous.setName(adventurousRegisterDto.name());
        adventurous.setNickname(adventurousRegisterDto.nickname());
        adventurous.setCalling(adventurousRegisterDto.calling());
        adventurous.setEmail(adventurousRegisterDto.email());
        adventurous.setPassword(adventurousRegisterDto.password());
        adventurous.setCountry(adventurousRegisterDto.country());

        return adventurous;
    }
}
