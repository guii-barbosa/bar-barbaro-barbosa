package com.guibs.bar_barbaro_barbosa.feature.attribute;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AttributeRepository extends JpaRepository<Atributte, Long> {
}
