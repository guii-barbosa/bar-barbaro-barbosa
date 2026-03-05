package com.guibs.bar_barbaro_barbosa.ability;

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

@Entity @Table(name="ability")
public class Ability {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_ability")
    private Long id;

    @Column(name="nm_ability")
    private String name;

    @OneToMany(mappedBy = "ability")
    private List<Atributte> atributteList;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
    }
}
