package com.backend.Backend.service;

import com.backend.Backend.dao.TeamRepository;
import com.backend.Backend.model.entity.Team;
import org.apache.coyote.BadRequestException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

public class TeamServiceTest {

    @Mock
    private TeamRepository teamRepository;
    @InjectMocks
    private TeamService teamService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }


    @Nested
    class GetTeamTestSuite {


        @Test
        void testSearchTeamsWithWrongOrder_ExpectedBadRequestException() {
            String sort = "name";
            String order = "test";
            int page = 0;
            int size = 10;
            assertThrows(BadRequestException.class, () -> teamService.searchTeams(sort, order, page, size));
        }

        @Test
        void testSearchTeamsWithWrongSortField_ExpectedNoSuchFieldException() {
            String sort = "test";
            String order = "asc";
            int page = 0;
            int size = 10;
            assertThrows(BadRequestException.class, () -> teamService.searchTeams(sort, order, page, size));
        }

        @Test
        void testSearchTeam() throws BadRequestException, NoSuchFieldException {
            String sort = "name";
            String order = "asc";
            int page = 0;
            int size = 10;
            Page<Team> teams = mock(Page.class);

            when(teamRepository.findAll(any(PageRequest.class))).thenReturn(teams);
            teamService.searchTeams(sort, order, page, size);
            verify(teamRepository).findAll(any(PageRequest.class));
        }

    }
}
