package me.zhulin.onlineshopping.controller;

import me.zhulin.onlineshopping.entity.ProductCategory;
import me.zhulin.onlineshopping.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    /**
     * Show All Categories
     */
    @GetMapping({"/category","/category/index"})
    public ModelAndView findAll(){
        ModelAndView modelAndView = new ModelAndView("category/index");
        List<ProductCategory> categoryList = categoryService.findAll();
        modelAndView.addObject("categoryList", categoryList);
        return modelAndView;
    }

    @GetMapping("/category/{id}")
    public ModelAndView showOne(@PathVariable("id") Integer categoryId, Map<String, Object> map) {
        Optional<ProductCategory> res = categoryService.findOne(categoryId);
        if(res.isPresent()){
            map.put("category",res.get());
            return new ModelAndView("/category/show",map);
        }else {
            map.put("msg", "Category is not found!");
            map.put("url", "/category/index");
            return new ModelAndView("common/error", map);
        }

    }
}
