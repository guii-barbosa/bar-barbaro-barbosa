package com.guibs.bar_barbaro_barbosa.feature.guild;

import com.guibs.bar_barbaro_barbosa.feature.adventurous.Adventurous;
import com.guibs.bar_barbaro_barbosa.feature.affiliation.Affiliation;
import com.guibs.bar_barbaro_barbosa.feature.campaign.Campaign;
import com.guibs.bar_barbaro_barbosa.feature.rune.Rune;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="guild")
public class Guild {

    @Id
    @GeneratedValue(strategy =  GenerationType.SEQUENCE)
    @Column(name="id_guild")
    private Long id;

    @Column(name="nm_guild")
    private String name;

    @Column(name="ds_guild")
    private String description;

    @ManyToOne
    @JoinColumn(name="cd_adventurous")
    private Adventurous creator;

    @OneToMany(mappedBy="guild")
    private List<Affiliation> affiliationList;

    @OneToMany(mappedBy="guild")
    private List<Campaign> campaignList;

    @OneToMany(mappedBy ="guild")
    private List<Rune> runeList;

    @Column(name="dt_creation")
    private LocalDate createdAt;

    @Column(name="dt_update")
    private LocalDate updatedAt;

    @Column(name="dt_desativation")
    private LocalDate deletedAt;

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
