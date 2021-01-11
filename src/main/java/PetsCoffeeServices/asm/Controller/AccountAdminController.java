package PetsCoffeeServices.asm.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import PetsCoffeeServices.asm.service.SessionService;
import PetsCoffeeServices.asm.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import PetsCoffeeServices.asm.DAO.NhanVienDAO;
import PetsCoffeeServices.asm.Entity.NhanVien;
import PetsCoffeeServices.asm.service.CookieService;
import PetsCoffeeServices.asm.service.MailerService;
import PetsCoffeeServices.asm.utils.JsonUtils;
import PetsCoffeeServices.asm.utils.StrUtils;

/**
 * AccountAdminController là Controller chứa các phương thức để điều khiển các hành vi
 * của admin-person liên quan đến quản lí tài khoản
 * 
 * */

@Controller
public class AccountAdminController {

	@Autowired
	NhanVienDAO nhanVienDAO;
	@Autowired
    SessionService session;
	@Autowired
	CookieService cookie;
	@Autowired
	MailerService mailer;
	@Autowired
    UploadService upload;

	/**
	 * Phương thức này dùng để cho admin-person vào đăng nhập
	 * 
	 * @return vào form đăng nhập của admin-person
	 * */
	@GetMapping("/admin/account/login")
	public String login(Model model, HttpServletRequest request) {
		String value = cookie.getValue("admin", "");
		if (value.length() > 0) {
			String json = StrUtils.decode64(value);
			model.addAttribute("map", JsonUtils.toObject(json, Map.class));
		} else {
			model.addAttribute("map", null);
		}
		String message = request.getParameter("message");
		if (message != null) {
			request.setAttribute("message", message);
			request.setAttribute("modal", "show");
		}
		return "admin/account/login";
	}

	/**
	 * Phương thức này dùng để kiểm tra việc đăng nhập và đăng nhập vào của admin-person
	 * 
	 * @param maNhanVien là mã nhân viên(tài khoản đăng nhập)
	 * 
	 * @param password là mật khẩu
	 * 
	 * @param remember dùng để ghi nhớ tài khoản
	 * 
	 * @return vào form đăng nhập của admin-person hoặc là form mà admin-person muốn vào trước đó
	 * */
	@PostMapping("/admin/account/login")
	public String login(Model model, @RequestParam("maNhanVien") String maNhanVien,
			@RequestParam("password") String password,
			@RequestParam(name = "remember", defaultValue = "false") boolean remember) {
		try {
			NhanVien admin = nhanVienDAO.getOne(maNhanVien);

				if (admin.getIsDelete() == true) {
					model.addAttribute("message", "Không Tìm Thấy Tài Khoản Này");
					model.addAttribute("alerts", "danger");
				} else if (!admin.getPassword().equals(password)) {
					model.addAttribute("message", "Sai mật khẩu");
					model.addAttribute("alerts", "danger");
				} else {

					session.addAdmin(admin);
					model.addAttribute("message", "Đăng nhập thành công");
					model.addAttribute("alerts", "success");
					if (remember) {
						@SuppressWarnings("serial")
						Map<String, String> map = new HashMap<String, String>() {
							{
								put("maNhanVien", admin.getMaNhanVien());
								put("password", admin.getPassword());
							}
						};
						String json = JsonUtils.fromObject(map);
						cookie.create("admin", StrUtils.encode64(json), 30);
					} else {
						cookie.delete("admin");
					}
					String uri = session.getSecurityUrl();
					if (uri != null) {
						return "redirect:" + uri;
					}else if(uri == null) {
						return "admin/home/index";
					}
				}

		} catch (Exception e) {
			model.addAttribute("message", "Sai tên đăng nhập");
			model.addAttribute("alerts", "warning");
		}
		return "admin/account/login";
	}

	/**
	 * Phương thức này dùng để cho admin-person đăng xuất
	 * 
	 * @return về trang chủ admin
	 * */
	@GetMapping("/admin/account/logoff")
	public String logoff() {
		session.clear();
		return "redirect:/admin/home/index";
	}

	/**
	 * Phương thức này dùng để cho admin-person vào đổi mật khẩu
	 * 
	 * @return vào form đổi mật khẩu admin-person
	 * */
	@GetMapping("/admin/account/change")
	public String change() {
		return "admin/account/change";

	}

	/**
	 * Phương thức này dùng để kiểm tra việc đổi mật khẩu và đổi mật khẩu của admin-person
	 * 
	 * @param maNhanVien là mã nhân viên(tài khoản đăng nhập)
	 * 
	 * @param password là mật khẩu
	 * 
	 * @param newpwd là mật khẩu mới
	 * 
	 * @param confirm xác nhận mật khẩu mới
	 * 
	 * @return vào form đổi mật khẩu admin-person
	 * */
	@PostMapping("/admin/account/change")
	public String change(Model model, @RequestParam("maNhanVien") String maNhanVien,
			@RequestParam("password") String password, @RequestParam("newpwd") String newpwd,
			@RequestParam("confirm") String confirm) {
		if (!newpwd.equals(confirm)) {
			model.addAttribute("message", "Mật khẩu xác nhận không đúng");
			model.addAttribute("alerts", "warning");
		} else {
			try {
				NhanVien admin = nhanVienDAO.getOne(maNhanVien);
				if (!admin.getPassword().equals(password)) {
					model.addAttribute("message", "Sai mật khẩu");
					model.addAttribute("alerts", "danger");

				} else {
					admin.setPassword(newpwd);
					nhanVienDAO.save(admin);
					model.addAttribute("message", "Đổi mật khẩu thành công");
					model.addAttribute("alerts", "success");
				}
			} catch (Exception e) {
				model.addAttribute("message", "Không Tìm Thấy tài Khoản");
				model.addAttribute("alerts", "danger");
			}
		}

		return "admin/account/change";
	}

	/**
	 * Phương thức này dùng để cho admin-person vào lấy mật khẩu đã quên
	 * 
	 * @return vào form quên mật khẩu admin-person
	 * */
	@GetMapping("/admin/account/forgot")
	public String forgot() {
		return "admin/account/forgot";
	}

	/**
	 * Phương thức này dùng để lấy lại mật khẩu của admin-person
	 * 
	 * @param maNhanVien là mã nhân viên(tài khoản đăng nhập)
	 * 
	 * @param email là email
	 * 
	 * 
	 * @return vào form quên mật khẩu admin-person
	 * */
	@PostMapping("/admin/account/forgot")
	public String forgot(Model model, @RequestParam("maNhanVien") String maNhanVien,
			@RequestParam("email") String email) {
		try {
			NhanVien admin = nhanVienDAO.getOne(maNhanVien);

			if (!admin.getMaNhanVien().equals(maNhanVien)) {
				model.addAttribute("message", "Sai Tài Khoản");
				model.addAttribute("alerts", "danger");

			} else if (!admin.getEmail().equals(email)) {
				model.addAttribute("message", "Sai địa chỉ email");
				model.addAttribute("alerts", "danger");
			} else {
				/*
				 * Gửi mật khẩu qua email
				 */
				String message = "Mật khẩu của bạn đã được gửi qua email!";
				model.addAttribute("alerts", "success");
				try {
					String to = admin.getEmail();
					String subject = "Viet Travel - Du lịch toàn quốc - Quên Mật Khẩu";
					String body = "Quản Trị - Mật khẩu của bạn là " + admin.getPassword();
					mailer.send(to, subject, body);
				} catch (Exception e) {
					message = "Lỗi, không gửi mật khẩu qua email!";
					model.addAttribute("alerts", "danger");
				}
				model.addAttribute("message", message);
			}
		} catch (Exception e) {
			model.addAttribute("message", "Không Tìm Thấy tài Khoản");
			model.addAttribute("alerts", "danger");
		}
		return "admin/account/forgot";
	}


	/**
	 * Phương thức này dùng để cho admin-person vào cập nhập thông tin
	 * 
	 * @return vào form cập nhập thông tin admin-person
	 * */
	@GetMapping("/admin/account/edit")
	public String edit(Model model) {
		model.addAttribute("form", session.getAdmin());
		return "admin/account/edit";
	}

	/**
	 * Phương thức này dùng để cập nhập thông tin của admin-person
	 * 
	 * @param admin là NhanVienEntity
	 * 
	 * @param photo là đường dẫn file hình
	 * 
	 * 
	 * @return về form cập nhập thông tin admin-person
	 * */
	@PostMapping("/admin/account/edit")
	public String edit(Model model, @ModelAttribute("form") NhanVien admin,
			@RequestParam("photo_file") MultipartFile photo) {
		if (!nhanVienDAO.existsById(admin.getMaNhanVien())) {
			model.addAttribute("message", "Tài khoản không tồn tại!");
			model.addAttribute("alerts", "danger");
		} else {
			File file = upload.save(photo, "/static/images/photos/");
			System.out.print(file);
			if (file != null) {
				admin.setHinh(file.getName());
			}
			nhanVienDAO.save(admin);
			session.addAdmin(admin);
			model.addAttribute("message", "Cập nhật tài khoản thành công");
			model.addAttribute("alerts", "success");
		}
		return "admin/account/edit";
	}
}