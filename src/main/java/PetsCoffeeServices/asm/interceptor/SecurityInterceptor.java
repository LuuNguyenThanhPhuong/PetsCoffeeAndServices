package PetsCoffeeServices.asm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PetsCoffeeServices.asm.Entity.KhachHang;
import PetsCoffeeServices.asm.Entity.NhanVien;
import PetsCoffeeServices.asm.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import PetsCoffeeServices.asm.utils.StrUtils;


@Component
public class SecurityInterceptor implements HandlerInterceptor{
	@Autowired
    SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI() + "?" + request.getQueryString();
		KhachHang user = session.getUser();
		NhanVien admin = session.getAdmin();
		String error = "";
		
		if (uri.startsWith("/admin")) {
			if(admin == null) {
				error = "Vui lòng đăng nhập trước khi sử dụng chức năng này!";
				session.addSecurityUrl(uri);
				response.sendRedirect("/admin/account/login?message=" + StrUtils.encodeUrl(error) );
			
			}
			else if(admin.getVaiTro() == false && uri.startsWith("/admin/qlnhanvien") ||admin.getVaiTro() == false && uri.startsWith("/admin/qldontour")
					||admin.getVaiTro() == false && uri.startsWith("/admin/thongke")) {
				error = "Tài Khoản Không Có Quyền Admin";
				session.addSecurityUrl(uri);
				response.sendRedirect("/admin/account/login?message=" + StrUtils.encodeUrl(error) );
			}

			/*-- Không	 lỗi -> Cho phép truy xuất --*/
			else if(error.length() == 0) {
				return true;
			}
		}
		else if(uri.startsWith("/person")) {
			
		if (admin == null) {
			error = "Vui lòng đăng nhập trước khi sử dụng chức năng này!";
			session.addSecurityUrl(uri);
			response.sendRedirect("/admin/account/login?message=" + StrUtils.encodeUrl(error) );
		}
		else if(admin.getVaiTro() == true && uri.startsWith("/person/dontour")) {
			error = "Chỉ Có Person Mới Dùng Được Chức Năng Này";
			session.addSecurityUrl(uri);
			response.sendRedirect("/admin/account/login?message=" + StrUtils.encodeUrl(error) );
			}
		/*-- Không	 lỗi -> Cho phép truy xuất --*/
		else if(error.length() == 0) {
			return true;
			}
		}
		else if(uri.startsWith("/")) {
			
		if (user == null) {
			error = "Vui lòng đăng nhập trước khi sử dụng chức năng này!";
			session.addSecurityUrl(uri);
			response.sendRedirect("/account/login?message=" + StrUtils.encodeUrl(error) );
		}
		/*-- Không	 lỗi -> Cho phép truy xuất --*/
		else if(error.length() == 0) {
			return true;
			}
		}

		/*-- Có lỗi -> về đăng nhập --*/

		return false;
	}
}