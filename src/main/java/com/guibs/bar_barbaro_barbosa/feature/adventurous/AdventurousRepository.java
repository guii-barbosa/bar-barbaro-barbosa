package com.guibs.bar_barbaro_barbosa.feature.adventurous;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdventurousRepository extends JpaRepository<Adventurous, Long> {

    Page<Adventurous> findAll(Pageable pageable);

    Page<Adventurous> findByCalling(Calling calling, Pageable pageable);
}
