package org.website.dto;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Data
public class SinhVienTotNghiepDTO {
    private String soCMND;
    private String hoTen;
    private String email;
    private String soDT;
    private String diaChi;

    private String maTruong;
    private String maNganh;
    private String heTN;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayTN;

    private String loaiTN;
}
