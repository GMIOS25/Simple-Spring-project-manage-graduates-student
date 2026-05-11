package org.website.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "TRUONG")
@Data
public class Truong {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaTruong")
    String maTruong;
    @Column(name = "TenTruong", nullable = false)
    String tenTruong;
    @Column(name = "DiaChi")
    String diaChi;
    @Column(name = "SoDT")
    String soDT;
}
