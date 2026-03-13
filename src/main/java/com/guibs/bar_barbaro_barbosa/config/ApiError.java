package com.guibs.bar_barbaro_barbosa.config;

import java.time.LocalDate;

public record ApiError(
        int code,
        String message,
        LocalDate timestamp
) {}
