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

-- Seed data for SINHVIEN
INSERT IGNORE INTO SINHVIEN (SoCMND, HoTen, Email, SoDT, DiaChi) VALUES
('012345678901', 'Nguyễn Văn A', 'nguyena@gmail.com', '0912345678', '123 Đường Láng, Hà Nội'),
('012345678902', 'Trần Thị B', 'tranb@gmail.com', '0923456789', '456 Lê Lợi, Hải Phòng'),
('012345678903', 'Lê Văn C', 'levanc@gmail.com', '0934567890', '789 Nguyễn Văn Linh, Đà Nẵng'),
('012345678904', 'Phạm Thị D', 'phamd@gmail.com', '0945678901', '101 Nguyễn Huệ, TP Hồ Chí Minh'),
('012345678905', 'Hoàng Văn E', 'hoange@gmail.com', '0956789012', '202 Mậu Thân, Cần Thơ'),
('012345678906', 'Vũ Thị F', 'vuf@gmail.com', '0967890123', '303 Nguyễn Lương Bằng, Hải Dương'),
('012345678907', 'Đặng Văn G', 'dangg@gmail.com', '0978901234', '404 Trần Hưng Đạo, Nam Định'),
('012345678908', 'Bùi Thị H', 'buih@gmail.com', '0989012345', '505 Lê Lai, Thanh Hóa'),
('012345678909', 'Đỗ Văn I', 'doi@gmail.com', '0990123456', '606 Lê Lợi, Nghệ An'),
('012345678910', 'Ngô Thị K', 'ngok@gmail.com', '0901234567', '707 Hùng Vương, Huế'),
('012345678911', 'Lý Văn L', 'lyl@gmail.com', '0911223344', '808 Phan Châu Trinh, Quảng Nam'),
('012345678912', 'Dương Thị M', 'duongm@gmail.com', '0922334455', '909 Nguyễn Thái Học, Quy Nhơn, Bình Định'),
('012345678913', 'Lâm Văn N', 'lamn@gmail.com', '0933445566', '111 Trần Phú, Nha Trang, Khánh Hòa'),
('012345678914', 'Nguyễn Thị O', 'nguyeno@gmail.com', '0944556677', '222 Bùi Thị Xuân, Đà Lạt, Lâm Đồng'),
('012345678915', 'Trịnh Văn P', 'trinhp@gmail.com', '0955667788', '333 Nguyễn Ái Quốc, Biên Hòa, Đồng Nai');

-- Seed data for TOT_NGHIEP
INSERT IGNORE INTO TOT_NGHIEP (SoCMND, MaTruong, MaNganh, HeTN, NgayTN, LoaiTN) VALUES
('012345678901', 'DHBKHN', 'IT', 'Đại học chính quy', '2023-06-20', 'Giỏi'),
('012345678902', 'DHQGHN', 'CS', 'Đại học chính quy', '2023-06-25', 'Xuất sắc'),
('012345678903', 'KHTN', 'CS', 'Đại học chính quy', '2022-06-15', 'Khá'),
('012345678904', 'FPT', 'IT', 'Đại học chính quy', '2023-08-30', 'Giỏi'),
('012345678905', 'QNU', 'BA', 'Đại học chính quy', '2023-06-30', 'Trung bình'),
('012345678906', 'DHBKHN', 'CS', 'Đại học chính quy', '2023-06-20', 'Khá'),
('012345678907', 'DHQGHN', 'BA', 'Đại học chính quy', '2022-06-25', 'Giỏi'),
('012345678908', 'FPT', 'GD', 'Đại học chính quy', '2023-12-15', 'Khá'),
('012345678909', 'KHTN', 'IT', 'Đại học chính quy', '2023-06-15', 'Giỏi'),
('012345678910', 'QNU', 'GD', 'Đại học chính quy', '2023-06-30', 'Trung bình'),
-- Sinh viên tốt nghiệp nhiều ngành/nhiều trường
('012345678911', 'DHBKHN', 'IT', 'Đại học chính quy', '2023-06-20', 'Giỏi'),
('012345678911', 'FPT', 'GD', 'Đại học liên thông', '2024-05-15', 'Khá'),
('012345678912', 'DHQGHN', 'BA', 'Đại học chính quy', '2023-06-25', 'Xuất sắc'),
('012345678912', 'QNU', 'CS', 'Đại học chính quy', '2024-06-10', 'Giỏi'),
('012345678913', 'KHTN', 'IT', 'Đại học chính quy', '2022-06-15', 'Giỏi'),
('012345678914', 'FPT', 'BA', 'Đại học chính quy', '2023-08-30', 'Khá'),
('012345678915', 'QNU', 'IT', 'Đại học chính quy', '2023-06-30', 'Trung bình');

-- Seed data for CONG_VIEC
INSERT IGNORE INTO CONG_VIEC (SoCMND, NgayVaoCongTy, MaNganh, TenCongTy, TenCongViec, DiaChiCongTy, ThoiGianLamViec) VALUES
('012345678901', '2023-08-01', 'IT', 'FPT Software', 'Lập trình viên Java', 'Khu CNC Hòa Lạc, Hà Nội', '10 tháng'),
('012345678902', '2023-07-15', 'CS', 'Viettel Group', 'Kỹ sư AI', 'Trần Hữu Dực, Nam Từ Liêm, Hà Nội', '11 tháng'),
('012345678903', '2022-09-01', 'IT', 'VNG Corporation', 'Game Developer', 'Khu chế xuất Tân Thuận, Quận 7, TP HCM', '1 năm 9 tháng'),
('012345678904', '2023-10-01', 'IT', 'Shopee Vietnam', 'Software Engineer', 'Saigon Centre, Quận 1, TP HCM', '8 tháng'),
('012345678905', '2023-08-15', 'BA', 'Vingroup', 'Chuyên viên Nhân sự', 'Vinhomes Riverside, Long Biên, Hà Nội', '10 tháng'),
-- Sinh viên làm việc trái ngành
('012345678906', '2023-11-01', 'GD', 'Garena Vietnam', 'Game Master', 'Tòa nhà Saigon Centre, Quận 1, TP HCM', '7 tháng'),
('012345678907', '2022-08-01', 'IT', 'Teko Vietnam', 'Product Owner', 'Phố Duy Tân, Cầu Giấy, Hà Nội', '1 năm 10 tháng'),
('012345678908', '2024-01-02', 'GD', 'Be Group', 'UI/UX Designer', 'Tòa nhà Pearl Plaza, Bình Thạnh, TP HCM', '5 tháng'),
('012345678909', '2023-07-10', 'IT', 'FPT IS', 'Lập trình viên .NET', 'Tòa nhà FPT, Cầu Giấy, Hà Nội', '11 tháng'),
('012345678910', '2023-09-01', 'IT', 'Sun Asterisk', 'Frontend Developer', 'Tòa nhà Keangnam, Nam Từ Liêm, Hà Nội', '9 tháng'),
-- Sinh viên làm nhiều công việc
('012345678911', '2023-07-01', 'IT', 'CMC Global', 'Frontend Developer', 'Tòa nhà CMC, Cầu Giấy, Hà Nội', '11 tháng'),
('012345678911', '2024-01-15', 'GD', 'Design Agency A', 'Graphic Designer', 'Đường Cách Mạng Tháng 8, Quận 3, TP HCM', '5 tháng'),
('012345678912', '2023-08-01', 'BA', 'Grab Vietnam', 'Business Analyst', 'Tòa nhà Mapletree, Quận 7, TP HCM', '10 tháng');