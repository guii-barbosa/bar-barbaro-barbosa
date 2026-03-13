package com.guibs.bar_barbaro_barbosa.contract;

import com.guibs.bar_barbaro_barbosa.feature.adventurous.Calling;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousGetDto;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousRegisterDto;
import com.guibs.bar_barbaro_barbosa.feature.adventurous.dto.AdventurousUpdateDto;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

public interface AdventurousContract {

    @GetMapping()
    @Operation(summary = "Get all Adventurous [might be by purpose]")
    @ApiResponses(value={
            @ApiResponse(responseCode = "200", description = "Adventurous found successfully"),
            @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    ResponseEntity<Page<AdventurousGetDto>> getAllAdventurous(@RequestParam(value = "calling", required = false) Calling calling, @Parameter(hidden = true) Pageable pageable);


    @GetMapping("/{adventurousId}")
    @Operation(summary = "Get Adventurous by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Adventurous found successfully"),
            @ApiResponse(responseCode = "404", description = "Adventurous not found"),
            @ApiResponse(responseCode = "500", description = "Internal Server Error")
    })
    ResponseEntity<AdventurousGetDto> getAdventurousById(@PathVariable("adventurousId") Long adventurousId);

    @PostMapping()
    @Operation(summary = "Register a new Adventurous")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Adventurous created successfully"),
            @ApiResponse(responseCode = "400", description = "Bad request"),
            @ApiResponse(responseCode = "500", description = "Internal Server Error")
    })
    ResponseEntity<AdventurousGetDto> registerAdventurous(@RequestBody AdventurousRegisterDto adventurousRegisterDto);

    @PatchMapping("/{adventurousId}")
    @Operation(summary = "Update Adventurous by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Adventurous attributed successfully"),
            @ApiResponse(responseCode = "400", description = "Invalid input"),
            @ApiResponse(responseCode = "404", description = "Adventurous not found"),
            @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    ResponseEntity<Void> updateAdventurous(@PathVariable("adventurousId") Long adventurousId, @RequestBody AdventurousUpdateDto adventurousUpdateDto);

    @PatchMapping("/delete/{adventurousId}")
    @Operation(summary = "Desativate Adventurous by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Adventurous attributed successfully"),
            @ApiResponse(responseCode = "400", description = "Invalid input"),
            @ApiResponse(responseCode = "404", description = "Adventurous not found"),
            @ApiResponse(responseCode = "500", description = "Internal server error")
    })
    ResponseEntity<Void> deleteAdventurous(@PathVariable("adventurousId") Long adventurousId);
}
