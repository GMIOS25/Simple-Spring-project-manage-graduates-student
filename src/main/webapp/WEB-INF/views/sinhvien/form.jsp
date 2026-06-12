<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!-- Main Content -->
<main class="flex-grow-1 d-flex flex-column">
    <div class="container form-container">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .form-container {
                max-width: 800px;
                margin-top: 30px;
                margin-bottom: 50px;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
            }
            .form-container h2 {
                color: #0d6efd;
                margin-bottom: 20px;
                text-align: center;
            }
            .form-section {
                background-color: #f1f8ff;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
                border-left: 4px solid #0d6efd;
            }
            .form-section h4 {
                color: #0d6efd;
                margin-bottom: 15px;
                font-size: 1.2rem;
            }
            .error {
                color: red;
                font-size: 0.875rem;
                margin-top: 5px;
            }
        </style>
        <h2>Khai Báo Thông Tin Tốt Nghiệp</h2>

        <%-- Thông báo thành công --%>
        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <span>${message}</span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <%-- Thông báo lỗi hệ thống --%>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <span>${errorMessage}</span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/sinhvien/save" method="post">

            <%-- Thông tin sinh viên --%>
            <div class="form-section">
                <h4>Thông Tin Sinh Viên</h4>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="soCMND" class="form-label">Số CMND <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="soCMND" name="soCMND" value="${sinhVienDto.soCMND}">
                        <c:if test="${not empty errorSoCMND}">
                            <div class="error">${errorSoCMND}</div>
                        </c:if>
                    </div>
                    <div class="col-md-6">
                        <label for="hoTen" class="form-label">Họ Tên</label>
                        <input type="text" class="form-control" id="hoTen" name="hoTen" value="${sinhVienDto.hoTen}">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sinhVienDto.email}">
                    </div>
                    <div class="col-md-6">
                        <label for="soDT" class="form-label">Số Điện Thoại</label>
                        <input type="text" class="form-control" id="soDT" name="soDT" value="${sinhVienDto.soDT}">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="diaChi" class="form-label">Địa Chỉ</label>
                    <input type="text" class="form-control" id="diaChi" name="diaChi" value="${sinhVienDto.diaChi}">
                </div>
            </div>

            <%-- Thông tin tốt nghiệp --%>
            <div class="form-section">
                <h4>Thông Tin Tốt Nghiệp</h4>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="maTruong" class="form-label">Trường Tốt Nghiệp <span class="text-danger">*</span></label>
                        <select class="form-select" id="maTruong" name="maTruong">
                            <option value="">-- Chọn trường --</option>
                            <c:forEach var="truong" items="${truongList}">
                                <option value="${truong.maTruong}" ${sinhVienDto.maTruong == truong.maTruong ? 'selected' : ''}>${truong.tenTruong}</option>
                            </c:forEach>
                        </select>
                        <c:if test="${not empty errorMaTruong}">
                            <div class="error">${errorMaTruong}</div>
                        </c:if>
                    </div>
                    <div class="col-md-6">
                        <label for="maNganh" class="form-label">Ngành Tốt Nghiệp <span class="text-danger">*</span></label>
                        <select class="form-select" id="maNganh" name="maNganh">
                            <option value="">-- Chọn ngành --</option>
                            <c:forEach var="nganh" items="${nganhList}">
                                <option value="${nganh.maNganh}" ${sinhVienDto.maNganh == nganh.maNganh ? 'selected' : ''}>${nganh.tenNganh}</option>
                            </c:forEach>
                        </select>
                        <c:if test="${not empty errorMaNganh}">
                            <div class="error">${errorMaNganh}</div>
                        </c:if>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="heTN" class="form-label">Hệ Tốt Nghiệp</label>
                        <input type="text" class="form-control" id="heTN" name="heTN" value="${sinhVienDto.heTN}">
                    </div>
                    <div class="col-md-4">
                        <label for="ngayTN" class="form-label">Ngày Tốt Nghiệp <span class="text-danger">*</span></label>
                        <input type="date" class="form-control" id="ngayTN" name="ngayTN"
                               value="<fmt:formatDate value='${sinhVienDto.ngayTN}' pattern='yyyy-MM-dd'/>">
                        <c:if test="${not empty errorNgayTN}">
                            <div class="error">${errorNgayTN}</div>
                        </c:if>
                    </div>
                    <div class="col-md-4">
                        <label for="loaiTN" class="form-label">Loại Tốt Nghiệp</label>
                        <select class="form-select" id="loaiTN" name="loaiTN">
                            <option value="Xuất sắc" ${sinhVienDto.loaiTN == 'Xuất sắc' ? 'selected' : ''}>Xuất sắc</option>
                            <option value="Giỏi" ${sinhVienDto.loaiTN == 'Giỏi' ? 'selected' : ''}>Giỏi</option>
                            <option value="Khá" ${sinhVienDto.loaiTN == 'Khá' ? 'selected' : ''}>Khá</option>
                            <option value="Trung bình" ${sinhVienDto.loaiTN == 'Trung bình' ? 'selected' : ''}>Trung bình</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary px-5">Lưu Thông Tin</button>
                <button type="reset" class="btn btn-secondary px-4 ms-2">Nhập Lại</button>
            </div>
        </form>
    </div>
</main>
