package com.guibs.bar_barbaro_barbosa.board;

import com.guibs.bar_barbaro_barbosa.campaign.Campaign;
import com.guibs.bar_barbaro_barbosa.mission.Mission;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="board")
public class Board {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_board")
    private Long id;

    @Column(name="nm_board")
    private String name;

    @Column(name="ds_board")
    private String description;

    @Column(name="nr_position")
    private Integer position;

    @ManyToOne
    @JoinColumn(name="cd_campaign")
    private Campaign campaign;

    @OneToMany(mappedBy = "board")
    private List<Mission> missionList;

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

