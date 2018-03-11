package me.zhulin.onlineshopping.controller;

import me.zhulin.onlineshopping.dto.Item;
import me.zhulin.onlineshopping.enums.ResultEnum;
import me.zhulin.onlineshopping.exception.MyException;
import me.zhulin.onlineshopping.form.ItemForm;
import me.zhulin.onlineshopping.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.naming.Binding;
import javax.validation.Valid;
import java.util.Collection;

/**
 * Created By Zhu Lin on 3/11/2018.
 */
@Controller
public class CartController {
    @Autowired
    CartService cartService;

    @GetMapping("/cart")
    public String findAll(Model model){
        Collection<Item> items = cartService.findAll();
        model.addAttribute("items", items);
        return "/cart/index";
    }

    @PostMapping("/cart")
    public String addToCart(@Valid ItemForm itemForm, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()){
            throw new MyException(ResultEnum.PARAM_ERROR.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }
        cartService.addItem(itemForm);
        return "redirect:" + "/product";
    }


}
