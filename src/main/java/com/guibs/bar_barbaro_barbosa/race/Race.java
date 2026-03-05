package com.guibs.bar_barbaro_barbosa.race;

import com.guibs.bar_barbaro_barbosa.affiliation.Affiliation;
import com.guibs.bar_barbaro_barbosa.attribute.Atributte;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDate;
import java.util.List;


@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="race")
public class Race {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name="id_race")
    private Long id;

    @Column(name="nm_race")
    private String name;

    @Column(name="ds_race")
    private String description;

    @OneToMany(mappedBy = "race")
    private List<Affiliation> affiliationList;

    @OneToMany(mappedBy = "race")
    private List<Atributte> atributteList;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
    }

}
