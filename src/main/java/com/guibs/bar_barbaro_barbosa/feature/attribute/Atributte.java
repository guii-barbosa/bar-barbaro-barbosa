package com.guibs.bar_barbaro_barbosa.feature.attribute;

import com.guibs.bar_barbaro_barbosa.feature.ability.Ability;
import com.guibs.bar_barbaro_barbosa.feature.race.Race;
import com.guibs.bar_barbaro_barbosa.feature.artefact.Artefact;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter

@Entity
@Table(name="atributte")
public class Atributte {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="cd_artefact")
    private Long id;

    @ManyToOne
    @JoinColumn(name="cd_race")
    private Race race;

    @ManyToOne
    @JoinColumn(name="cd_resource")
    private Artefact resource;

    @ManyToOne
    @JoinColumn(name="cd_ability")
    private Ability ability;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
    }

}
