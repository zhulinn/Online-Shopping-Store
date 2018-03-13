//package me.zhulin.onlineshopping.service.impl;
//
//import me.zhulin.onlineshopping.entity.ProductCategory;
//import me.zhulin.onlineshopping.entity.ProductInfo;
//import org.junit.Assert;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import java.util.Arrays;
//import java.util.List;
//import java.util.Optional;
//import java.util.Set;
//
//import static org.junit.Assert.*;
//
///**
// * Created By Zhu Lin on 3/10/2018.
// */
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class CategoryServiceImplTest {
//
//    @Autowired
//    private CategoryServiceImpl categoryService;
//
//    @Test
//    public void findOne() {
//        ProductCategory productCategory = categoryService.findByCategoryType(1);
//        Assert.assertEquals(new Integer(1),productCategory.getCategoryType());
//    }
//
//    @Test
//    public void findAll() {
//        List<ProductCategory> list = categoryService.findAll();
//        Assert.assertNotEquals(0,list.size());
//    }
//
//    @Test
//    public void findByCategoryTypeIn() {
//        List<ProductCategory> list = categoryService.findByCategoryTypeIn(Arrays.asList(1,2));
//        Assert.assertNotEquals(0, list.size());
//    }
//
//    @Test
//    public void save() {
//        ProductCategory productCategory = new ProductCategory("Drink",3);
//        ProductCategory res = categoryService.save(productCategory);
//        Assert.assertNotNull(res);
//    }
//
//
//}