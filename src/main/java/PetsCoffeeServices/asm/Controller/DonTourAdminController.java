package PetsCoffeeServices.asm.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import PetsCoffeeServices.asm.DAO.DonTourDAO;
import PetsCoffeeServices.asm.DAO.KhachHangDAO;
import PetsCoffeeServices.asm.DAO.NhanVienDAO;
import PetsCoffeeServices.asm.DAO.TourDAO;
import PetsCoffeeServices.asm.Entity.DonTour;
import PetsCoffeeServices.asm.Entity.ThongTinDuKhach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

import PetsCoffeeServices.asm.DAO.ThongTinDuKhachDAO;
import PetsCoffeeServices.asm.Entity.Tour;
import PetsCoffeeServices.asm.service.MailerService;
import PetsCoffeeServices.asm.utils.StrUtils;

@Controller
public class DonTourAdminController {

	@Autowired
    DonTourDAO dontourdao;
	@Autowired
    KhachHangDAO khachhangdao;
	@Autowired
    NhanVienDAO nhanviendao;
	@Autowired
	ThongTinDuKhachDAO thongTinDuKhachDAO;
	@Autowired
    TourDAO tourDAO;
	@Autowired
	MailerService mailer;

	@RequestMapping("/admin/qldontour/index")
	public String index(Model model, HttpServletRequest request) {
		model.addAttribute("form", new DonTour());
		model.addAttribute("khachhang", khachhangdao.getAllKhachHang(false));
		model.addAttribute("nhanvien", nhanviendao.getAllNhanVien(false));
		model.addAttribute("tour", tourDAO.getAllTour(false));
		model.addAttribute("daduyet", dontourdao.findByTrangThai(1));
		model.addAttribute("chuaduyet", dontourdao.findByTrangThai(0));
		model.addAttribute("trashitems", dontourdao.findByTrangThai(-1));
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

		for (DonTour d : dontourdao.findByTrangThai(1)) {
			Tour tour = tourDAO.getOne(d.getTour().getMaTour());
			Date t = new Date();
			Date ngaydi = d.getTour().getNgayDi();
			Date ngayve = d.getTour().getNgayVe();

			long m = t.getTime() - ngaydi.getTime();

			long l = ngayve.getTime() - t.getTime();

			if (m > 0 & d.getTrangThaiThanhToan().equals(true)) {
				d.setTinhTrang(1);
				if (l <= 0) {
					d.setTinhTrang(0);
					model.addAttribute("tb", "Tour " + tour.getTenTour() + "đã hoàn thành, hãy set ngày lại");
				}
				dontourdao.save(d);
			}
		}
		return "admin/qldontour/index";
	}

	@RequestMapping("/admin/qldontour/edit/{maDonTour}")
	public String edit(Model model, @PathVariable("maDonTour") Integer maDonTour) {
		model.addAttribute("form", dontourdao.getOne(maDonTour));
		model.addAttribute("khachhang", khachhangdao.getAllKhachHang(false));
		model.addAttribute("nhanvien", nhanviendao.getAllNhanVien(false));
		model.addAttribute("tour", tourDAO.getAllTour(false));
		model.addAttribute("daduyet", dontourdao.findByTrangThai(1));
		model.addAttribute("chuaduyet", dontourdao.findByTrangThai(0));
		model.addAttribute("trashitems", dontourdao.findByTrangThai(-1));
		model.addAttribute("botay", "collapse show");
		return "admin/qldontour/index";
	}

	/*
	 * @RequestMapping("/admin/qldontour/create") public String create(Model model,
	 * DonTour entity) { dontourdao.save(entity); model.addAttribute("form", new
	 * DonTour()); model.addAttribute("khachhang", khachhangdao.getAllKhachHang());
	 * model.addAttribute("nhanvien", nhanviendao.getAllNhanVien());
	 * model.addAttribute("tour", tourDAO.getAllTour()); model.addAttribute("items",
	 * dontourdao.getAllDonTour()); model.addAttribute("trashitems",
	 * dontourdao.getAllTrash()); return "admin/qldontour/index"; }
	 */

	@RequestMapping("/admin/qldontour/update")
	public String update(Model model, DonTour entity) {
		String message = "";
		if (!dontourdao.existsById(entity.getMaDonTour())) {
			message = "Mã Đơn không tồn tại!";
			return "redirect:/admin/qldontour/index?messageerror=" + StrUtils.encodeUrl(message);
		} else {
			dontourdao.save(entity);
			message = "Cập Nhập Thành Công!";
		}
		return "redirect:/admin/qldontour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("admin/qldontour/xacnhan/{maDonTour}")
	public String xacnhan(Model model, @PathVariable("maDonTour") Integer maDonTour, HttpServletRequest request)
			throws JsonMappingException, JsonProcessingException {
		String message = "";
		try {
			DonTour dontour = dontourdao.getOne(maDonTour);
			dontour.setTrangThaiDuyetDon(1);
			dontourdao.save(dontour);
			/*
			 * Gửi đơn hàng cho khách hàng
			 */
			/*--[http://.../admin/qldontour/xacnhan/{maDonTour}]--*/
			String guimail = request.getRequestURL().toString();
			/*--[http://.../trangthaitour/seeDetail/{maDonTour}]--*/
			String seeDetailUrl = guimail.replace("admin/qldontour/xacnhan/" + dontour.getMaDonTour(),
					"trangthaitour/seeDetail/" + dontour.getMaDonTour());

			String to = dontour.getKhachHang().getEmail();
			String subject = "Viet Travel - Du lịch toàn quốc - Duyệt Đơn Tour Của Bạn";
			String body = "Đơn Đặt Tour Của Bạn Đã Được Duyệt. Xin Vui Lòng Đến Cơ Sở Gần Nhất Để Thanh Toán Và Được Tư Vấn Thêm."
					+ "<br/>" + "Đơn hàng của bạn là: " + maDonTour + "<hr/>" + "<br/>"
					+ " Kiểm Tra Đơn Đặt Tour Của Bạn <a href='" + seeDetailUrl + "'><b>Tại Đây<b></a>!";
			mailer.send(to, subject, body);
			message = "Đã Xác Nhận, Mail Đang Gửi Cho Khách Hàng!";
		} catch (Exception e) {
			message = "Lỗi, Chưa Gửi Được Gmail!";
			return "redirect:/admin/qldontour/index?messagefail=" + StrUtils.encodeUrl(message);
		}

		return "redirect:/admin/qldontour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("admin/qldontour/back")
	public String back(Model model) {
		return "redirect:/admin/qldontour/index";
	}

	@RequestMapping("/admin/qldontour/delete/{maDonTour}")
	public String delete(Model model, @PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
			dontourdao.deleteById(maDonTour);
			message = "Xóa Thành Công!";
		} catch (Exception e) {
			message = "Xóa Thất Bại!";
			return "redirect:/admin/qldontour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qldontour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qldontour/cancel/{maDonTour}")
	public String cancel(Model model, @PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
			DonTour dontour = dontourdao.getOne(maDonTour);
			dontour.setTrangThaiDuyetDon(-1);
			int x = dontour.getSoLuongKhach();
			int y = dontour.getTour().getSoLuongDaDat();
			Tour tour = tourDAO.getOne(dontour.getTour().getMaTour());
			tour.setSoLuongDaDat(y - x);
			tourDAO.save(tour);
			dontourdao.save(dontour);
			message = "Đã Hủy Thành Công!";
		} catch (Exception e) {
			message = "Lỗi, Hủy Thất Bại!";
			return "redirect:/admin/qldontour/index?messageerror=" + StrUtils.encodeUrl(message);
		}

		return "redirect:/admin/qldontour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	// ------------- Thông Tin DU Khách ---------------
	// Xem chi tiết Đơn tour
	@RequestMapping("/admin/qldontour/seeDetail/{maDonTour}")
	public String detail(Model model, @PathVariable("maDonTour") Integer maDonTour, HttpServletRequest request) {
		DonTour dontour = dontourdao.getOne(maDonTour);
		model.addAttribute("prod", dontour);
		List<ThongTinDuKhach> items = dontourdao.getOne(maDonTour).getThongTinDuKhach();
		model.addAttribute("items", items);
		model.addAttribute("form", new ThongTinDuKhach());
		int x = dontour.getThongTinDuKhach().size();

		if (x >= dontour.getSoLuongKhach()) {
			model.addAttribute("hidden", "hidden");
		} else {

		}
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
		return "admin/qldontour/seeDetail";

	}

	@RequestMapping("/admin/qldontour/seeDetail/{maDonTour}/delete/{maThongTin}")
	public String deletedukhach(Model model, @PathVariable("maThongTin") Integer maThongTin,
			@PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
			thongTinDuKhachDAO.deleteById(maThongTin);
			message = "Xóa Thành Công!";
		} catch (Exception e) {
			message = "Xóa Thất Bại!";
			return "redirect:/admin/qldontour/seeDetail/" + maDonTour + "?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qldontour/seeDetail/" + maDonTour + "?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qldontour/seeDetail/{maDonTour}/edit/{maThongTin}")
	public String editdukhach(Model model, @PathVariable("maDonTour") Integer maDonTour,
			@PathVariable("maThongTin") Integer maThongTin) {
		model.addAttribute("form", thongTinDuKhachDAO.getOne(maThongTin));

		DonTour dontour = dontourdao.getOne(maDonTour);
		model.addAttribute("prod", dontour);
		List<ThongTinDuKhach> items = dontourdao.getOne(maDonTour).getThongTinDuKhach();
		model.addAttribute("items", items);
		return "admin/qldontour/seeDetail";
	}

	@RequestMapping("/admin/qldontour/seeDetail/{maDonTour}/create")
	public String createdukhach(Model model, ThongTinDuKhach entity, @PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
			entity.getDonTour().setMaDonTour(maDonTour);
			thongTinDuKhachDAO.save(entity);
			message = "Tạo mới thành công";

		} catch (Exception e) {
			message = "Tạo mới thất bại";
			return "redirect:/admin/qldontour/seeDetail/" + maDonTour + "?messageerror=" + StrUtils.encodeUrl(message);
		}

		return "redirect:/admin/qldontour/seeDetail/" + maDonTour + "?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qldontour/seeDetail/{maDonTour}/update")
	public String updatedukhach(Model model, ThongTinDuKhach entity, @PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {

			if (!thongTinDuKhachDAO.existsById(entity.getMaThongTin())) {
				message = "Mã Thông Tin không tồn tại!";
				return "redirect:/admin/qldontour/seeDetail/" + maDonTour + "?messagefail="
						+ StrUtils.encodeUrl(message);
			} else {
				thongTinDuKhachDAO.save(entity);
				message = "Cập nhật thành công!";
			}
		} catch (Exception e) {
			message = "Cập Nhập Thất Bại";
			return "redirect:/admin/qldontour/seeDetail/" + maDonTour + "?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qldontour/seeDetail/" + maDonTour + "?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("/admin/qldontour/seeDetail/{maDonTour}/seeDetail/{maThongTin}")
	public String detailthongtin(Model model, @PathVariable("maDonTour") Integer maDonTour,
			@PathVariable("maThongTin") Integer maThongTin) {
		ThongTinDuKhach dukhach = thongTinDuKhachDAO.getOne(maThongTin);
		model.addAttribute("prod", dukhach);
		return "admin/qldontour/seeDetailDuKhach";

	}

	@RequestMapping("admin/qldontour/seeDetail/{maDonTour}/back")
	public String backdukhach(Model model, @PathVariable("maDonTour") Integer maDonTour) {

		return "redirect:/admin/qldontour/seeDetail/{maDonTour}";
	}

	@RequestMapping("/admin/qldontour/list-by-keywords")
	public String search(Model model, @RequestParam("keywords") String keywords) {
		List<DonTour> items = dontourdao.findByKeyWords(keywords);
		model.addAttribute("items", items);
		model.addAttribute("botay", "collapse");
		return "admin/qldontour/list";
	}

}