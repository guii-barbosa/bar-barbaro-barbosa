package com.guibs.bar_barbaro_barbosa.adventurous.dto;

import com.guibs.bar_barbaro_barbosa.adventurous.Calling;
import jakarta.validation.constraints.NotBlank;

public record AdventurousRegisterDto(

        @NotBlank(message="Name must not be blank")
        @Size(max=255)
        String name,

        @NotBlank(message="Alias must not be blank")
        @Size(max=255)
        String nickname,

        @NotBlank(message="Calling must not be blank")
        @Size(max=50)
        Calling calling,

        @NotBlank(message="Country must not be blank")
        @Size(max=255)
        String country,

        @NotBlank(message="Email must not be blank")
        @Size(max=255)
        @Email(message="Email must me valid")
        String email,

        @NotBlank(message="Name must not be blank")
        @Size(max=255)
        @Pattern(regexp="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$", message="User password must have at least 8 digits, including upper and lower case, numbers and special characters")
        String password

) {}
