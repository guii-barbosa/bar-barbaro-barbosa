package com.guibs.bar_barbaro_barbosa.artefact;

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

@Entity @Table(name="artefact")
public class Artefact {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_artefact")
    private Long id;

    @Column(name="nm_artefact")
    private String name;

    @OneToMany(mappedBy = "resource")
    private List<Atributte> atributteList;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
    }

}
