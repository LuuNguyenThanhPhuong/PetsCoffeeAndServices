package Travel.vietnam.Controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Travel.vietnam.DAO.NhanVienDAO;
import Travel.vietnam.Entity.NhanVien;
import Travel.vietnam.service.SessionService;
import Travel.vietnam.service.UploadService;
import Travel.vietnam.utils.StrUtils;

@Controller
public class NhanVienAdminController {

	@Autowired
	NhanVienDAO nhanviendao;
	@Autowired
	UploadService upload;
	@Autowired
	SessionService session;

	@RequestMapping("/admin/qlnhanvien/index")
	public String index(Model model, HttpServletRequest request) {
		model.addAttribute("form", new NhanVien());
		model.addAttribute("items", nhanviendao.getAllNhanVien(false));
		model.addAttribute("trashitems", nhanviendao.getAllNhanVien(true));
		model.addAttribute("botay", "collapse");
		String messageok = request.getParameter("messageok");
		String messagefail = request.getParameter("messagefail");
		String messageerror = request.getParameter("messageerror");
		if (messagefail != null) {
			request.setAttribute("message", messagefail);
			request.setAttribute("fail", "myModalfail");
		}
		if (messageok != null) {
			request.setAttribute("message", messageok);
			request.setAttribute("ok", "myModal");
		}
		if (messageerror != null) {
			request.setAttribute("message", messageerror);
			request.setAttribute("error", "myModalerror");
		}
		return "admin/qlnhanvien/index";
	}

	@RequestMapping("/admin/qlnhanvien/edit/{maNhanVien}")
	public String edit(Model model, @PathVariable("maNhanVien") String maNhanVien) {
		model.addAttribute("form", nhanviendao.getOne(maNhanVien));
		model.addAttribute("items", nhanviendao.getAllNhanVien(false));
		model.addAttribute("trashitems", nhanviendao.getAllNhanVien(true));
		model.addAttribute("botay", "collapse show");
		return "admin/qlnhanvien/index";
	}

	@RequestMapping("/admin/qlnhanvien/create")
	public String create(Model model, NhanVien entity, @RequestParam("photo_file") MultipartFile photo) {
		String message = "";
		try {
			if (nhanviendao.existsById(entity.getMaNhanVien())) {
				message = "Tài khoản đã tồn tại!";
				return "redirect:/admin/qlnhanvien/index?messagefail=" + StrUtils.encodeUrl(message);

			} else {
				File file = upload.save(photo, "/static/images/photos/");
				if (file != null) {
					entity.setHinh(file.getName());
				}
				entity.setIsDelete(false);
				nhanviendao.save(entity);
				message = "Tạo mới Thành Công!";
			}
		} catch (Exception e) {
			message = "Tạo mới Thất Bại";
			return "redirect:/admin/qlnhanvien/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlnhanvien/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qlnhanvien/update")
	public String update(Model model, NhanVien entity, @RequestParam("photo_file") MultipartFile photo) {
		String message = "";
		try {
			if (!nhanviendao.existsById(entity.getMaNhanVien())) {
				message = "Tài khoản không tồn tại!";
				return "redirect:/admin/qlnhanvien/index?messageerror=" + StrUtils.encodeUrl(message);
			} else {
				File file = upload.save(photo, "/static/images/photos/");
				if (file != null) {
					entity.setHinh(file.getName());
				}
				entity.setIsDelete(false);
				nhanviendao.save(entity);
				message = "Cập nhật thành công!";
			}
		} catch (Exception e) {
			message = "Cập Nhập thất bại";
			return "redirect:/admin/qlnhanvien/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlnhanvien/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qlnhanvien/delete/{maNhanVien}")
	public String delete(Model model, @PathVariable("maNhanVien") String maNhanVien) {
		String message = "";
		try {
			NhanVien taikhoan = session.getAdmin();
			NhanVien nhanvien = nhanviendao.getOne(maNhanVien);
			if (nhanvien.getVaiTro().equals(true)) {
				message = "Không Thể Xóa, Đây là Tài Khoản Admin!";
				return "redirect:/admin/qlnhanvien/index?messagefail=" + StrUtils.encodeUrl(message);
			} else if (taikhoan.getMaNhanVien().equals(nhanvien.getMaNhanVien())) {
				message = "Không Thể Xóa, Đây là Tài Khoản Của Bạn!";
				return "redirect:/admin/qlnhanvien/index?messagefail=" + StrUtils.encodeUrl(message);
			} else {
				nhanvien.setIsDelete(true);
				nhanviendao.save(nhanvien);
				message = "Xóa Thành Công!";
			}
		} catch (Exception e) {
			message = "Không Thể Xóa, Nhân Viên Này Có Trong Đơn Tour!";
			return "redirect:/admin/qlnhanvien/index?messagefail=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlnhanvien/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qlnhanvien/restore/{maNhanVien}")
	public String restore(Model model, @PathVariable("maNhanVien") String maNhanVien) {
		String message = "";
		try {
			NhanVien nhanvien = nhanviendao.getOne(maNhanVien);
			nhanvien.setIsDelete(false);
			nhanviendao.save(nhanvien);
			message = "Khôi Phục Thành Công!";
		} catch (Exception e) {
			message = "Khôi Phục Thất Bại!";
			return "redirect:/admin/qlnhanvien/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlnhanvien/index?messageok=" + StrUtils.encodeUrl(message);
	}

	// Xem chi tiết nhân viên
	@RequestMapping("/admin/qlnhanvien/seeDetail/{maNhanVien}")
	public String detail(Model model, @PathVariable("maNhanVien") String maNhanVien) {
		NhanVien nhanvien = nhanviendao.getOne(maNhanVien);
		model.addAttribute("prod", nhanvien);
		return "admin/qlnhanvien/seeDetail";
	}

	@RequestMapping("admin/qlnhanvien/back")
	public String back(Model model) {
		return "redirect:/admin/qlnhanvien/index";
	}

	@RequestMapping("/admin/qlnhanvien/list-by-keywords")
	public String search(Model model, @RequestParam("keywords") String keywords) {
		List<NhanVien> items = nhanviendao.findByKeyWords(keywords);
		model.addAttribute("form", new NhanVien());
		model.addAttribute("items", items);
		model.addAttribute("botay", "collapse");
		return "admin/qlnhanvien/index";
	}

	@RequestMapping("/admin/qlnhanvien/deletetrash/{maNhanVien}")
	public String deletetrash(Model model, @PathVariable("maNhanVien") String maNhanVien) {
		String message = "";
		try {
			nhanviendao.deleteById(maNhanVien);
			message = "Xóa Thành Công!";
		} catch (Exception e) {
			message = "Không Thể Xóa, Nhân Viên Này Đã Có Trong Đơn Tour!";
			return "redirect:/admin/qlnhanvien/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlnhanvien/index?messageok=" + StrUtils.encodeUrl(message);
	}
}