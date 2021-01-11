package PetsCoffeeServices.asm.Controller;

import PetsCoffeeServices.asm.DAO.TourDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import PetsCoffeeServices.asm.DAO.LoaiTourDAO;

@Controller
public class HomeController {

	@Autowired
    TourDAO tourdao;
	@Autowired
	LoaiTourDAO loaiTourDAO ;
	
	@RequestMapping("home/index")
	public String index(Model model) {
		model.addAttribute("prod", tourdao.getAllTour(false));
		model.addAttribute("loaitour", loaiTourDAO.findAll());
		model.addAttribute("items", tourdao.findByGiamGia());
		return "home/index";
	}
	@RequestMapping("home/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("home/contact")
	public String contact() {
		return "home/contact";
	}
	@RequestMapping("home/tour")
	public String tour() {
		return "home/tour";
	}
	@RequestMapping("/cart/index")
	public String cart() {
		return "cart/index";
	}
	
	// Quyền admin
	@RequestMapping("admin/home/index")
	public String indexAdmin() {
		return "admin/home/index";
	}
}
