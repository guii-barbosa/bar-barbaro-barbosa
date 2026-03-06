package com.guibs.bar_barbaro_barbosa.adventurous;

import com.guibs.bar_barbaro_barbosa.affiliation.Affiliation;
import com.guibs.bar_barbaro_barbosa.guild.Guild;
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

@Entity @Table(name="adventurous")
public class Adventurous {

        @Id
        @GeneratedValue(strategy =  GenerationType.SEQUENCE)
        @Column(name="id_adventurous")
        private Long id;

        @Column(name="nm_adventurous")
        private String name;

        @Column(name="nm_alias")
        private String nickname;

        @Column(name="ds_email")
        private String email;

        @Column(name="ds_pswd")
        private String password;

        @Column(name="ds_country")
        private String country;

        @Column(name="dt_creation")
        private LocalDate createdAt;

        @Column(name="dt_update")
        private LocalDate updatedAt;

        @Column(name="dt_desativation")
        private LocalDate deletedAt;

        @Enumerated(EnumType.ORDINAL)
        @Column(name="cd_calling")
        private Calling calling;

        @OneToMany(mappedBy = "creator")
        private List<Guild> guildList;

        @OneToMany(mappedBy = "adventurous")
        private List<Affiliation> affiliationList;

        @OneToMany(mappedBy = "adventurous")
        private List<Mission> missionAssignedList;

        @OneToMany(mappedBy = "creator")
        private List<Mission> missionCreatedList;

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
