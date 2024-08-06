package com.backend.Backend.model.dto.out;

import com.backend.Backend.model.entity.Team;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@NoArgsConstructor
public class TeamDtoOut {
    private String name;
    private String acronym;
    private Long budget;
    private List<PlayerDtoOut> players;

    public TeamDtoOut(Team team) {
        this.name = team.getName();
        this.acronym = team.getAcronym();
        this.budget = team.getBudget();
        this.players = team.getPlayers().stream().map(PlayerDtoOut::new).toList();
    }
}
