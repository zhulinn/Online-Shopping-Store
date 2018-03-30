package me.zhulin.onlineshopping.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import me.zhulin.onlineshopping.entity.ProductInfo;
import me.zhulin.onlineshopping.entity.User;
import me.zhulin.onlineshopping.enums.ProductStatusEnum;
import me.zhulin.onlineshopping.service.CategoryService;
import me.zhulin.onlineshopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
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

    @GetMapping("/product")
    public ModelAndView findAll(@RequestParam(value = "page", defaultValue = "1") Integer page,
                          @RequestParam(value = "size", defaultValue = "3") Integer size,
                          Map<String, Object> map) {
        PageRequest request = PageRequest.of(page - 1, size);
        Page<ProductInfo> products = productService.findAll(request);
        map.put("products", products);
        map.put("currentPage", page);
        map.put("size", size);
        return new ModelAndView("/product/index", map);
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

    /**
     * Seller
     */

    @GetMapping({"/seller","seller/product"})
    public ModelAndView sellerFindAll(@RequestParam(value = "page", defaultValue = "1") Integer page,
                                      @RequestParam(value = "size", defaultValue = "5") Integer size,
                                      Map<String, Object> map) {
        PageRequest request = PageRequest.of(page - 1, size);
        Page<ProductInfo> products = productService.findAll(request);
        map.put("products", products);
        map.put("statusArray", new String[] {"Available","Unavailable"});
        map.put("categoryArray", new String[] {"Books","Food","Clothes", "Drink"});
        map.put("currentPage", page);
        map.put("size", size);
        return new ModelAndView("/product/sellerIndex", map);
    }

    @GetMapping("/seller/product/{id}/edit")
    public String productEdit(@PathVariable("id") String productId, Model model){
        ProductInfo product = productService.findOne(productId);
        model.addAttribute("product", product);

        return "product/sellerEdit";
    }

    @PostMapping("/seller/product/{id}/edit")
    public String edit(@PathVariable("id") String productId,
                       @RequestParam("categoryType") Integer categoryType,
                       @RequestParam("productStatus") Integer productStatus,
                       @Valid @ModelAttribute("product") ProductInfo product, Model model){
        if (!productId.equals(product.getProductId())) {
            model.addAttribute("msg", "Product id is not consistent!");
            model.addAttribute("url", "/");
            return  "common/error";
        }
        product.setCategoryType(categoryType);
        product.setProductStatus(productStatus);
        productService.update(product);
        return "redirect:" + "/";
    }

}
