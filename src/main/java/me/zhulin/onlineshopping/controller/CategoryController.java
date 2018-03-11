package me.zhulin.onlineshopping.controller;

import me.zhulin.onlineshopping.entity.ProductCategory;
import me.zhulin.onlineshopping.entity.ProductInfo;
import me.zhulin.onlineshopping.service.CategoryService;
import me.zhulin.onlineshopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
@Controller
public class CategoryController {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;

    /**
     * Show All Categories
     */
    @GetMapping({"/product","/index","/"})
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

    @GetMapping("/category/{type}")
    public ModelAndView showOne(@PathVariable("type") Integer categoryType,
                                @RequestParam(value = "page", defaultValue = "1") Integer page,
                                @RequestParam(value = "size", defaultValue = "3") Integer size,
                                Map<String, Object> map) {
        ProductCategory res = categoryService.findByCategoryType(categoryType);
        if(res != null){
            PageRequest request =  PageRequest.of(page - 1, size);
            Page<ProductInfo> productInCategory = productService.findAllInCategory(categoryType,request);
            map.put("category",res);
            map.put("products",productInCategory);
            map.put("currentPage",page);
            map.put("size",size);
            return new ModelAndView("/category/show",map);
        }else {
            map.put("msg", "Category is not found!");
            map.put("url", "/category/index");
            return new ModelAndView("common/error", map);
        }
    }
}
