package org.website.service;

import org.website.dto.SinhVienTotNghiepDTO;
import org.website.dto.SinhVienJobDTO;
import org.website.entity.SinhVien;
import java.util.List;

public interface SinhVienService {
    void saveSinhVienTotNghiep(SinhVienTotNghiepDTO dto) throws Exception;
    List<SinhVien> searchBasic(String soCMND, String hoTen, String email);
    List<SinhVienJobDTO> searchGraduationAndJob(String soCMND, String hoTen, String maTruong, String maNganh);
}
