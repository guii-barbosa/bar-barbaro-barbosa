package com.guibs.bar_barbaro_barbosa.adventurous;

import com.guibs.bar_barbaro_barbosa.adventurous.dto.AdventurousGetDto;
import com.guibs.bar_barbaro_barbosa.adventurous.dto.AdventurousRegisterDto;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/adventurous")
public class AdventurousController {

    private final AdventurousService adventurousService;

    public AdventurousController(AdventurousService adventurousService){
        this.adventurousService = adventurousService;
    }

    @GetMapping()
    public ResponseEntity<List<AdventurousGetDto>> getAll(){
        List<AdventurousGetDto> result =  adventurousService.getAllAdventurous();

        return ResponseEntity.ok(result);
    }

    @PostMapping()
    public ResponseEntity<AdventurousGetDto> registerAdventurous(@Valid @RequestBody AdventurousRegisterDto adventurousRegisterDto){
        AdventurousGetDto result = adventurousService.registerAdventurous(adventurousRegisterDto);
        return ResponseEntity.status(201).body(result);
    }
}
