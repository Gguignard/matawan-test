package com.backend.Backend.model.dto.in;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PlayerDtoIn {
    @NotNull(message = "Name is required")
    private String name;
    @NotNull(message = "Age is required")
    private int age;
    @NotNull(message = "Position is required")
    private String position;
}
