# Di chuyển dự án từ JSP sang Thymeleaf

Tài liệu này mô tả kế hoạch chuyển đổi View Engine từ JSP sang Thymeleaf trong dự án Spring MVC hiện tại.

## User Review Required

> [!IMPORTANT]
> Cần đảm bảo rằng bạn đã cập nhật file `pom.xml` thành công với dependency `thymeleaf-spring6` (đã được lưu trước đó).
> Chúng tôi sẽ xóa hoàn toàn các file JSP cũ (`index.jsp` và `form.jsp`) và thay thế bằng các file HTML của Thymeleaf (`index.html` và `form.html`).

## Proposed Changes

### Configuration Component

#### [MODIFY] [WebMvcConfig.java](file:///d:/CODES/Java/Inteliji/Website/src/main/java/org/website/config/WebMvcConfig.java)
- Loại bỏ bean `InternalResourceViewResolver` (của JSP).
- Khai báo các bean cấu hình của Thymeleaf:
  - `SpringResourceTemplateResolver`
  - `SpringTemplateEngine`
  - `ThymeleafViewResolver`
- Cần `@Autowired` hoặc sử dụng `ApplicationContext` để khởi tạo `SpringResourceTemplateResolver`.

---

### View Component

#### [DELETE] [index.jsp](file:///d:/CODES/Java/Inteliji/Website/src/main/webapp/index.jsp)
- Xóa file JSP trang chủ tĩnh cũ.

#### [NEW] [index.html](file:///d:/CODES/Java/Inteliji/Website/src/main/webapp/index.html)
- Tạo file HTML tĩnh trang chủ mới tại thư mục gốc của webapp để Tomcat phục vụ trực tiếp.

#### [DELETE] [form.jsp](file:///d:/CODES/Java/Inteliji/Website/src/main/webapp/WEB-INF/views/form.jsp)
- Xóa file JSP form khai báo cũ chứa mã JSTL.

#### [NEW] [form.html](file:///d:/CODES/Java/Inteliji/Website/src/main/webapp/WEB-INF/views/form.html)
- Tạo file Thymeleaf HTML mới tương ứng sử dụng các thẻ và cú pháp của Thymeleaf (`th:object`, `th:field`, `th:if`, `th:each`, `th:action`).

---

## Verification Plan

### Automated Tests
- Chạy lệnh `mvn clean compile` để kiểm tra dự án biên dịch thành công mà không có lỗi cú pháp hoặc thiếu thư viện.

### Manual Verification
- Sau khi được phê duyệt, người dùng có thể chạy ứng dụng trên Tomcat (qua IntelliJ IDEA) và truy cập `http://localhost:8080/Website/sinhvien/form` để kiểm tra giao diện và luồng hoạt động của Form Khai Báo.
