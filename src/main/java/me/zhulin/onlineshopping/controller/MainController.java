package me.zhulin.onlineshopping.controller;

import me.zhulin.onlineshopping.entity.User;
import me.zhulin.onlineshopping.form.UserForm;
import me.zhulin.onlineshopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * Created By Zhu Lin on 3/12/2018.
 */
@Controller
public class MainController {

    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String showForm(User user) {
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        // 使用BindingResult来验证表单数据的正确性
        if (bindingResult.hasErrors()) {
            // 将提交的表单内容原封不动的返回到页面再展示出来
            redirectAttributes.addFlashAttribute("person", user);
            return "register";
        }
        userService.save(user);
        return "redirect:" + "/";
    }

    @GetMapping("/403")
    public String accessDeney(Model model) {
        model.addAttribute("msg", "Access denied!");
        return "/common/error";
    }
}
