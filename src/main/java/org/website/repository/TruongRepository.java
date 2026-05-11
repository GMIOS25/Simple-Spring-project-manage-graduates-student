package org.website.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.website.entity.Truong;

@Repository
public interface TruongRepository extends JpaRepository<Truong, String> {
}
