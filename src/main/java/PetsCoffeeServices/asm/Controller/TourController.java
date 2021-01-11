	package PetsCoffeeServices.asm.Controller;

import java.util.List;

import PetsCoffeeServices.asm.DAO.TourDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import PetsCoffeeServices.asm.DAO.LoaiTourDAO;
import PetsCoffeeServices.asm.Entity.Tour;

@Controller
public class TourController {
	@Autowired
    TourDAO tourdao;
	@Autowired
	LoaiTourDAO loaitourdao;
	
	@RequestMapping("/layout/menu")
	public String index(Model model) {
		model.addAttribute("loaitour", loaitourdao.findAll());
		return "user/layout/menu"; // return để trả về chỗ thư mục
	}
	
	// Lọc Theo Loại Tour
	@RequestMapping("/tour/list-by-idLoaiTour/{idLoaiTour}") 
		public String list(Model model,@PathVariable("idLoaiTour") String idLoaiTour) {
		List<Tour> list = tourdao.findByLoaiTour(idLoaiTour);
		String tour = loaitourdao.getOne(idLoaiTour).getTenLoaiTour();
		model.addAttribute("list", list);
		model.addAttribute("tour", tour);
		return "tour/list";
	}
	
	// Tìm Kiếm theo từ khóa
	@RequestMapping("/tour/list-by-keywords")
	public String search(Model model, @RequestParam("keywords") String keywords) {
		List<Tour> list = tourdao.findByKeyWords(keywords);
		model.addAttribute("list", list);
		return "tour/list";
	}
	
	// Xem chi tiết tour - Form xem tour
	@RequestMapping("/tour/detail/{maTour}")
	public String detail(Model model, @PathVariable("maTour") Integer maTour) {
		Tour tour = tourdao.getOne(maTour);
		model.addAttribute("prod", tour);
		return "tour/detail";
	}
	
	

	
}
