package org.website.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.website.entity.Nganh;

@Repository
public interface NganhRepository extends JpaRepository<Nganh, String> {
}
