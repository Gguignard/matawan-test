package com.backend.Backend.model.dto.out;

import com.backend.Backend.model.entity.Player;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class PlayerDtoOut {
    private String name;
    private int age;
    private String position;

    public PlayerDtoOut(Player player) {
        this.name = player.getName();
        this.age = player.getAge();
        this.position = player.getPosition();
    }

}
