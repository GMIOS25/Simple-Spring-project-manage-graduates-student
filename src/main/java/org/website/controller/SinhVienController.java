package org.website.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.website.dto.SinhVienTotNghiepDTO;
import org.website.repository.NganhRepository;
import org.website.repository.TruongRepository;
import org.website.service.SinhVienService;

import java.util.Date;

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
        return "form";
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
            return "form";
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
            return "form";
        }
    }
}
