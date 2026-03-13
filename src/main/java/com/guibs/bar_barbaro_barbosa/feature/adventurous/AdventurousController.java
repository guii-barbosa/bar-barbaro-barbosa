package com.guibs.bar_barbaro_barbosa.feature.adventurous;

import com.guibs.bar_barbaro_barbosa.contract.AdventurousContract;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousGetDto;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousRegisterDto;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousUpdateDto;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@Tag(
        name = "Adventurous Management",
        description = "Provides operations for creating, updating, assigning, tagging, and retrieving users."
)
@RestController
@RequestMapping("/adventurous")
public class AdventurousController implements AdventurousContract {

    private final AdventurousService adventurousService;

    public AdventurousController(AdventurousService adventurousService){
        this.adventurousService = adventurousService;
    }

    @Override
    public ResponseEntity<Page<AdventurousGetDto>> getAllAdventurous(Calling calling, Pageable pageable){
        Page<AdventurousGetDto> result = (calling != null)
                ? adventurousService.getAllAdventurous(calling, pageable)
                : adventurousService.getAllAdventurous(pageable);

        return ResponseEntity.ok(result);
    }

    @Override
    public ResponseEntity<AdventurousGetDto> getAdventurousById(Long id){
        AdventurousGetDto result = adventurousService.getAdventurousById(id);
        return ResponseEntity.ok(result);
    }

    @Override
    public ResponseEntity<AdventurousGetDto> registerAdventurous(AdventurousRegisterDto adventurousRegisterDto){
        AdventurousGetDto result = adventurousService.registerAdventurous(adventurousRegisterDto);
        return ResponseEntity.status(201).body(result);
    }

    @Override
    public ResponseEntity<Void> updateAdventurous(Long id, AdventurousUpdateDto adventurousUpdateDto){
        return ResponseEntity.noContent().build();

    }

    @Override
    public ResponseEntity<Void> deleteAdventurous(Long id){
        return ResponseEntity.noContent().build();

    }


}
