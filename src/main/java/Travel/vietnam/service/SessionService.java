package Travel.vietnam.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Travel.vietnam.Entity.KhachHang;
import Travel.vietnam.Entity.NhanVien;

/**
 * Service này cung cấp phương thức thao tác session
 * @author Nguyễn Nghiệm
 * @version 1.0
 */

@Service
public class SessionService {
	@Autowired
	HttpSession session;
	/**
	 * Đọc user từ session
	 */
	public KhachHang getUser() {
		return (KhachHang) session.getAttribute("user");
	}
	public NhanVien getAdmin() {
		return (NhanVien) session.getAttribute("admin");
	}
	
	/**
	 * Lưu user vào session
	 */
	public void addUser(KhachHang user) {
		session.setAttribute("user", user);
	}
	public void addAdmin(NhanVien admin) {
		session.setAttribute("admin", admin);
	}
	/**
	 * Xóa user khỏi session
	 */
	public void removeUser() {
		session.removeAttribute("user");
	}
	public void removeAdmin() {
		session.removeAttribute("admin");
	}
	/**
	 * Đọc security-url từ session
	 */
	public String getSecurityUrl() {
		return (String) session.getAttribute("security-url");
	}
	/**
	 * Lưu security-url vào session
	 */
	public void addSecurityUrl(String securityUrl) {
		session.setAttribute("security-url", securityUrl);
	}
	/**
	 * Xóa security-url khỏi session
	 */
	public void removeSecurityUrl() {
		session.removeAttribute("security-url");
	}
	/**
	 * Hủy bỏ session hiện tại
	 */
	public void clear() {
		session.invalidate();
	}
}