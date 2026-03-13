package com.guibs.bar_barbaro_barbosa.feature.affiliation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AffiliationRepository extends JpaRepository<Affiliation, Long> {
}
