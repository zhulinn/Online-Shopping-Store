package me.zhulin.onlineshopping.repository;

import me.zhulin.onlineshopping.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created By Zhu Lin on 3/9/2018.
 */
public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Integer> {
    List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypes);
}
