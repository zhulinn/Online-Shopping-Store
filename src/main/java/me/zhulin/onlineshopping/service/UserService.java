package me.zhulin.onlineshopping.service;

import me.zhulin.onlineshopping.entity.User;
import org.springframework.stereotype.Service;

import java.util.Collection;

/**
 * Created By Zhu Lin on 3/13/2018.
 */
public interface UserService {
    User findOne(String email);
    Collection<User> findByRole(String role);
    void save(User user);
    void update(User user);
}
