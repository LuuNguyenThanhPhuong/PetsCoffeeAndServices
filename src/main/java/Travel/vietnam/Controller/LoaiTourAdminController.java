package Travel.vietnam.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import Travel.vietnam.DAO.LoaiTourDAO;
import Travel.vietnam.Entity.LoaiTour;
import Travel.vietnam.utils.StrUtils;

@Controller
@RequestMapping("admin/qlloaitour")
public class LoaiTourAdminController {

	@Autowired
	LoaiTourDAO loaitourdao;

	@RequestMapping("index")
	public String index(Model model, HttpServletRequest request) {
		model.addAttribute("form", new LoaiTour());
		model.addAttribute("list", loaitourdao.findAll());
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
		return "admin/qlloaitour/index";
	}

	@RequestMapping("edit/{idLoaiTour}")
	public String edit(Model model, @PathVariable("idLoaiTour") String idLoaiTour) {
		model.addAttribute("form", loaitourdao.getOne(idLoaiTour));
		model.addAttribute("list", loaitourdao.findAll());
		model.addAttribute("botay", "collapse show");
		return "admin/qlloaitour/index";
	}

	@RequestMapping("create")
	public String create(Model model, @ModelAttribute("form") LoaiTour entity) {
		String message = "";
		try {
			if (loaitourdao.existsById(entity.getIdLoaiTour())) {
				message = "Loại tour đã tồn tại!";
				return "redirect:/admin/qlloaitour/index?messagefail=" + StrUtils.encodeUrl(message);
			} else {
				loaitourdao.save(entity);
				model.addAttribute("form", new LoaiTour());
				message = "Tạo mới loại tour thành công!";
			}
		} catch (Exception e) {
			message = "Tạo mới thất bại";
			return "redirect:/admin/qlloaitour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlloaitour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("update")
	public String update(Model model, @ModelAttribute("form") LoaiTour entity) {
		String message = "";
		try {
			if (!loaitourdao.existsById(entity.getIdLoaiTour())) {
				message = "Loại tour không tồn tại!";
				return "redirect:/admin/qlloaitour/index?messagefail=" + StrUtils.encodeUrl(message);
			} else {
				loaitourdao.save(entity);
				message = "Cập nhật loại tour thành công!";
			}
		} catch (Exception e) {
			message = "Cập nhập thất bại";
			return "redirect:/admin/qlloaitour/index?messageerror=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlloaitour/index?messageok=" + StrUtils.encodeUrl(message);
	}

	@RequestMapping("delete/{idLoaiTour}")
	public String delete(Model model, @PathVariable("idLoaiTour") String idLoaiTour) {
		String message = "";
		try {
			loaitourdao.deleteById(idLoaiTour);
			message = "Xóa Thành Công";

		} catch (Exception e) {
			message = "Không thể xóa, Loại Tour Này Đang Được Sử Dụng!";
			return "redirect:/admin/qlloaitour/index?messagefail=" + StrUtils.encodeUrl(message);
		}
		return "redirect:/admin/qlloaitour/index?messageok=" + StrUtils.encodeUrl(message);
	}

}
