package me.zhulin.onlineshopping.advice;

import me.zhulin.onlineshopping.entity.User;
import me.zhulin.onlineshopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

/**
 * Created By Zhu Lin on 3/13/2018.
 */
@ControllerAdvice
@DependsOn("passwordEncoder")
public class CurrentUserControllerAdvice {

    @Autowired

    UserService userService;

    @ModelAttribute("currentUser")
    public User getCurrentUser(Authentication authentication) {
        if(authentication == null) {
            return null;
        } else {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            User user = userService.findOne(userDetails.getUsername());// Email as username
            return user;
        }
    }

}
