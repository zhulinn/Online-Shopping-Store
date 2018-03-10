package me.zhulin.onlineshopping.service.impl;

import me.zhulin.onlineshopping.entity.ProductCategory;
import me.zhulin.onlineshopping.repository.ProductCategoryRepository;
import me.zhulin.onlineshopping.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    ProductCategoryRepository productCategoryRepository;

    @Override
    public Optional<ProductCategory> findOne(Integer categoryId) {
        return productCategoryRepository.findById(categoryId);
    }

    @Override
    public List<ProductCategory> findAll() {
        return productCategoryRepository.findAll();
    }

    @Override
    public List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList) {
        return productCategoryRepository.findByCategoryTypeIn(categoryTypeList);
    }

    @Override
    public ProductCategory save(ProductCategory productCategory) {
        return productCategoryRepository.save(productCategory);
    }
}
