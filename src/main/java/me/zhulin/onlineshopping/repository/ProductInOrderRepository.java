package me.zhulin.onlineshopping.repository;

import me.zhulin.onlineshopping.entity.ProductInOrder;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;

/**
 * Created By Zhu Lin on 3/14/2018.
 */
public interface ProductInOrderRepository extends JpaRepository<ProductInOrder, Long> {

}
