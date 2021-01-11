package Travel.vietnam.Controller;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import Travel.vietnam.DAO.DonTourDAO;
import Travel.vietnam.DAO.ThongTinDuKhachDAO;
import Travel.vietnam.DAO.TourDAO;
import Travel.vietnam.Entity.DonTour;
import Travel.vietnam.Entity.KhachHang;
import Travel.vietnam.Entity.ThongTinDuKhach;
import Travel.vietnam.Entity.Tour;
import Travel.vietnam.service.SessionService;
import Travel.vietnam.utils.StrUtils;

/**
 * TrangThaiTourController là Controller chứa các phương thức để điều khiển các hành vi
 * của khách hàng liên quan đến đơn tour
 * 
 * */

@Controller
public class TrangThaiTourController {
	@Autowired
	TourDAO tourdao;
	@Autowired
	DonTourDAO dontourdao;
	@Autowired
	ThongTinDuKhachDAO thongTinDuKhachDAO;
	@Autowired
	SessionService session;
	
	/**
	 * Phương thức này view tất cả đơn tour mà khách hàng này đã đặt, hủy.
	 * 
	 * 
	 * @return vào form trạng thái đơn tour
	 * */
	@RequestMapping("/trangthaitour/index")
	public String trangthai(Model model, HttpServletRequest request) {
		KhachHang khachhang = session.getUser();
		List<DonTour> setdaduyet = dontourdao.findByTrangThaiKhachHang(khachhang.getMaKhachHang(), 1);
		List<DonTour> setchuaduyet = dontourdao.findByTrangThaiKhachHang(khachhang.getMaKhachHang(), 0);
		for (DonTour d : setchuaduyet) {
			Date t = new Date();
			Date ngaydi = d.getTour().getNgayDi();
			long z = ngaydi.getTime() - t.getTime();
			long diffMinutes = z / (60 * 1000) % 60;
			if (diffMinutes < 1) {
				d.setTrangThaiDuyetDon(-1);
				model.addAttribute("autohuy", "Đơn: " + d.getMaDonTour());

				int x = d.getSoLuongKhach();
				int y = d.getTour().getSoLuongDaDat();

				Tour tour = tourdao.getOne(d.getTour().getMaTour());

				tour.setSoLuongDaDat(y - x);
				tourdao.save(tour);
				dontourdao.save(d);
			}
		}
		for (DonTour d : setdaduyet) {
			Date t = new Date();
			Date ngaydat = d.getNgayDat();
			Date ngaydi = d.getTour().getNgayDi();

			long s = t.getTime() - ngaydat.getTime();
			long z = ngaydi.getTime() - ngaydat.getTime();
			long diffDays = z / (24 * 60 * 60 * 1000);
			long diffMinutes = s / (60 * 1000) % 60;
			long dem = diffMinutes - (5 * 24 * 60);

			if (diffMinutes > (5 * 24 * 60) && d.getTrangThaiThanhToan().equals(false)
					|| diffDays < (1) && d.getTrangThaiThanhToan().equals(false)) {
				d.setTrangThaiDuyetDon(-1);
				model.addAttribute("tb", "Đơn: " + d.getMaDonTour());
				if (dem < (60)) {
					model.addAttribute("sss", dem + " phút trước");
				} else if (dem > (60)) {
					long hour = TimeUnit.HOURS.convert(dem, TimeUnit.MINUTES);
					model.addAttribute("sss", hour + " giờ trước");
				} else if (dem > (24 * 60)) {
					long day = TimeUnit.DAYS.convert(dem, TimeUnit.MINUTES);
					model.addAttribute("sss", day + " ngày trước");
				}

				int x = d.getSoLuongKhach();
				int y = d.getTour().getSoLuongDaDat();

				Tour tour = tourdao.getOne(d.getTour().getMaTour());

				tour.setSoLuongDaDat(y - x);
				tourdao.save(tour);
				dontourdao.save(d);
			}

		}
		String messageok = request.getParameter("messageok");
		String messageerror = request.getParameter("messageerror");
		if (messageok != null) {
			request.setAttribute("message", messageok);
			request.setAttribute("ok", "myModal");
		}
		if (messageerror != null) {
			request.setAttribute("message", messageerror);
			request.setAttribute("error", "myModalerror");
		}
		List<DonTour> daduyet = dontourdao.findByTrangThaiKhachHang(khachhang.getMaKhachHang(), 1);
		List<DonTour> dahuy = dontourdao.findByTrangThaiKhachHang(khachhang.getMaKhachHang(), -1);
		List<DonTour> chuaduyet = dontourdao.findByTrangThaiKhachHang(khachhang.getMaKhachHang(), 0);
		model.addAttribute("daduyet", daduyet);
		model.addAttribute("dahuy", dahuy);
		model.addAttribute("chuaduyet", chuaduyet);
		return "trangthaitour/index";
	}

	
	/**
	 * Phương thức này dùng để khách hàng hủy đơn tour
	 * 
	 * @param maDonTour là Mã đơn tour
	 * 
	 * @return về form trạng thái đơn tour
	 * */
	@RequestMapping("/trangthaitour/cancel/{maDonTour}")
	public String cancel(Model model, @PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
		DonTour dontour = dontourdao.getOne(maDonTour);
		dontour.setTrangThaiDuyetDon(-1);
		int x = dontour.getSoLuongKhach();
		int y = dontour.getTour().getSoLuongDaDat();
		
		Tour tour = tourdao.getOne(dontour.getTour().getMaTour());
		
		tour.setSoLuongDaDat(y-x);
		tourdao.save(tour);
		dontourdao.save(dontour);
		message = "Đã Hủy Thành Công";
		
		} catch (Exception e) {
			message = "Lỗi, Hủy Thất Bại!";
			return "redirect:/trangthaitour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		
		return "redirect:/trangthaitour/index?messageok=" + StrUtils.encodeUrl(message);
	}
	
	/**
	 * Phương thức này view chi tiết đơn tour của khách hàng
	 * 
	 * maDonTour là Mã đơn tour
	 * 
	 * @return vào form chi tiết đơn tour
	 * */
	@RequestMapping("/trangthaitour/seeDetail/{maDonTour}")
	public String detail(@PathVariable("maDonTour") Integer maDonTour, Model model, HttpServletRequest request) {
		DonTour dontour = dontourdao.getOne(maDonTour);
		model.addAttribute("prod", dontour);
		List<ThongTinDuKhach> items = dontourdao.getOne(maDonTour).getThongTinDuKhach();
		model.addAttribute("items", items);
		model.addAttribute("form", new ThongTinDuKhach());
		int x = dontour.getThongTinDuKhach().size();
		if(x >= dontour.getSoLuongKhach()) {
			model.addAttribute("hidden", "hidden");
		}else {
			
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
		return "trangthaitour/seeDetail";
	}

	/**
	 * Phương thức này dùng để khách hàng xóa thông tin du khách trong đơn tour
	 * 
	 * @param maDonTour là Mã đơn tour
	 * 
	 * @param maThongTin là mã thông tin du khách
	 * 
	 * @return về form chi tiết đơn tour
	 * */
	@RequestMapping("/trangthaitour/seeDetail/{maDonTour}/delete/{maThongTin}")
	public String deletedukhach(Model model, @PathVariable("maThongTin") Integer maThongTin,
			@PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
			thongTinDuKhachDAO.deleteById(maThongTin);
			message = "Xóa Thành Công!";
		} catch (Exception e) {
			message = "Xóa Thất Bại!";
			return "redirect:/trangthaitour/seeDetail/"+ maDonTour +"?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/trangthaitour/seeDetail/"+ maDonTour +"?messageok=" + StrUtils.encodeUrl(message);
	}

	/**
	 * Phương thức này dùng để khách hàng lấy thông tin của du khách để cập nhập
	 * 
	 * @param maDonTour là Mã đơn tour
	 * 
	 * @param maThongTin là mã thông tin du khách
	 * 
	 * @return về form chi tiết đơn tour và lấy thông tin du khách đặt muốn cập nhập ra form
	 * */
	@RequestMapping("/trangthaitour/seeDetail/{maDonTour}/edit/{maThongTin}")
	public String editdukhach(Model model, @PathVariable("maDonTour") Integer maDonTour,
			@PathVariable("maThongTin") Integer maThongTin) {
		model.addAttribute("form", thongTinDuKhachDAO.getOne(maThongTin));

		DonTour dontour = dontourdao.getOne(maDonTour);
		model.addAttribute("prod", dontour);
		List<ThongTinDuKhach> items = dontourdao.getOne(maDonTour).getThongTinDuKhach();
		model.addAttribute("items", items);
		model.addAttribute("botay", "collapse show");
		return "trangthaitour/seeDetail";
	}

	
	/**
	 * Phương thức này dùng để khách hàng thêm mới thông tin du khách trong đơn tour
	 * 
	 * @param maDonTour là Mã đơn tour
	 * 
	 * @param entity là ThongTinDuKhachEntity
	 * @return về form chi tiết đơn tour
	 * */
	@RequestMapping("/trangthaitour/seeDetail/{maDonTour}/create")
	public String createdukhach(Model model, ThongTinDuKhach entity, @PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
			entity.getDonTour().setMaDonTour(maDonTour);
			thongTinDuKhachDAO.save(entity);
			message = "Tạo mới thành công";

		} catch (Exception e) {
			message = "Tạo mới thất bại";
			return "redirect:/trangthaitour/seeDetail/" + maDonTour + "?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/trangthaitour/seeDetail/" + maDonTour + "?messageok=" + StrUtils.encodeUrl(message);
	}

	/**
	 * Phương thức này dùng để khách hàng cập nhập thông tin du khách trong đơn tour
	 * 
	 * @param maDonTour là Mã đơn tour
	 * 
	 * @param entity là ThongTinDuKhachEntity
	 * 
	 * @return về form chi tiết đơn tour
	 * */
	@RequestMapping("/trangthaitour/seeDetail/{maDonTour}/update")
	public String updatedukhach(Model model, ThongTinDuKhach entity, @PathVariable("maDonTour") Integer maDonTour) {
		String message = "";
		try {
		if (!thongTinDuKhachDAO.existsById(entity.getMaThongTin())) {
			message = "Mã Thông Tin không tồn tại!";
			return "redirect:/trangthaitour/seeDetail/" + maDonTour + "?messagefail=" + StrUtils.encodeUrl(message);
		} else {
			thongTinDuKhachDAO.save(entity);
			message = "Cập nhật thành công!";
		}
		} catch (Exception e) {
			message = "Cập nhập thất bại";
			return "redirect:/trangthaitour/seeDetail/" + maDonTour + "?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/trangthaitour/seeDetail/"+ maDonTour +"?messageok=" + StrUtils.encodeUrl(message);
	}

	/**
	 * Phương thức này view chi tiết thông tin du khách của đơn tour của khách hàng
	 * 
	 * maDonTour là Mã đơn tour
	 * 
	 * maThongTin là mã thông tin du khách
	 * 
	 * @return vào form thông tin du khách chi tiết
	 * */
	@RequestMapping("/trangthaitour/seeDetail/{maDonTour}/seeDetail/{maThongTin}")
	public String detailthongtin(Model model, @PathVariable("maDonTour") Integer maDonTour,
			@PathVariable("maThongTin") Integer maThongTin) {
		ThongTinDuKhach dukhach = thongTinDuKhachDAO.getOne(maThongTin);
		model.addAttribute("prod", dukhach);
		return "trangthaitour/seeDetailDuKhach";

	}
	
	/**
	 * Phương thức này dùng để trở về chi tiết đơn tour của khách hàng
	 * 
	 * maDonTour là Mã đơn tour
	 * 
	 * @return trang chi tiết đơn tour
	 * */
	@RequestMapping("trangthaitour/seeDetail/{maDonTour}/back")
	public String backdukhach(Model model, @PathVariable("maDonTour") Integer maDonTour) {

		return "redirect:/trangthaitour/seeDetail/{maDonTour}";
	}

	/**
	 * Phương thức này dùng để trở về trang trạng thái đơn tour của khách hàng
	 * 
	 * @return trang trạng thái đơn tour
	 * */
	@RequestMapping("/trangthaitour/seeDetail/back")
	public String backtrangthai(Model model) {
		return "redirect:/trangthaitour/index";
	}
}
