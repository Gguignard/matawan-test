package com.backend.Backend.model.dto.in;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class TeamDtoIn {

    @NotNull(message = "Name is required")
    private String name;
    @NotNull(message = "Acronym is required")
    private String acronym;
    @NotNull(message = "Budget is required")
    private Long budget;
    private List<PlayerDtoIn> players;
}
