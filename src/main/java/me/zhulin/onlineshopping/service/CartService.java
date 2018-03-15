package me.zhulin.onlineshopping.service;

import me.zhulin.onlineshopping.dto.Item;
import me.zhulin.onlineshopping.entity.User;
import me.zhulin.onlineshopping.form.ItemForm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
public interface CartService {
    void addItem(ItemForm itemForm);
    void removeItem(String productId);
    void updateQuantity(String productId, Integer quantity);

    Collection<Item> findAll();

    void  checkout(User user);

    BigDecimal getTotal();

}
