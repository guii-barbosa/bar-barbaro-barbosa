package com.guibs.bar_barbaro_barbosa.feature.adventurous;

import com.guibs.bar_barbaro_barbosa.exception.NotFoundException;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousGetDto;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousRegisterDto;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousUpdateDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class AdventurousService {

    private final AdventurousRepository adventurousRepository;
    private final AdventurousMapper adventurousMapper;

    public AdventurousService(AdventurousRepository adventurousRepository, AdventurousMapper adventurousMapper){
        this.adventurousRepository = adventurousRepository;
        this.adventurousMapper = adventurousMapper;
    }

    public Page<AdventurousGetDto> getAllAdventurous(Pageable pageable){
        return adventurousRepository.findAll(pageable)
                .map(this.adventurousMapper::toDto);
    }

    public Page<AdventurousGetDto> getAllAdventurous(Calling calling, Pageable pageable) {
        return adventurousRepository.findByCalling(calling, pageable)
                .map(this.adventurousMapper::toDto);
    }

    public AdventurousGetDto getAdventurousById(Long id){
        return adventurousRepository.findById(id)
                .map(this.adventurousMapper::toDto)
                .orElseThrow(() -> new NotFoundException("Adventurous not found"));
    }


    public AdventurousGetDto registerAdventurous(AdventurousRegisterDto adventurousRegisterDto){
        Adventurous adventurous = adventurousRepository.save(adventurousMapper.toEntity(adventurousRegisterDto));
        return adventurousMapper.toDto(adventurous);
    }

    public void updateAdventurous(Long id, AdventurousUpdateDto adventurousUpdateDto){
        Adventurous adventurous = adventurousRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Adventurous not found"));

        adventurous.setName(adventurousUpdateDto.name());
        adventurous.setNickname(adventurousUpdateDto.nickname());
        adventurous.setCountry(adventurousUpdateDto.country());
        adventurous.setEmail(adventurousUpdateDto.email());
        adventurous.setPassword(adventurousUpdateDto.password());
        adventurous.setCalling(adventurousUpdateDto.calling());

        adventurousRepository.save(adventurous);
    }

    public void deleteAdventurous(Long id){
        Adventurous adventurous = adventurousRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Adventurous not found"));

        adventurous.setDeletedAt(LocalDate.now());
        adventurousRepository.save(adventurous);
    }

}
