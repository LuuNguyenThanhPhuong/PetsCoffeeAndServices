package PetsCoffeeServices.asm.Controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import PetsCoffeeServices.asm.DAO.TourDAO;
import PetsCoffeeServices.asm.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import PetsCoffeeServices.asm.DAO.LoaiTourDAO;
import PetsCoffeeServices.asm.Entity.Tour;
import PetsCoffeeServices.asm.utils.StrUtils;

@Controller
public class TourAdminController {

	@Autowired
    TourDAO tourdao;
	@Autowired
	LoaiTourDAO loaitourdao;
	@Autowired
    UploadService upload;

	@RequestMapping("/admin/qltour/index")
	public String index(Model model, HttpServletRequest request) {
		model.addAttribute("form", new Tour());
		model.addAttribute("prod", loaitourdao.findAll());
		model.addAttribute("items", tourdao.getAllTour(false));
		model.addAttribute("trashitems", tourdao.getAllTour(true));
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
		for (Tour d : tourdao.getAllTour(false)) {
			long t = new Date().getTime();
			long ngaydi = d.getNgayDi().getTime();

			if (ngaydi < t) {
				d.setIsDelete(true);
				tourdao.save(d);
				model.addAttribute("tb", "Tour đã cận ngày, hãy set ngày lại(Trong Thùng Rác)");

			}
		}
		return "admin/qltour/index";
	}

	@RequestMapping("/admin/qltour/edit/{maTour}")
	public String edit(Model model, @PathVariable("maTour") Integer maTour) {
		model.addAttribute("form", tourdao.getOne(maTour));
		model.addAttribute("prod", loaitourdao.findAll());
		model.addAttribute("items", tourdao.getAllTour(false));
		model.addAttribute("trashitems", tourdao.getAllTour(true));
		model.addAttribute("botay", "collapse show");
		return "admin/qltour/index";
	}

	@RequestMapping("/admin/qltour/create")
	public String create(Model model, Tour entity, @RequestParam("hinh_file") MultipartFile photo,
			@RequestParam("hinh1_file") MultipartFile photo1,
			@RequestParam("hinh2_file") MultipartFile photo2,
			@RequestParam("hinh3_file") MultipartFile photo3) {
		String message = "";
		try {
			File file = upload.save(photo, "/static/images/tour/");
			File file1 = upload.save1(photo1, "/static/images/tour/");
			File file2 = upload.save2(photo2, "/static/images/tour/");
			File file3 = upload.save3(photo3, "/static/images/tour/");
			if (file != null) {
				entity.setHinh(file.getName());
			}
			if (file1 != null) {
				entity.setHinh1(file1.getName());
			}
			if (file2 != null) {
				entity.setHinh2(file2.getName());
			}
			if (file3 != null) {
				entity.setHinh3(file3.getName());
			}
			entity.setIsDelete(false);
			entity.setSoLuongDaDat(0);
			tourdao.save(entity);
			message = "Tạo thành công!";

		} catch (Exception e) {
			message = "Tạo mới thất bại";
			return "redirect:/admin/qltour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qltour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qltour/update")
	public String update(Model model, Tour entity, @RequestParam("hinh_file") MultipartFile photo,
			@RequestParam("hinh1_file") MultipartFile photo1, 
			@RequestParam("hinh2_file") MultipartFile photo2,
			@RequestParam("hinh3_file") MultipartFile photo3) {
		String message = "";
		try {
			if (!tourdao.existsById(entity.getMaTour())) {
				message = "Mã Tour không tồn tại";
				return "redirect:/admin/qltour/index?messagefail=" + StrUtils.encodeUrl(message);
			} else {
				File file = upload.save(photo, "/static/images/tour/");
				File file1 = upload.save1(photo1, "/static/images/tour/");
				File file2 = upload.save2(photo2, "/static/images/tour/");
				File file3 = upload.save3(photo3, "/static/images/tour/");
				if (file != null) {
					entity.setHinh(file.getName());
				}
				if (file1 != null) {
					entity.setHinh1(file1.getName());
				}
				if (file2 != null) {
					entity.setHinh2(file2.getName());
				}
				if (file3 != null) {
					entity.setHinh3(file3.getName());
				}
				tourdao.save(entity);
				message = "Cập nhật Tour thành công";
			}
		} catch (Exception e) {
			message = "Cập Nhập thất bại";
			return "redirect:/admin/qltour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qltour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qltour/delete/{maTour}")
	public String delete(Model model, @PathVariable("maTour") Integer maTour) {
		String message = "";
		try {
			Tour tour = tourdao.getOne(maTour);
			tour.setIsDelete(true);
			tourdao.save(tour);
			message = "Xóa Thành Công";
		} catch (Exception e) {
			message = "Tour Này Đang Được Sử Dụng!";
			return "redirect:/admin/qltour/index?messagefail=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qltour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qltour/restore/{maTour}")
	public String restore(Model model, @PathVariable("maTour") Integer maTour) {
		String message = "";
		try {
			Tour tour = tourdao.getOne(maTour);
			tour.setIsDelete(false);
			tourdao.save(tour);
			message = "Khôi Phục Thành Công!";
		} catch (Exception e) {
			message = "Khôi Phục Thất Bại";
			return "redirect:/admin/qltour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qltour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qltour/list-by-keywords")
	public String search(Model model, @RequestParam("keywords") String keywords) {
		List<Tour> items = tourdao.findByKeyWords(keywords);
		model.addAttribute("form", new Tour());
		model.addAttribute("prod", loaitourdao.findAll());
		model.addAttribute("items", items);
		model.addAttribute("botay", "collapse");
		return "admin/qltour/index";
	}

	@RequestMapping("/admin/qltour/deletetrash/{maTour}")
	public String deletetrash(Model model, @PathVariable("maTour") Integer maTour) {
		String message = "";
		try {
			tourdao.deleteById(maTour);
			message = "Xóa Thành Công!";
		} catch (Exception e) {
			message = "Xóa Thất Bại, Tour Này Đang Được Sử Dụng!";
			return "redirect:/admin/qltour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qltour/index?messageok=" + StrUtils.encodeUrl(message);
	}
}
