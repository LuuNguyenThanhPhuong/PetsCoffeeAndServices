package PetsCoffeeServices.asm.Controller;

import javax.servlet.http.HttpServletRequest;

import PetsCoffeeServices.asm.DAO.DonTourDAO;
import PetsCoffeeServices.asm.DAO.TourDAO;
import PetsCoffeeServices.asm.Entity.DonTour;
import PetsCoffeeServices.asm.Entity.NhanVien;
import PetsCoffeeServices.asm.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import PetsCoffeeServices.asm.Entity.Tour;

/**
 * BookingController là Controller chứa các phương thức để điều khiển các hành vi
 * của khách hàng liên quan đặt tour
 * 
 * */

@Controller
public class BookingController {
	private static final NhanVien SetNulls = null;
	@Autowired
    TourDAO tourdao;
	@Autowired
    DonTourDAO dontourdao;
	@Autowired
    SessionService session;


	/**
	 * Phương thức này view chi tiết tour để khách hàng tiến hành đặt tour
	 * 
	 * @param maTour là mã tour
	 * 
	 * @return vào form đặt tour
	 * */
	@RequestMapping("/paytour/index/{maTour}")
	public String pay(Model model, @PathVariable("maTour") Integer maTour) {
		Tour tour = tourdao.getOne(maTour);
		model.addAttribute("prod", tour);

		DonTour dontour = new DonTour();
		dontour.setKhachHang(session.getUser());

		model.addAttribute("form", dontour);
		return "paytour/index";
	}

	/**
	 * Phương thức này là đặt tour, tạo mới 1 đơn tour
	 * 
	 * @param maTour là mã tour
	 * 
	 * @param dontour là DonTourEntity
	 * 
	 * @return về form đặt tour
	 * */
	@RequestMapping(value = "/paytour/index/{maTour}/create", method = RequestMethod.POST)
	public String create(Model model, @PathVariable("maTour") Integer maTour, DonTour dontour,
			HttpServletRequest request) {
		try {
		Tour tour = tourdao.getOne(maTour);
		model.addAttribute("prod", tour);
		model.addAttribute("form", new DonTour());
		dontour.setKhachHang(session.getUser());
		dontour.setTour(tour);
		dontour.setTrangThaiDuyetDon(0);
		dontour.setTrangThaiThanhToan(false);
		dontour.setTinhTrang(-1);
		dontour.setNhanVien(SetNulls);
		tour.setSoLuongDaDat(dontour.getSoLuongKhach() + tour.getSoLuongDaDat());
		tourdao.save(tour);
		dontourdao.save(dontour);
		model.addAttribute("message", "myModal");
		model.addAttribute("maDonTour", dontour.getMaDonTour());
		} catch (Exception e) {
			model.addAttribute("message", "myModalerror");
		}
		return "paytour/index";
	}

	/**
	 * Phương thức này dùng để trở về trang chủ
	 * 
	 * @return trang chủ
	 * */
	@RequestMapping("/paytour/index/back")
	public String back(Model model) {

		return "redirect:/home/index";
	}
}
