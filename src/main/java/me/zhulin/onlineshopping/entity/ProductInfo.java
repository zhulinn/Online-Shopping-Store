package me.zhulin.onlineshopping.entity;

import lombok.Data;
import me.zhulin.onlineshopping.enums.ProductStatusEnum;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
@Entity
@Data
@DynamicUpdate
public class ProductInfo implements Serializable{
    @Id
    @GeneratedValue
    private String productId;

    /** 名字. */
    private String productName;

    /** 单价. */
    private BigDecimal productPrice;

    /** 库存. */
    private Integer productStock;

    /** 描述. */
    private String productDescription;

    /** 小图. */
    private String productIcon;

    /** 状态, 0正常1下架. */
    private Integer productStatus = ProductStatusEnum.UP.getCode();

    /** 类目编号. */
    private Integer categoryType;

    private Date createTime;

    private Date updateTime;

    public ProductInfo() {
    }
}
