package org.website.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.website.entity.TotNghiep;
import org.website.entity.TotNghiepId;

@Repository
public interface TotNghiepRepository extends JpaRepository<TotNghiep, TotNghiepId> {
}
