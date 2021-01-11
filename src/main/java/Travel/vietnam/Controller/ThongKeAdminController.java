package Travel.vietnam.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import Travel.vietnam.DAO.ThongKeDAO;



@Controller
public class ThongKeAdminController {
	@Autowired
	ThongKeDAO thongKeDAO;
	
	@GetMapping("/admin/thongke/index")
	public String index(Model model){
		return "admin/thongke/index";
	}
	
	@GetMapping("/admin/thongke/thongke_loaitour")
	public String inventoryByLoaiTour(Model model){
		model.addAttribute("items", thongKeDAO.inventoryByLoaiTour());
		return "admin/thongke/thongke_loaitour";
	}
	
	@GetMapping("/admin/thongke/doanhthu")
	public String revenueByLoaiTour(Model model){
		model.addAttribute("items", thongKeDAO.revenueByLoaiTour());
		return "admin/thongke/doanhthu";
	}
	
	@GetMapping("/admin/thongke/khachhangthanthiet")
	public String revenueByCustomer(Model model){
		Pageable first10 = PageRequest.of(0, 10);
		model.addAttribute("items", thongKeDAO.revenueByKhachHang(first10));
		return "admin/thongke/khachhangthanthiet";
	}
	
	@GetMapping("/admin/thongke/nhanviengioi")
	public String revenueByPerson(Model model){
		Pageable first10 = PageRequest.of(0, 10);
		model.addAttribute("items", thongKeDAO.revenueByNhanVien(first10));
		return "admin/thongke/nhanviengioi";
	}
	
	@GetMapping("/admin/thongke/doanhthu_thang")
	public String revenueByMonth(Model model){
		model.addAttribute("items", thongKeDAO.revenueByMonth());
		return "admin/thongke/doanhthu_thang";
	}
	
	@GetMapping("/admin/thongke/doanhthu_nam")
	public String revenueByYear(Model model){
		model.addAttribute("items", thongKeDAO.revenueByYear());
		return "admin/thongke/doanhthu_nam";
	}
	
	@GetMapping("/admin/thongke/thongke_tour")
	public String revenueByTour(Model model){
		model.addAttribute("items", thongKeDAO.revenueByTour());
		return "admin/thongke/thongke_tour";
	}
	
	@GetMapping("/admin/thongke/tour_huy")
	public String revenueByTourHuy(Model model){
		model.addAttribute("items", thongKeDAO.revenueByHuyTour());
		return "admin/thongke/tour_huy";
	}
}
