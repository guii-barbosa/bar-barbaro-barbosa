package com.guibs.bar_barbaro_barbosa.attribute;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AttributeRepository extends JpaRepository<Atributte, Long> {
}
