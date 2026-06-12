package org.website.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.website.dto.SinhVienTotNghiepDTO;
import org.website.dto.SinhVienJobDTO;
import org.website.entity.SinhVien;
import org.website.entity.TotNghiep;
import org.website.repository.SinhVienRepository;
import org.website.repository.TotNghiepRepository;
import org.website.service.SinhVienService;
import java.util.List;
import java.util.ArrayList;

@Service
public class SinhVienServiceImpl implements SinhVienService {

    @Autowired
    private SinhVienRepository sinhVienRepository;

    @Autowired
    private TotNghiepRepository totNghiepRepository;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveSinhVienTotNghiep(SinhVienTotNghiepDTO dto) throws Exception {
        // Lưu Sinh viên nếu chưa tồn tại hoặc cập nhật nếu đã có
        SinhVien sv = sinhVienRepository.findById(dto.getSoCMND()).orElse(new SinhVien());
        sv.setSoCMND(dto.getSoCMND());
        sv.setHoTen(dto.getHoTen());
        sv.setEmail(dto.getEmail());
        sv.setSoDT(dto.getSoDT());
        sv.setDiaChi(dto.getDiaChi());
        sinhVienRepository.save(sv);

        // Lưu thông tin tốt nghiệp
        TotNghiep tn = new TotNghiep();
        tn.setSoCMND(dto.getSoCMND());
        tn.setMaTruong(dto.getMaTruong());
        tn.setMaNganh(dto.getMaNganh());
        tn.setHeTN(dto.getHeTN());
        tn.setNgayTN(dto.getNgayTN());
        tn.setLoaiTN(dto.getLoaiTN());
        totNghiepRepository.save(tn);
    }

    @Override
    public List<SinhVien> searchBasic(String soCMND, String hoTen, String email) {
        return sinhVienRepository.searchBasic(soCMND, hoTen, email);
    }

    @Override
    public List<SinhVienJobDTO> searchGraduationAndJob(String soCMND, String hoTen, String maTruong, String maNganh) {
        List<Object[]> queryResults = sinhVienRepository.searchGraduationAndJobNative(soCMND, hoTen, maTruong, maNganh);
        List<SinhVienJobDTO> list = new ArrayList<>();
        for (Object[] row : queryResults) {
            SinhVienJobDTO dto = new SinhVienJobDTO(
                (String) row[0],
                (String) row[1],
                (String) row[2],
                (String) row[3],
                (String) row[4],
                (String) row[5],
                (String) row[6]
            );
            list.add(dto);
        }
        return list;
    }
}
