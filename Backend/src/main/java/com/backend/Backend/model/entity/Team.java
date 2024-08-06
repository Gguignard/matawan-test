package com.backend.Backend.model.entity;

import com.backend.Backend.model.dto.in.TeamDtoIn;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Entity
@NoArgsConstructor
@Getter
@Setter
public class Team {
    @Id
    @GeneratedValue(generator = "UUID")
    private UUID uuid;
    private String name;
    private String acronym;
    private Long budget;

    @OneToMany(mappedBy = "team", cascade = CascadeType.ALL)
    private List<Player> players;

    public Team(TeamDtoIn teamDtoIn) {
        this.name = teamDtoIn.getName();
        this.acronym = teamDtoIn.getAcronym();
        this.budget = teamDtoIn.getBudget();
    }
}
