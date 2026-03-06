package com.guibs.bar_barbaro_barbosa.adventurous;

import com.guibs.bar_barbaro_barbosa.adventurous.dto.AdventurousGetDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdventurousService {

    private final AdventurousRepository adventurousRepository;

    public AdventurousService(AdventurousRepository adventurousRepository){
        this.adventurousRepository = adventurousRepository;
    }

    public List<AdventurousGetDto> getAllAdventurous(){
        return adventurousRepository
                .findAll()
                .stream()
                .map(this::parseEntityToDto)
                .toList();
    }

    private AdventurousGetDto parseEntityToDto(Adventurous adventurous){
        return new AdventurousGetDto(
                adventurous.getName(),
                adventurous.getNickname(),
                adventurous.getEmail(),
                adventurous.getCountry(),
                adventurous.getCalling()
        );
    }
}
