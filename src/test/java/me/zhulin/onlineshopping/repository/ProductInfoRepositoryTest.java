//package me.zhulin.onlineshopping.repository;
//
//import me.zhulin.onlineshopping.entity.ProductInfo;
//import me.zhulin.onlineshopping.service.CategoryService;
//import org.junit.Assert;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringRunner;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.math.BigDecimal;
//import java.util.List;
//
//import static org.junit.Assert.*;
//
///**
// * Created By Zhu Lin on 3/10/2018.
// */
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class ProductInfoRepositoryTest {
//
//    @Autowired
//    ProductInfoRepository productInfoRepository;
//@Autowired
//ProductCategoryRepository productCategoryRepository;
//
//    @Test
//    public void saveTest() {
//        ProductInfo productInfo = new ProductInfo();
//        productInfo.setProductId("D0001");
//        productInfo.setProductName("Coca Cola");
//        productInfo.setProductPrice(new BigDecimal(1));
//        productInfo.setProductStock(100);
//        productInfo.setProductDescription("Everyone likes it");
//        productInfo.setProductIcon("https://img12.360buyimg.com/n7/jfs/t3187/277/6473801213/165201/24ced907/58a57337N7db0db97.jpg");
//        productInfo.setCategoryType(3);
//        productInfo.setProductStatus(0);
//        ProductInfo res = productInfoRepository.save(productInfo);
//        Assert.assertEquals(productInfo.getProductName(),res.getProductName());
//
//    }
//
//
//
//
//}