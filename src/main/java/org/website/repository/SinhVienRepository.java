package org.website.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.website.entity.SinhVien;
import java.util.List;

@Repository
public interface SinhVienRepository extends JpaRepository<SinhVien, String> {
    @Query("SELECT s FROM SinhVien s WHERE " +
           "(:soCMND IS NULL OR :soCMND = '' OR s.soCMND LIKE %:soCMND%) AND " +
           "(:hoTen IS NULL OR :hoTen = '' OR LOWER(s.hoTen) LIKE LOWER(CONCAT('%', :hoTen, '%'))) AND " +
           "(:email IS NULL OR :email = '' OR LOWER(s.email) LIKE LOWER(CONCAT('%', :email, '%')))")
    List<SinhVien> searchBasic(
        @Param("soCMND") String soCMND,
        @Param("hoTen") String hoTen,
        @Param("email") String email
    );

    @Query(value = "SELECT s.SoCMND, s.HoTen, t.MaNganh as maNganhTN, t.MaTruong as maTruongTN, c.MaNganh as maNganhCV, c.TenCongTy, c.ThoiGianLamViec " +
                   "FROM SINHVIEN s " +
                   "LEFT JOIN TOT_NGHIEP t ON s.SoCMND = t.SoCMND " +
                   "LEFT JOIN CONG_VIEC c ON s.SoCMND = c.SoCMND " +
                   "WHERE (:soCMND IS NULL OR :soCMND = '' OR s.SoCMND LIKE CONCAT('%', :soCMND, '%')) " +
                   "AND (:hoTen IS NULL OR :hoTen = '' OR LOWER(s.HoTen) LIKE LOWER(CONCAT('%', :hoTen, '%'))) " +
                   "AND (:maTruong IS NULL OR :maTruong = '' OR t.MaTruong = :maTruong) " +
                   "AND (:maNganhTN IS NULL OR :maNganhTN = '' OR t.MaNganh = :maNganhTN)", nativeQuery = true)
    List<Object[]> searchGraduationAndJobNative(
        @Param("soCMND") String soCMND,
        @Param("hoTen") String hoTen,
        @Param("maTruong") String maTruong,
        @Param("maNganhTN") String maNganhTN
    );
}
