package com.guibs.bar_barbaro_barbosa.feature.affiliation;

import com.guibs.bar_barbaro_barbosa.feature.adventurous.Adventurous;
import com.guibs.bar_barbaro_barbosa.feature.guild.Guild;
import com.guibs.bar_barbaro_barbosa.feature.race.Race;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="affiliation")
public class Affiliation {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_affiliation")
    private Long id;

    @ManyToOne
    @JoinColumn(name="id_race")
    private Race race;

    @ManyToOne
    @JoinColumn(name="id_adventurous")
    private Adventurous adventurous;

    @ManyToOne
    @JoinColumn(name="id_guild")
    private Guild guild;

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
