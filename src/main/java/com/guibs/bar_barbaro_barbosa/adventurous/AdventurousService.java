package com.guibs.bar_barbaro_barbosa.adventurous;

import com.guibs.bar_barbaro_barbosa.adventurous.dto.AdventurousGetDto;
import com.guibs.bar_barbaro_barbosa.adventurous.dto.AdventurousRegisterDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdventurousService {

    private final AdventurousRepository adventurousRepository;
    private final AdventurousMapper adventurousMapper;

    public AdventurousService(AdventurousRepository adventurousRepository, AdventurousMapper adventurousMapper){
        this.adventurousRepository = adventurousRepository;
        this.adventurousMapper = adventurousMapper;
    }

    public List<AdventurousGetDto> getAllAdventurous(){
        return adventurousRepository
                .findAll()
                .stream()
                .map(this.adventurousMapper::toDto)
                .toList();
    }

    public AdventurousGetDto registerAdventurous(AdventurousRegisterDto adventurousRegisterDto){
        Adventurous adventurous = adventurousRepository.save(adventurousMapper.toEntity(adventurousRegisterDto));
        return adventurousMapper.toDto(adventurous);
    }

}
