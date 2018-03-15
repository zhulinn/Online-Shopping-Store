package me.zhulin.onlineshopping.entity;

import lombok.Data;
import me.zhulin.onlineshopping.enums.OrderStatusEnum;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Order contains User info and products in the order
 * Created By Zhu Lin on 3/14/2018.
 */
@Entity
@Data
@DynamicUpdate
public class Order implements Serializable{
    private static final long serialVersionUID = -3819883511505235030L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long orderId;

    @NotEmpty
    private String buyerEmail;

    @NotEmpty
    private String buyerName;

    @NotEmpty
    private String buyerPhone;

    @NotEmpty
    private String buyerAddress;

    @NotNull
    private BigDecimal orderAmount;

    /** 订单状态, 默认为0新下单. */
    private Integer orderStatus = OrderStatusEnum.NEW.getCode();

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateTime;

    public Order() {
    }
}
