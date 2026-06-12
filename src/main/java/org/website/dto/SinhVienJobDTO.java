package org.website.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SinhVienJobDTO {
    private String soCMND;
    private String hoTen;
    private String maNganhTN;
    private String maTruongTN;
    private String maNganhCV;
    private String tenCongTy;
    private String thoiGianLamViec;
}
