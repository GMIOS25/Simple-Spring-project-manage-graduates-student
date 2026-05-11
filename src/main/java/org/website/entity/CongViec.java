package org.website.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "CONG_VIEC")
@IdClass(CongViecId.class)
@Data
public class CongViec {

    @Id
    @Column(name = "SoCMND", length = 20)
    private String soCMND;

    @Id
    @Temporal(TemporalType.DATE)
    @Column(name = "NgayVaoCongTy")
    private Date ngayVaoCongTy;

    @Column(name = "MaNganh", length = 50)
    private String maNganh;

    @Column(name = "TenCongTy", length = 255)
    private String tenCongTy;

    @Column(name = "TenCongViec", length = 255)
    private String tenCongViec;

    @Column(name = "DiaChiCongTy", length = 255)
    private String diaChiCongTy;

    @Column(name = "ThoiGianLamViec", length = 100)
    private String thoiGianLamViec;
}