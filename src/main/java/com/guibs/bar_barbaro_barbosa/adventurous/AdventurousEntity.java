package com.guibs.bar_barbaro_barbosa.adventurous;

import com.guibs.bar_barbaro_barbosa.calling.CallingEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter

@Entity @Table(name="adventurous")
public class AdventurousEntity {

        @Id
        @GeneratedValue(strategy =  GenerationType.SEQUENCE)
        @Column(name="id_adventurous")
        private long id;

        @Column(name="nm_adventurous")
        private String name;

        @Column(name="nm_nickname")
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

        @ManyToOne
        @JoinColumn(name="cd_calling")
        private CallingEntity calling;

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
