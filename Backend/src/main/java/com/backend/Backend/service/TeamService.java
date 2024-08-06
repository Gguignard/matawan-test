package com.backend.Backend.service;

import com.backend.Backend.dao.PlayerRepository;
import com.backend.Backend.dao.TeamRepository;
import com.backend.Backend.model.dto.in.TeamDtoIn;
import com.backend.Backend.model.entity.Player;
import com.backend.Backend.model.entity.Team;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.coyote.BadRequestException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Slf4j
@RequiredArgsConstructor
@Service
public class TeamService {

    private final TeamRepository teamRepository;
    private final PlayerRepository playerRepository;

    public Page<Team> searchTeams(String sort, String order, int page, int size) throws BadRequestException, NoSuchFieldException {
        if (!Objects.equals(order, "asc") && !Objects.equals(order, "desc")) {
            throw new BadRequestException("Order must be 'asc' or 'desc'");
        }
        checkSort(sort);
        PageRequest pageRequest = PageRequest.of(page, size, "asc".equals(order) ? Sort.by(sort).ascending() : Sort.by(sort).descending());

        return teamRepository.findAll(pageRequest);
    }

    public void createTeam(TeamDtoIn teamDtoIn) {
        Team team = new Team(teamDtoIn);
        team = teamRepository.save(team);
        if (teamDtoIn.getPlayers() != null) {
            addPlayers(teamDtoIn, team);
        }
    }

    private void addPlayers(TeamDtoIn teamDtoIn, Team team) {
        List<Player> players = teamDtoIn.getPlayers().stream().map(playerDtoIn -> {
            Player player = new Player(playerDtoIn);
            player.setTeam(team);
            return player;
        }).toList();
        playerRepository.saveAll(players);
    }

    private void checkSort(String sort) throws BadRequestException {
        try {
            Team.class.getDeclaredField(sort);
        } catch (NoSuchFieldException e) {
            throw new BadRequestException("Invalid sort field");
        }

    }
}
