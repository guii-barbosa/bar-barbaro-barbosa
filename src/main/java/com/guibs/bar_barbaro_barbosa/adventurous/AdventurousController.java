package com.guibs.bar_barbaro_barbosa.adventurous;

import com.guibs.bar_barbaro_barbosa.adventurous.dto.AdventurousGetDto;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/adventurous")
public class AdventurousController {

    private final AdventurousService adventurousService;

    public AdventurousController(AdventurousService adventurousService){
        this.adventurousService = adventurousService;
    }

    @GetMapping()
    public List<AdventurousGetDto> getAll(){
        return adventurousService.getAllAdventurous();
    }
}
