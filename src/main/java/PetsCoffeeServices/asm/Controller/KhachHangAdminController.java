package PetsCoffeeServices.asm.Controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import PetsCoffeeServices.asm.DAO.KhachHangDAO;
import PetsCoffeeServices.asm.Entity.KhachHang;
import PetsCoffeeServices.asm.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import PetsCoffeeServices.asm.utils.StrUtils;


@Controller
public class KhachHangAdminController {

	@Autowired
    KhachHangDAO khachhangdao;
	@Autowired
    UploadService upload;
	
	@RequestMapping("/admin/qlkhachhang/index")
	public String index(Model model , HttpServletRequest request) {
		model.addAttribute("form", new KhachHang());
		model.addAttribute("items", khachhangdao.getAllKhachHang(false));
		model.addAttribute("trashitems", khachhangdao.getAllKhachHang(true));
		model.addAttribute("botay", "collapse");
		String messageok = request.getParameter("messageok");
		String messagefail = request.getParameter("messagefail");
		String messageerror = request.getParameter("messageerror");
		if (messagefail != null) {
			request.setAttribute("message", messagefail);
			request.setAttribute("fail", "myModalfail");
		}if (messageok != null) {
			request.setAttribute("message", messageok);
			request.setAttribute("ok", "myModal");
		}if (messageerror != null) {
			request.setAttribute("message", messageerror);
			request.setAttribute("error", "myModalerror");
		}
		return "admin/qlkhachhang/index";
	}
	
	@RequestMapping("/admin/qlkhachhang/edit/{maKhachHang}")
	public String edit(Model model, @PathVariable("maKhachHang") String maKhachHang) {
		model.addAttribute("form", khachhangdao.getOne(maKhachHang));
		model.addAttribute("items", khachhangdao.getAllKhachHang(false));
		model.addAttribute("trashitems", khachhangdao.getAllKhachHang(true));
		model.addAttribute("botay", "collapse show");
		return "admin/qlkhachhang/index";
	}
	
	
//	  @RequestMapping("/admin/qlkhachhang/create") public String create(Model
//	  model, KhachHang entity,@RequestParam("photo_file") MultipartFile photo) {
//	  File file = upload.save(photo, "/static/images/photos/");
//	  
//	 if(file != null) { entity.setHinh(file.getName()); }
//	  khachhangdao.save(entity); model.addAttribute("form", new KhachHang());
//	 model.addAttribute("items", khachhangdao.getAllKhachHang());
//	 model.addAttribute("trashitems", khachhangdao.getAllTrash()); return
//	  "admin/qlkhachhang/index"; }

	
	@RequestMapping("/admin/qlkhachhang/update")
	public String update(Model model,KhachHang entity,@RequestParam("photo_file") MultipartFile photo) {
		String message = "";
		try {
		if(!khachhangdao.existsById(entity.getMaKhachHang())) {
			message = "Mã khách hàng không tồn tại!";
			return "redirect:/admin/qlkhachhang/index?messageerror="+ StrUtils.encodeUrl(message);
		}
		else {
		File file = upload.save(photo, "/static/images/photos/");
		if(file != null) {
			entity.setHinh(file.getName());
		}
		entity.setActive(true);
		khachhangdao.save(entity);
		message = "Đã Cập Nhập Thành Công!";
		}
		} catch (Exception e) {
			message = "Cập Nhập thất bại!";
			return "redirect:/admin/qlkhachhang/index?messageerror="+ StrUtils.encodeUrl(message);
		}
		
		return "redirect:/admin/qlkhachhang/index?messageok="+ StrUtils.encodeUrl(message);
	}
	
	@RequestMapping("/admin/qlkhachhang/delete/{maKhachHang}")
	public String delete(Model model, @PathVariable("maKhachHang") String maKhachHang) {
		String message = "";
		try {
		KhachHang entity = khachhangdao.getOne(maKhachHang);
		entity.setIsDelete(true);
		khachhangdao.save(entity); 
		message = "Xóa Thành Công!";
		
		} catch (Exception e) {
		message = "Không Thể Xóa, Khách Hàng Này Có Đơn Đặt Hàng!";
		return "redirect:/admin/qlkhachhang/index?messagefail="+ StrUtils.encodeUrl(message);
		}
		
		return "redirect:/admin/qlkhachhang/index?messageok="+ StrUtils.encodeUrl(message);
	
	}
	
	@RequestMapping("/admin/qlkhachhang/restore/{maKhachHang}")
	public String restore(Model model, @PathVariable("maKhachHang") String maKhachHang) {
		String message = "";
		try {
		KhachHang entity = khachhangdao.getOne(maKhachHang);
		entity.setIsDelete(false);
		entity.setActive(true);
		khachhangdao.save(entity);
		message = "Khôi Phục Thành Công!";
		} catch (Exception e) {
		message = "Khôi Phục Thất Bại!";
		return "redirect:/admin/qlkhachhang/index?messageerror="+ StrUtils.encodeUrl(message);
		}
		
		return "redirect:/admin/qlkhachhang/index?messageok="+ StrUtils.encodeUrl(message);
	}
	
	// Xem chi tiết Khách hàng
		@RequestMapping("/admin/qlkhachhang/seeDetail/{maKhachHang}")
		public String detail(Model model, @PathVariable("maKhachHang") String maKhachHang) {
			KhachHang khachhang = khachhangdao.getOne(maKhachHang);
			model.addAttribute("prod", khachhang);
			return "admin/qlkhachhang/seeDetail";
	}
		@RequestMapping("admin/qlkhachhang/back")
		public String back(Model model) {
			return "redirect:/admin/qlkhachhang/index";
		}
		
		@RequestMapping("/admin/qlkhachhang/list-by-keywords")
		public String search(Model model, @RequestParam("keywords") String keywords) {
			List<KhachHang> items = khachhangdao.findByKeyWords(keywords);
			model.addAttribute("form", new KhachHang());
			model.addAttribute("items", items);
			model.addAttribute("botay", "collapse");
			return "admin/qlkhachhang/index";
		}
		
		@RequestMapping("/admin/qlkhachhang/deletetrash/{maKhachHang}")
		public String deletetrash(Model model, @PathVariable("maKhachHang") String maKhachHang) {
			String message = "";
			try {
			khachhangdao.deleteById(maKhachHang);
			message = "Xóa Thành Công!";
			} catch (Exception e) {
				message = "Không Thể Xóa, Khách Hàng Này Có Đơn Đặt Hàng!";
				return "redirect:/admin/qlkhachhang/index?messagefail="+ StrUtils.encodeUrl(message);
				}
			return "redirect:/admin/qlkhachhang/index?messageok="+ StrUtils.encodeUrl(message);
		}
}