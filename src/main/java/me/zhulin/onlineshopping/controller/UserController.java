package me.zhulin.onlineshopping.controller;

import me.zhulin.onlineshopping.entity.User;
import me.zhulin.onlineshopping.exception.MyException;
import me.zhulin.onlineshopping.form.UserForm;
import me.zhulin.onlineshopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.security.Principal;

/**
 * Created By Zhu Lin on 3/12/2018.
 */
@Controller
public class UserController {

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
        User userWithEnteredEmailExists = userService.findOne(user.getEmail());
        if (userWithEnteredEmailExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
        }

        // 使用BindingResult来验证表单数据的正确性
        if (bindingResult.hasErrors()) {
            // 将提交的表单内容原封不动的返回到页面再展示出来
            redirectAttributes.addFlashAttribute("user", user);
            return "register";
        }
        userService.save(user);
        return "redirect:" + "/login";
    }

    @GetMapping("/profiles")
    public String showUser(User user) {
        return "/user/show";
    }

    @PostMapping("/profiles")
    public String editUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult, RedirectAttributes redirectAttributes, Principal principal){
        // 使用BindingResult来验证表单数据的正确性
        if (bindingResult.hasErrors()) {
            // 将提交的表单内容原封不动的返回到页面再展示出来
            redirectAttributes.addFlashAttribute("user", user);
            return "/user/show";
        }
        //Access deny
        if(!principal.getName().equals(user.getName())) {
            return "redirect:" + "/403";
        }
        userService.save(user);
        return "/user/show";
    }
    @GetMapping("/403")
    public String accessDeney(Model model) {
        model.addAttribute("msg", "Access denied!");
        return "/common/error";
    }
}
