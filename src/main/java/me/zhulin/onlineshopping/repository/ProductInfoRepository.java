package me.zhulin.onlineshopping.repository;

import me.zhulin.onlineshopping.entity.ProductCategory;
import me.zhulin.onlineshopping.entity.ProductInfo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
public interface ProductInfoRepository extends JpaRepository<ProductInfo, String>{
    // One product
    ProductInfo findFirstByProductId(String id);
    // onsale product
    Page<ProductInfo> findAllByProductStatusOrderByProductIdAsc(Integer productStatus, Pageable pageable);

    // product in one category
    Page<ProductInfo> findAllByCategoryTypeOrderByProductIdAsc(Integer categoryType, Pageable pageable);

    Page<ProductInfo> findAllByOrderByProductId( Pageable pageable);

}
