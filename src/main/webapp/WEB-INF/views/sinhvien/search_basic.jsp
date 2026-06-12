<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<main class="flex-grow-1 d-flex flex-column py-5">
    <div class="container">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap');
            
            .search-title {
                font-family: 'Outfit', sans-serif;
                font-weight: 700;
                color: #2b3e50;
                letter-spacing: -0.5px;
            }

            .glass-card {
                background: rgba(255, 255, 255, 0.9);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.25);
                border-radius: 16px;
                box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.08);
            }

            .form-label {
                font-family: 'Outfit', sans-serif;
                font-weight: 600;
                color: #5c6b73;
                font-size: 0.9rem;
            }

            .form-control {
                border-radius: 10px;
                padding: 10px 15px;
                border: 1px solid #ced4da;
                transition: all 0.3s ease;
            }

            .form-control:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.15);
            }

            .btn-search {
                border-radius: 10px;
                font-family: 'Outfit', sans-serif;
                font-weight: 600;
                padding: 10px 24px;
                transition: all 0.3s ease;
            }

            .btn-search:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(13, 110, 253, 0.2);
            }

            .table-container {
                margin-top: 30px;
                border-radius: 16px;
                overflow: hidden;
                box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.08);
            }

            .table {
                margin-bottom: 0;
            }

            .table thead {
                background: linear-gradient(135deg, #0d6efd, #0b5ed7);
                color: white;
            }

            .table th {
                font-family: 'Outfit', sans-serif;
                font-weight: 600;
                padding: 15px;
                border: none;
            }

            .table td {
                padding: 15px;
                vertical-align: middle;
            }

            .table-hover tbody tr:hover {
                background-color: rgba(13, 110, 253, 0.04);
                transition: background-color 0.3s ease;
            }

            .badge-cmnd {
                background-color: #e9ecef;
                color: #495057;
                font-weight: 600;
                padding: 6px 12px;
                border-radius: 6px;
                font-size: 0.85rem;
            }
        </style>

        <div class="row justify-content-center">
            <div class="col-lg-10">
                <!-- Header -->
                <div class="text-center mb-5">
                    <h2 class="search-title">Tìm Kiếm Thông Tin Cơ Bản Sinh Viên</h2>
                    <p class="text-muted">Nhập các điều kiện dưới đây để tra cứu nhanh thông tin liên lạc của sinh viên</p>
                </div>

                <!-- Form Card -->
                <div class="card glass-card p-4">
                    <form action="${pageContext.request.contextPath}/sinhvien/search/basic" method="get">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label for="soCMND" class="form-label">Số CMND</label>
                                <input type="text" class="form-control" id="soCMND" name="soCMND" placeholder="Nhập số CMND..." value="${soCMND}">
                            </div>
                            <div class="col-md-4">
                                <label for="hoTen" class="form-label">Họ Tên</label>
                                <input type="text" class="form-control" id="hoTen" name="hoTen" placeholder="Nhập họ tên..." value="${hoTen}">
                            </div>
                            <div class="col-md-4">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" class="form-control" id="email" name="email" placeholder="Nhập email..." value="${email}">
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <button type="submit" class="btn btn-primary btn-search px-5">Tìm Kiếm</button>
                            <a href="${pageContext.request.contextPath}/sinhvien/search/basic" class="btn btn-outline-secondary btn-search ms-2">Làm Mới</a>
                        </div>
                    </form>
                </div>

                <!-- Results Section -->
                <c:choose>
                    <c:when test="${not empty results}">
                        <div class="table-container bg-white">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th>Số CMND</th>
                                            <th>Họ và Tên</th>
                                            <th>Email</th>
                                            <th>Số Điện Thoại</th>
                                            <th>Địa Chỉ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="sv" items="${results}">
                                            <tr>
                                                <td><span class="badge-cmnd">${sv.soCMND}</span></td>
                                                <td class="fw-semibold text-dark">${sv.hoTen}</td>
                                                <td><a href="mailto:${sv.email}" class="text-decoration-none">${sv.email}</a></td>
                                                <td class="text-secondary">${sv.soDT}</td>
                                                <td class="text-secondary text-truncate" style="max-width: 250px;" title="${sv.diaChi}">${sv.diaChi}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-info text-center mt-5 glass-card py-4" role="alert">
                            <i class="fs-4 mb-2 d-block">🔍</i>
                            <span>Không tìm thấy kết quả phù hợp. Vui lòng thử lại với từ khóa khác!</span>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</main>
