package me.zhulin.onlineshopping.service;

import me.zhulin.onlineshopping.entity.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * Created By Zhu Lin on 3/14/2018.
 */
@Service
public interface OrderService {
    Page<Order> findAll(Pageable pageable);

    Page<Order> findByStatus(Integer status, Pageable pageable);

    Page<Order> findByBuyerEmail(String email, Pageable pageable);

    Page<Order> findByBuyerPhone(String phone, Pageable pageable);

    Order findOne(Integer orderId);

    void finish(Integer orderId);

    void  cancel(Integer orderId);

}
