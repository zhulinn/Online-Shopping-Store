//package me.zhulin.onlineshopping.repository;
//
//import me.zhulin.onlineshopping.entity.ProductCategory;
//import org.junit.Assert;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.Arrays;
//import java.util.List;
//import java.util.Optional;
//
//import static org.junit.Assert.*;
//
///**
// * Created By Zhu Lin on 3/9/2018.
// */
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class ProductCategoryRepositoryTest {
//
//    @Autowired
//    private ProductCategoryRepository repository;
//
//    @Test
//    public void findOneTest() {
//
//
//    }
//
//    @Test
//    @Transactional
//    public void saveTest() {
//        ProductCategory productCategory = new ProductCategory();
//        productCategory.setCategoryId(2);
//        productCategory.setCategoryName("Clothes");
//        productCategory.setCategoryType(2);
//        ProductCategory result = repository.save(productCategory);
//    }
//
//    @Test
//    public void findByCategoryTypeListTest() {
//        List<Integer> types = Arrays.asList(0,2);
//        List<ProductCategory> result = repository.findByCategoryTypeInOrderByCategoryTypeAsc(types);
//        Assert.assertEquals(2,result.size());
//    }
//
//    @Test
//    public void fingByCategoryType(){
//        ProductCategory res = repository.findByCategoryType(0);
//        Assert.assertEquals(new Integer(1),res.getCategoryId());
//    }
//}