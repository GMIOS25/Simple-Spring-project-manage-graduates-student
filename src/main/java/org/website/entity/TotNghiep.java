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
@Table(name = "TOT_NGHIEP")
@IdClass(TotNghiepId.class)
@Data
public class TotNghiep {

    @Id
    @Column(name = "SoCMND", length = 20)
    private String soCMND;

    @Id
    @Column(name = "MaTruong", length = 50)
    private String maTruong;

    @Id
    @Column(name = "MaNganh", length = 50)
    private String maNganh;

    @Column(name = "HeTN", length = 50)
    private String heTN;

    @Temporal(TemporalType.DATE)
    @Column(name = "NgayTN")
    private Date ngayTN;

    @Column(name = "LoaiTN", length = 50)
    private String loaiTN;
}