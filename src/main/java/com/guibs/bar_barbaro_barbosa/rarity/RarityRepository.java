package com.guibs.bar_barbaro_barbosa.rarity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RarityRepository extends JpaRepository<Rarity, Long> {
}
