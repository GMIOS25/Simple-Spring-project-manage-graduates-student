package org.website.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.website.dto.SinhVienTotNghiepDTO;
import org.website.dto.SinhVienJobDTO;
import org.website.entity.SinhVien;
import org.website.repository.NganhRepository;
import org.website.repository.TruongRepository;
import org.website.service.SinhVienService;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/sinhvien")
public class SinhVienController {
    @Autowired
    private TruongRepository truongRepository;

    @Autowired
    private NganhRepository nganhRepository;

    @Autowired
    private SinhVienService sinhVienService;

    @GetMapping("/form")
    public String showForm(Model model) {
        model.addAttribute("truongList", truongRepository.findAll());
        model.addAttribute("nganhList", nganhRepository.findAll());
        if (!model.containsAttribute("sinhVienDto")) {
            model.addAttribute("sinhVienDto", new SinhVienTotNghiepDTO());
        }
        model.addAttribute("contentPage", "/WEB-INF/views/sinhvien/form.jsp");
        return "common/layout";
    }

    @PostMapping("/save")
    public String saveSinhVien(SinhVienTotNghiepDTO dto, Model model, RedirectAttributes redirectAttributes) {
        boolean hasError = false;
        
        // Validation thủ công theo yêu cầu
        if (dto.getSoCMND() == null || dto.getSoCMND().trim().isEmpty()) {
            model.addAttribute("errorSoCMND", "Số CMND bắt buộc nhập");
            hasError = true;
        }
        if (dto.getMaTruong() == null || dto.getMaTruong().trim().isEmpty()) {
            model.addAttribute("errorMaTruong", "Trường bắt buộc chọn");
            hasError = true;
        }
        if (dto.getMaNganh() == null || dto.getMaNganh().trim().isEmpty()) {
            model.addAttribute("errorMaNganh", "Ngành bắt buộc chọn");
            hasError = true;
        }
        if (dto.getNgayTN() == null) {
            model.addAttribute("errorNgayTN", "Ngày tốt nghiệp bắt buộc nhập và phải đúng định dạng yyyy-MM-dd");
            hasError = true;
        } else if (dto.getNgayTN().after(new Date())) {
            model.addAttribute("errorNgayTN", "Ngày tốt nghiệp không được lớn hơn ngày hiện tại");
            hasError = true;
        }

        if (hasError) {
            model.addAttribute("truongList", truongRepository.findAll());
            model.addAttribute("nganhList", nganhRepository.findAll());
            model.addAttribute("sinhVienDto", dto);
            model.addAttribute("contentPage", "/WEB-INF/views/sinhvien/form.jsp");
            return "common/layout";
        }

        try {
            sinhVienService.saveSinhVienTotNghiep(dto);
            redirectAttributes.addFlashAttribute("message", "Khai báo thông tin tốt nghiệp thành công!");
            return "redirect:/sinhvien/form";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
            model.addAttribute("truongList", truongRepository.findAll());
            model.addAttribute("nganhList", nganhRepository.findAll());
            model.addAttribute("sinhVienDto", dto);
            model.addAttribute("contentPage", "/WEB-INF/views/sinhvien/form.jsp");
            return "common/layout";
        }
    }

    @GetMapping("/search/basic")
    public String searchBasic(
            @RequestParam(value = "soCMND", required = false, defaultValue = "") String soCMND,
            @RequestParam(value = "hoTen", required = false, defaultValue = "") String hoTen,
            @RequestParam(value = "email", required = false, defaultValue = "") String email,
            Model model) {
        List<SinhVien> list = sinhVienService.searchBasic(soCMND, hoTen, email);
        model.addAttribute("results", list);
        model.addAttribute("soCMND", soCMND);
        model.addAttribute("hoTen", hoTen);
        model.addAttribute("email", email);
        model.addAttribute("contentPage", "/WEB-INF/views/sinhvien/search_basic.jsp");
        return "common/layout";
    }

    @GetMapping("/search/details")
    public String searchDetails(
            @RequestParam(value = "soCMND", required = false, defaultValue = "") String soCMND,
            @RequestParam(value = "hoTen", required = false, defaultValue = "") String hoTen,
            @RequestParam(value = "maTruong", required = false, defaultValue = "") String maTruong,
            @RequestParam(value = "maNganh", required = false, defaultValue = "") String maNganh,
            Model model) {
        List<SinhVienJobDTO> list = sinhVienService.searchGraduationAndJob(soCMND, hoTen, maTruong, maNganh);
        model.addAttribute("results", list);
        model.addAttribute("soCMND", soCMND);
        model.addAttribute("hoTen", hoTen);
        model.addAttribute("maTruong", maTruong);
        model.addAttribute("maNganh", maNganh);
        model.addAttribute("truongList", truongRepository.findAll());
        model.addAttribute("nganhList", nganhRepository.findAll());
        model.addAttribute("contentPage", "/WEB-INF/views/sinhvien/search_details.jsp");
        return "common/layout";
    }
}
