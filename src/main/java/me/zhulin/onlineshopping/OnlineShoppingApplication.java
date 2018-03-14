package me.zhulin.onlineshopping;

import me.zhulin.onlineshopping.entity.ProductInfo;
import me.zhulin.onlineshopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.freemarker.FreeMarkerAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;
@SpringBootApplication
public class OnlineShoppingApplication {
	@Autowired
	ProductService productService;
	// Spring Boot 5.0 Requirement
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();   // 使用 BCrypt 加密
	}

	public static void main(String[] args) {
		SpringApplication.run(OnlineShoppingApplication.class, args);
	}
}
