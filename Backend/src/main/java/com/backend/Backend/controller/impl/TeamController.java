package com.backend.Backend.controller.impl;

import com.backend.Backend.controller.operations.TeamOperations;
import com.backend.Backend.model.dto.in.TeamDtoIn;
import com.backend.Backend.model.dto.out.TeamDtoOut;
import com.backend.Backend.model.entity.Team;
import com.backend.Backend.service.TeamService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestController
public class TeamController implements TeamOperations {

    private final TeamService teamService;

    @Override
    public ResponseEntity<List<TeamDtoOut>> searchTeams(String sort, String order, int page, int size) throws BadRequestException, NoSuchFieldException {
        log.info("Searching teams with sort: {}, order: {}, page: {}, size: {}", sort, order, page, size);
        Page<Team> teams = teamService.searchTeams(sort, order, page, size);

        HttpHeaders responseHeaders = new HttpHeaders();
        // Custom header containing pagination info
        responseHeaders.set("x-total-elements", String.valueOf(teams.getTotalElements()));
        responseHeaders.set("x-total-pages", String.valueOf(teams.getTotalPages()));
        responseHeaders.set("x-current-page", String.valueOf(page));
        return ResponseEntity.ok().headers(responseHeaders).body(teams.getContent().stream().map(TeamDtoOut::new).toList());
    }

    @Override
    public ResponseEntity<TeamDtoOut> createTeam(TeamDtoIn teamDtoIn) {
        teamService.createTeam(teamDtoIn);
        return ResponseEntity.created(null).build();
    }
}
