package PetsCoffeeServices.asm;

import PetsCoffeeServices.asm.interceptor.SecurityInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SecurityConfig implements WebMvcConfigurer {
	@Autowired
    SecurityInterceptor interceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {	
		registry.addInterceptor(interceptor)
			.addPathPatterns("/account/change", "/account/edit", "/account/logoff","/buttons","/paytour/**","/trangthaitour/**")
			.addPathPatterns("/admin/**", "/person/**").excludePathPatterns("/admin/home/index","admin/home/person", "/admin/account/login", "/admin/account/forgot", "/admin/account/register");
	}
}