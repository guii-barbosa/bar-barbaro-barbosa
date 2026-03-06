package com.guibs.bar_barbaro_barbosa.rune;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RuneRepository extends JpaRepository<Rune, Long> {
}
