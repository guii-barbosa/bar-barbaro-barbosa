package com.guibs.bar_barbaro_barbosa.feature.artefact;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ResourceRepository extends JpaRepository<Artefact, Long> {
}
