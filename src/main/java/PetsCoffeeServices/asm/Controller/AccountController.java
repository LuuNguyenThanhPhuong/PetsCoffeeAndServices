package PetsCoffeeServices.asm.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import PetsCoffeeServices.asm.DAO.KhachHangDAO;
import PetsCoffeeServices.asm.Entity.KhachHang;
import PetsCoffeeServices.asm.service.SessionService;
import PetsCoffeeServices.asm.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import PetsCoffeeServices.asm.service.CookieService;
import PetsCoffeeServices.asm.service.MailerService;
import PetsCoffeeServices.asm.utils.JsonUtils;
import PetsCoffeeServices.asm.utils.StrUtils;
/**
 * AccountController là Controller chứa các phương thức để điều khiển các hành vi
 * của khách hàng liên quan đến quản lí tài khoản
 * 
 * */

@Controller
public class AccountController {

	@Autowired
    KhachHangDAO khachhangdao;
	@Autowired
    SessionService session;
	@Autowired
	CookieService cookie;
	@Autowired
	MailerService mailer;
	@Autowired
    UploadService upload;

	/**
	 * Phương thức này dùng để cho khách hàng vào view from đăng nhập
	 * 
	 * @return vào form đăng nhập của khách hàng
	 * */
	@GetMapping("/account/login")
	public String login(Model model, HttpServletRequest request) {
		String value = cookie.getValue("user", "");
		if (value.length() > 0) {
			String json = StrUtils.decode64(value);
			model.addAttribute("map", JsonUtils.toObject(json, Map.class));
		} else {
			model.addAttribute("map", null);
		}
		String message = request.getParameter("message");
		String messageactive = request.getParameter("messageactive");
		if (message != null) {
			request.setAttribute("message", message);
			request.setAttribute("modal", "show");
		}
		if (messageactive != null) {
			request.setAttribute("messageactive", messageactive);
			request.setAttribute("modalactive", "show");
		}
		return "account/login";
	}

	/**
	 * Phương thức này dùng để kiểm tra việc đăng nhập và đăng nhập vào của khách hàng
	 * 
	 * @param maKhachHang là mã khách hàng(tài khoản đăng nhập)
	 * 
	 * @param password là mật khẩu
	 * 
	 * @param remember dùng để ghi nhớ tài khoản
	 * 
	 * @return vào form đăng nhập của khách hàng hoặc là form mà khách hàng muốn vào trước đó
	 * */
	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("maKhachHang") String maKhachHang,
			@RequestParam("password") String password,
			@RequestParam(name = "remember", defaultValue = "false") boolean remember) {
		try {
			KhachHang user = khachhangdao.getOne(maKhachHang);
			if (user.getIsDelete() == true) {
				model.addAttribute("message", "Không Tìm Thấy Tài Khoản Này");
				model.addAttribute("alerts", "danger");
			}
			else if (user.isActive() != true) {
				model.addAttribute("message", "Tài khoản chưa kích hoạt");
				model.addAttribute("alerts", "warning");
			} else if (!user.getPassword().equals(password)) {
				model.addAttribute("message", "Sai mật khẩu");
				model.addAttribute("alerts", "danger");
			} else {

				session.addUser(user);
				model.addAttribute("message", "Đăng nhập thành công");
				model.addAttribute("alerts", "success");
				if (remember) {
					@SuppressWarnings("serial")
					Map<String, String> map = new HashMap<String, String>() {
						{
							put("maKhachHang", user.getMaKhachHang());
							put("password", user.getPassword());
						}
					};
					String json = JsonUtils.fromObject(map);
					cookie.create("user", StrUtils.encode64(json), 30);
				} else {
					cookie.delete("user");
				}
				String uri = session.getSecurityUrl();
				if (uri != null) {
					return "redirect:" + uri;
				}else if(uri == null) {
					return "redirect:/home/index";
				}
				
			}
		} catch (Exception e) {
			model.addAttribute("message", "Sai tên đăng nhập");
			model.addAttribute("alerts", "warning");
		}
		return "account/login";
	}

	/**
	 * Phương thức này dùng để cho khách hàng đăng xuất
	 * 
	 * @return về trang chủ khách hàng
	 * */
	@GetMapping("/account/logoff")
	public String logoff() {
		session.clear();
		return "redirect:/home/index";
	}

	/**
	 * Phương thức này dùng để cho khách hàng vào đổi mật khẩu
	 * 
	 * @return vào form đổi mật khẩu khách hàng
	 * */
	@GetMapping("/account/change")
	public String change() {
		return "account/change";

	}

	/**
	 * Phương thức này dùng để kiểm tra việc đổi mật khẩu và đổi mật khẩu của khách hàng
	 * 
	 * @param maKhachHang là mã khách hàng(tài khoản đăng nhập)
	 * 
	 * @param password là mật khẩu
	 * 
	 * @param newpwd là mật khẩu mới
	 * 
	 * @param confirm xác nhận mật khẩu mới
	 * 
	 * @return vào form đổi mật khẩu khách hàng
	 * */
	@PostMapping("/account/change")
	public String change(Model model, @RequestParam("maKhachHang") String maKhachHang,
			@RequestParam("password") String password, @RequestParam("newpwd") String newpwd,
			@RequestParam("confirm") String confirm) {
		if (!newpwd.equals(confirm)) {
			model.addAttribute("message", "Mật khẩu xác nhận không đúng");
			model.addAttribute("alerts", "warning");
		} else {
			try {
				KhachHang user = khachhangdao.getOne(maKhachHang);
				if (!user.getPassword().equals(password)) {
					model.addAttribute("message", "Sai mật khẩu");
					model.addAttribute("alerts", "danger");

				} else {
					user.setPassword(newpwd);
					khachhangdao.save(user);
					model.addAttribute("message", "Đổi mật khẩu thành công");
					model.addAttribute("alerts", "success");
				}
			} catch (Exception e) {
				model.addAttribute("message", "Không Tìm Thấy Tài Khoản Này");
				model.addAttribute("alerts", "danger");
			}
		}

		return "account/change";
	}

	/**
	 * Phương thức này dùng để cho khách hàng vào lấy mật khẩu đã quên
	 * 
	 * @return vào form quên mật khẩu khách hàng
	 * */
	@GetMapping("/account/forgot")
	public String forgot() {
		return "account/forgot";
	}

	/**
	 * Phương thức này dùng để lấy lại mật khẩu của khách hàng
	 * 
	 * @param maKhachHang là mã khách hàng(tài khoản đăng nhập)
	 * 
	 * @param email là email
	 * 
	 * 
	 * @return vào form quên mật khẩu khách hàng
	 * */
	@PostMapping("/account/forgot")
	public String forgot(Model model, @RequestParam("maKhachHang") String maKhachHang,
			@RequestParam("email") String email) {
		try {
			KhachHang user = khachhangdao.getOne(maKhachHang);

			if (user.isActive() != true) {
				model.addAttribute("message", "Tài khoản chưa kích hoạt");
				model.addAttribute("alerts", "warning");
			} else if (!user.getMaKhachHang().equals(maKhachHang)) {
				model.addAttribute("message", "Sai Tài Khoản");
				model.addAttribute("alerts", "danger");
			
			} else if (!user.getEmail().equals(email)) {
				model.addAttribute("message", "Sai địa chỉ email");
				model.addAttribute("alerts", "danger");
			} else {
				/*
				 * Gửi mật khẩu qua email
				 */
				String message = "Mật khẩu của bạn đã được gửi qua email!";
				model.addAttribute("alerts", "success");
				try {
					String to = user.getEmail();
					String subject = "Viet Travel - Du lịch toàn quốc - Quên Mật Khẩu";
					String body = "Cảm ơn bạn đã sử dụng dịch vụ. Mật khẩu của bạn là " + user.getPassword();
					mailer.send(to, subject, body);
				} catch (Exception e) {
					message = "Lỗi, không gửi mật khẩu qua email!";
					model.addAttribute("alerts", "danger");
				}
				model.addAttribute("message", message);
			}
		} catch (Exception e) {
			model.addAttribute("message", "Không Tìm Thấy Tài Khoản Này");
			model.addAttribute("alerts", "danger");
		}
		return "account/forgot";
	}

	/**
	 * Phương thức này dùng để cho khách hàng vào đăng kí tài khoản
	 * 
	 * @return vào form đăng kí tài khoản khách hàng
	 * */
	@GetMapping("/account/register")
	public String register(Model model) {
		model.addAttribute("form", new KhachHang());
		return "account/register";
	}

	/**
	 * Phương thức này dùng để cho khách hàng đăng kí tài khoản
	 * 
	 * @param user là KhachhangEntity
	 * 
	 * @param photo là đường dẫn file hình
	 * 
	 * @return về form đăng kí tài khoản khách hàng
	 * */
	@PostMapping("/account/register")
	public String register(Model model, @ModelAttribute("form") KhachHang user,
			@RequestParam("photo_file") MultipartFile photo, HttpServletRequest request) {
		if (khachhangdao.existsById(user.getMaKhachHang())) {
			model.addAttribute("message", "Tài Khoản Đã Tồn Tại");
			model.addAttribute("alerts", "danger");
		} else {
			File file = upload.save(photo, "/static/images/photos/");
			if (file != null) {
				user.setHinh(file.getName());
			}
			
			user.setIsDelete(false);
			khachhangdao.save(user);
			/*
			 * Gửi mail kích hoạt tài khoản
			 */
			String message = "Đăng ký thành công. Vui lòng kích hoạt qua email!";
			model.addAttribute("alerts", "success");
			try {
				String activateUrl = request.getRequestURL().toString().replace("register",
						"activate/" + user.getMaKhachHang());
				String to = user.getEmail();
				String subject = "Viet Travel - Du lịch toàn quốc - Xác Nhận Email";
				String body = "Nhấn vào đây để <a href='" + activateUrl + "'>Kích Hoạt</a> tài khoản của bạn!"
						+ "<hr>"
						+ user.getMaKhachHang() + ". Cảm ơn bạn đã sử dụng";
				mailer.send(to, subject, body);
			} catch (Exception e) {
				message = "Lỗi, không gửi được email kích hoạt!";
				model.addAttribute("alerts", "danger");
			}
			model.addAttribute("message", message);
		}
		return "account/register";
	}

	/**
	 * Phương thức này dùng để kích hoạt tài khoản cho khách hàng
	 * 
	 * @param maKhachHang là mã khách hàng(tài khoản đăng nhập)
	 * 
	 * @return về form đăng nhập khách hàng
	 * */
	@GetMapping("/account/activate/{maKhachHang}")
	public String activate(Model model ,@PathVariable("maKhachHang") String maKhachHang) {
		String message = "Tài khoản của bạn đã được kích hoạt thành công";
		model.addAttribute("alerts", "success");
		try {
			KhachHang user = khachhangdao.getOne(maKhachHang);
			user.setActive(true);
			khachhangdao.save(user);
		} catch (Exception e) {
			message = "Lỗi: Tài khoản không tồn tại!";
			model.addAttribute("alerts", "danger");
		}
		return "redirect:/account/login?messageactive=" + StrUtils.encodeUrl(message);
	}
	
	/**
	 * Phương thức này dùng để cho khách hàng vào cập nhập thông tin đã có
	 * 
	 * @return vào form cập nhập thông tin khách hàng
	 * */
	@GetMapping("/account/edit")
	public String edit(Model model) {
		model.addAttribute("form", session.getUser());
		return "account/edit";
	}
	
	/**
	 * Phương thức này dùng để cập nhập thông tin của khách hàng
	 * 
	 * @param user là KhachhangEntity
	 * 
	 * @param photo là đường dẫn file hình
	 * 
	 * 
	 * @return về form cập nhập thông tin khách hàng
	 * */
	@PostMapping("/account/edit")
	public String edit(Model model, 
			@ModelAttribute("form") KhachHang user, 
			@RequestParam("photo_file") MultipartFile photo) {
		if(!khachhangdao.existsById(user.getMaKhachHang())) {
			model.addAttribute("message", "Tài khoản không tồn tại!");
			model.addAttribute("alerts", "danger");
		}
		else {
			File file = upload.save(photo, "/static/images/photos/");
			if(file != null) {
				user.setHinh(file.getName());
			}
			khachhangdao.save(user);
			session.addUser(user);
			model.addAttribute("message", "Cập nhật tài khoản thành công");
			model.addAttribute("alerts", "success");
		}
		return "account/edit";
	}
}