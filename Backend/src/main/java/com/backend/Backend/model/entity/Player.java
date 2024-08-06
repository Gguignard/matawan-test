package com.backend.Backend.model.entity;

import com.backend.Backend.model.dto.in.PlayerDtoIn;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@NoArgsConstructor
@Getter
@Setter
public class Player {

    @Id
    @GeneratedValue(generator = "UUID")
    private UUID uuid;
    private String name;
    private int age;
    private String position;

    @ManyToOne(fetch = FetchType.LAZY)
    private Team team;

    public Player(PlayerDtoIn playerDtoIn) {
        this.name = playerDtoIn.getName();
        this.age = playerDtoIn.getAge();
        this.position = playerDtoIn.getPosition();
    }

}
