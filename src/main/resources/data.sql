CREATE DATABASE IF NOT EXISTS student_management DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE student_management;

CREATE TABLE IF NOT EXISTS TRUONG (
                                      MaTruong VARCHAR(50) PRIMARY KEY,
    TenTruong VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    DiaChi VARCHAR(255) CHARACTER SET utf8mb4,
    SoDT VARCHAR(20)
    );

CREATE TABLE IF NOT EXISTS NGHANH (
                                      MaNganh VARCHAR(50) PRIMARY KEY,
    TenNganh VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    LoaiNganh VARCHAR(100) CHARACTER SET utf8mb4
    );

CREATE TABLE IF NOT EXISTS SINHVIEN (
                                        SoCMND VARCHAR(20) PRIMARY KEY,
    HoTen VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    Email VARCHAR(100),
    SoDT VARCHAR(20),
    DiaChi VARCHAR(255) CHARACTER SET utf8mb4
    );

CREATE TABLE IF NOT EXISTS TOT_NGHIEP (
                                          SoCMND VARCHAR(20),
    MaTruong VARCHAR(50),
    MaNganh VARCHAR(50),
    HeTN VARCHAR(50),
    NgayTN DATE,
    LoaiTN VARCHAR(50) CHARACTER SET utf8mb4,
    PRIMARY KEY (SoCMND, MaTruong, MaNganh),
    FOREIGN KEY (SoCMND) REFERENCES SINHVIEN(SoCMND),
    FOREIGN KEY (MaTruong) REFERENCES TRUONG(MaTruong),
    FOREIGN KEY (MaNganh) REFERENCES NGHANH(MaNganh)
    );

CREATE TABLE IF NOT EXISTS CONG_VIEC (
                                         SoCMND VARCHAR(20),
    NgayVaoCongTy DATE,
    MaNganh VARCHAR(50),
    TenCongTy VARCHAR(255) CHARACTER SET utf8mb4,
    TenCongViec VARCHAR(255) CHARACTER SET utf8mb4,
    DiaChiCongTy varchar(255) CHARACTER SET utf8mb4,
    ThoiGianLamViec VARCHAR(100) CHARACTER SET utf8mb4,
    PRIMARY KEY (SoCMND, NgayVaoCongTy),
    FOREIGN KEY (SoCMND) REFERENCES SINHVIEN(SoCMND),
    FOREIGN KEY (MaNganh) REFERENCES NGHANH(MaNganh)
    );

-- Seed data for comboboxes
INSERT IGNORE INTO TRUONG (MaTruong, TenTruong, DiaChi, SoDT) VALUES
('DHBKHN', 'Đại học Bách Khoa Hà Nội', '1 Đại Cồ Việt, Hà Nội', '02438694242'),
('DHQGHN', 'Đại học Quốc gia Hà Nội', '144 Xuân Thủy, Hà Nội', '02437547670'),
('KHTN', 'Đại học Khoa học Tự nhiên', '334 Nguyễn Trãi, Hà Nội', '02438584615'),
('FPT', 'Đại học FPT', 'Khu CNC Hòa Lạc, Hà Nội', '02473001866'),
('QNU', 'Đại học Quy Nhơn', '108 An Dương Vương, Quy Nhơn', '0347634432');

INSERT IGNORE INTO NGHANH (MaNganh, TenNganh, LoaiNganh) VALUES
('IT', 'Công nghệ thông tin', 'Kỹ thuật'),
('CS', 'Khoa học máy tính', 'Khoa học'),
('BA', 'Quản trị kinh doanh', 'Kinh tế'),
('GD', 'Thiết kế đồ họa', 'Nghệ thuật');