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
@Controller
@SpringBootApplication
public class OnlineShoppingApplication {
	@Autowired
	ProductService productService;
	// Spring Boot 5.0 Requirement
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();   // 使用 BCrypt 加密
	}
	@RequestMapping("/")
	public ModelAndView findAll(@RequestParam(value = "page", defaultValue = "1") Integer page,
								@RequestParam(value = "size", defaultValue = "3") Integer size,
								Map<String, Object> map){
		PageRequest request =  PageRequest.of(page - 1, size);
		Page<ProductInfo> products = productService.findAll(request);
		map.put("products",products);
		map.put("currentPage",page);
		map.put("size",size);
		return new ModelAndView("/product/index",map);
	}
	public static void main(String[] args) {
		SpringApplication.run(OnlineShoppingApplication.class, args);
	}
}
