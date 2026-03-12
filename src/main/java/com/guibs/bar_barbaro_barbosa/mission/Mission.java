package com.guibs.bar_barbaro_barbosa.mission;

import com.guibs.bar_barbaro_barbosa.adventurous.Adventurous;
import com.guibs.bar_barbaro_barbosa.board.Board;
import com.guibs.bar_barbaro_barbosa.rarity.Rarity;
import com.guibs.bar_barbaro_barbosa.rune.Rune;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="mission")
public class Mission {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_mission")
    private Long id;

    @Column(name="nm_mission")
    private String name;

    @Column(name="dt_start")
    private LocalDate start;

    @Column(name="dt_end")
    private LocalDate end;

    @Column(name="nr_position")
    private Integer position;

    @ManyToOne
    @JoinColumn(name="cd_rarity")
    private Rarity rarity;

    @ManyToOne
    @JoinColumn(name="cd_board")
    private Board board;

    @ManyToOne
    @JoinColumn(name="cd_adventurous")
    private Adventurous adventurous;

    @ManyToOne
    @JoinColumn(name="cd_creator")
    private Adventurous creator;

    @ManyToMany
    @JoinTable(
            name="requirement",
            joinColumns = @JoinColumn(name="cd_mission"),
            inverseJoinColumns = @JoinColumn(name="cd_rune")
    )
    private List<Rune> runeList;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @Column(name="dt_update")
    private LocalDate updatedAt;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
        this.updatedAt = LocalDate.now();
    }

    @PreUpdate
    public void preUpdate(){
        this.updatedAt = LocalDate.now();
    }


}
