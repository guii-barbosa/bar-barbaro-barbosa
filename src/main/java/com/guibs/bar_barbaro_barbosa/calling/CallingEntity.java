package com.guibs.bar_barbaro_barbosa.calling;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.guibs.bar_barbaro_barbosa.adventurous.AdventurousEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="calling")
public class CallingEntity {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_calling")
    private long id;

    @Column(name="nm_calling")
    private String name;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @OneToMany(mappedBy="calling")
    @JsonIgnore
    private List<AdventurousEntity> adventurous;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
    }
}
