package com.guibs.bar_barbaro_barbosa.rarity;

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

@Entity @Table(name="rarity")
public class Rarity {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_rarity")
    private Long id;

    @Column(name="nm_rarity")
    private String name;

    @OneToMany(mappedBy = "rarity")
    private List<Mission> missionList;

    
    @Column(name="dt_creation")
    private LocalDate createdAt;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
    }

 

}
