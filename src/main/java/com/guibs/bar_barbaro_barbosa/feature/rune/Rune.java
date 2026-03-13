package com.guibs.bar_barbaro_barbosa.feature.rune;


import com.guibs.bar_barbaro_barbosa.feature.guild.Guild;
import com.guibs.bar_barbaro_barbosa.feature.mission.Mission;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="rune")
public class Rune {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_rune")
    private Long id;

    @Column(name="nm_rune")
    private String name;

    @Column(name="lk_image")
    private String url;

    @Column(name="ds_color")
    private String color;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @ManyToOne
    @JoinColumn(name="cd_guild")
    private Guild guild;

    @ManyToMany(mappedBy = "runeList")
    private List<Mission> missionList;

    @PrePersist
    public void prePersist(){
        this.createdAt = LocalDate.now();
    }


}
