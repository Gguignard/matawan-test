package com.backend.Backend.controller.operations;

import com.backend.Backend.model.dto.in.TeamDtoIn;
import com.backend.Backend.model.dto.out.TeamDtoOut;
import jakarta.validation.Valid;
import org.apache.coyote.BadRequestException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/teams")
public interface TeamOperations {

    /**
     * Search teams
     *
     * @param sort  Sort field must be a field of Team entity
     * @param order Order must be 'asc' or 'desc'
     * @param page  Page number
     * @param size  page size
     * @return List of teams
     * @throws BadRequestException
     * @throws NoSuchFieldException
     */
    @GetMapping()
    ResponseEntity<List<TeamDtoOut>> searchTeams(@RequestParam(defaultValue = "name") String sort, @RequestParam(defaultValue = "asc") String order, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) throws BadRequestException, NoSuchFieldException;

    @PostMapping()
    ResponseEntity<TeamDtoOut> createTeam(@RequestBody @Valid TeamDtoIn teamDtoIn);

}

