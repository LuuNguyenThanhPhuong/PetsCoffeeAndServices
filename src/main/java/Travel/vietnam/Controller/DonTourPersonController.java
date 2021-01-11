package Travel.vietnam.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import Travel.vietnam.DAO.DonTourDAO;
import Travel.vietnam.DAO.ThongTinDuKhachDAO;
import Travel.vietnam.Entity.DonTour;
import Travel.vietnam.Entity.NhanVien;
import Travel.vietnam.Entity.ThongTinDuKhach;
import Travel.vietnam.service.SessionService;
/**
 * DonTourPersonController là Controller chứa các phương thức để điều khiển các hành vi
 * của person liên quan đến đơn tour
 * 
 * */
@Controller
public class DonTourPersonController {

	@Autowired
	DonTourDAO dontourdao;
	@Autowired
	ThongTinDuKhachDAO thongTinDuKhachDAO;
	@Autowired
	SessionService session;

	/**
	 * Phương thức này view tất cả đơn tour mà nhân viên này được phân công
	 * 
	 * 
	 * @return vào form quản lí đơn tour của nhân viên
	 * */
	@RequestMapping("/person/dontour/index")
	public String index(Model model) {
		NhanVien nhanvien = session.getAdmin();
		
		List<DonTour> chuaxuatphat = dontourdao.findByTinhTrang(nhanvien.getMaNhanVien(), -1);
		List<DonTour> daxuatphat = dontourdao.findByTinhTrang(nhanvien.getMaNhanVien(), 1);
		List<DonTour> hoanthanh = dontourdao.findByTinhTrang(nhanvien.getMaNhanVien(), 0);
		
		model.addAttribute("chuaxuatphat", chuaxuatphat);
		model.addAttribute("daxuatphat", daxuatphat);
		model.addAttribute("hoanthanh", hoanthanh);
		return "person/dontour/index";
	}

	/**
	 * Phương thức này dùng để trở về trang quản lí dơn tour của nhân viên
	 * 
	 * @return trang quản lí đơn tour của nhân viên
	 * */
	@RequestMapping("person/dontour/back")
	public String back(Model model) {
		return "redirect:/person/dontour/index";
	}


	
	/**
	 * Phương thức này view chi tiết đơn tour của nhân viên được phân công
	 * 
	 * maDonTour là Mã đơn tour
	 * 
	 * @return vào form chi tiết đơn tour
	 * */
	@RequestMapping("/person/dontour/seeDetail/{maDonTour}")
	public String detail(Model model, @PathVariable("maDonTour") Integer maDonTour) {
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
		return "person/dontour/seeDetail";

	}

	/**
	 * Phương thức này view chi tiết thông tin du khách của đơn tour nhân viên được phân công
	 * 
	 * maDonTour là Mã đơn tour
	 * 
	 * maThongTin là mã thông tin du khách
	 * 
	 * @return vào form thông tin du khách chi tiết
	 * */
	@RequestMapping("/person/dontour/seeDetail/{maDonTour}/seeDetail/{maThongTin}")
	public String detailthongtin(Model model, @PathVariable("maDonTour") Integer maDonTour,
			@PathVariable("maThongTin") Integer maThongTin) {
		ThongTinDuKhach dukhach = thongTinDuKhachDAO.getOne(maThongTin);
		model.addAttribute("prod", dukhach);
		return "person/dontour/seeDetailDuKhach";

	}

	/**
	 * Phương thức này dùng để trở về chi tiết đơn tour của nhân viên được phân công
	 * 
	 * maDonTour là Mã đơn tour
	 * 
	 * @return trang chi tiết đơn tour
	 * */
	@RequestMapping("person/dontour/seeDetail/{maDonTour}/back")
	public String backdukhach(Model model, @PathVariable("maDonTour") Integer maDonTour) {
		return "redirect:/person/dontour/seeDetail/{maDonTour}";
	}


}