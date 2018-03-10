package me.zhulin.onlineshopping.service;

import me.zhulin.onlineshopping.entity.ProductCategory;

import javax.persistence.OrderBy;
import java.util.List;
import java.util.Optional;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
public interface CategoryService {
    Optional<ProductCategory> findOne(Integer categoryId);

    List<ProductCategory> findAll();


    List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList);

    ProductCategory save(ProductCategory productCategory);

}
