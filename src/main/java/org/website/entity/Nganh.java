package org.website.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "NGHANH")
@Data
public class Nganh {
    @Id
    @Column(name = "MaNganh")
    String maNganh;
    @Column(name = "TenNganh")
    String tenNganh;
    @Column(name = "LoaiNganh")
    String loaiNganh;
}
