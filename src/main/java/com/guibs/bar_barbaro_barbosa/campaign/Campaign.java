package com.guibs.bar_barbaro_barbosa.campaign;

import com.guibs.bar_barbaro_barbosa.adventurous.Calling;
import com.guibs.bar_barbaro_barbosa.affiliation.Affiliation;
import com.guibs.bar_barbaro_barbosa.board.Board;
import com.guibs.bar_barbaro_barbosa.guild.Guild;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table (name="campaign")
public class Campaign {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_campaign")
    private Long id;

    @Column(name="nm_campaign")
    private String name;

    @Column(name="ds_guild")
    private String description;

    @ManyToOne
    @JoinColumn(name="cd_guild")
    private Guild guild;

    @OneToMany(mappedBy = "campaign")
    private List<Board> boardList;

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
