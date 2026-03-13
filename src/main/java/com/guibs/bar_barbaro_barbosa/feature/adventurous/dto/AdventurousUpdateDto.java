package com.guibs.bar_barbaro_barbosa.feature.adventurous.dto;

import com.guibs.bar_barbaro_barbosa.feature.adventurous.Calling;
import jakarta.validation.constraints.*;

import java.time.LocalDate;

public record AdventurousUpdateDto(
        @Size(max=255)
        String name,

        @Size(max=255)
        String nickname,

        @Size(max=50)
        Calling calling,

        @Size(max=255)
        String country,

        @Size(max=255)
        @Email(message="Email must me valid")
        String email,

        @Size(max=255)
        @Pattern(regexp="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$", message="User password must have at least 8 digits, including upper and lower case, numbers and special characters")
        String password
) {
}
