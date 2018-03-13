package me.zhulin.onlineshopping.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import me.zhulin.onlineshopping.entity.ProductInfo;
import me.zhulin.onlineshopping.enums.ProductStatusEnum;
import me.zhulin.onlineshopping.service.CategoryService;
import me.zhulin.onlineshopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
@Controller

public class ProductController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    /**
     * Show All Categories
     */
    @GetMapping({"/product","/"})
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

    @GetMapping("/product/{productId}")
    public String showOne(@PathVariable("productId") String productId, Model model) {

            ProductInfo productInfo = productService.findOne(productId);

        // Product is not available
        if (productInfo.getProductStatus() == ProductStatusEnum.DOWN.getCode()) {
            model.addAttribute("msg", "Product is unavailable!");
            model.addAttribute("url", "/");
            return  "common/error";
        }
        model.addAttribute(productInfo);
        return "/product/show";
    }
}
