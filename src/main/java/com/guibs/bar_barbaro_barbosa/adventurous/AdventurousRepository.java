package com.guibs.bar_barbaro_barbosa.adventurous;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdventurousRepository extends JpaRepository<Adventurous, Long> {


}
