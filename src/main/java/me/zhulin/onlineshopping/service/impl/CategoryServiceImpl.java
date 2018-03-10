package me.zhulin.onlineshopping.service.impl;

import me.zhulin.onlineshopping.entity.ProductCategory;
import me.zhulin.onlineshopping.repository.ProductCategoryRepository;
import me.zhulin.onlineshopping.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
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
        List<ProductCategory> res = productCategoryRepository.findAll();
        res.sort(Comparator.comparing(ProductCategory::getCategoryType));
        return res;
    }

    @Override
    public List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList) {
        List<ProductCategory> res = productCategoryRepository.findByCategoryTypeIn(categoryTypeList);
        res.sort(Comparator.comparing(ProductCategory::getCategoryType));
        return res;
    }

    @Override
    public ProductCategory save(ProductCategory productCategory) {
        return productCategoryRepository.save(productCategory);
    }
}
