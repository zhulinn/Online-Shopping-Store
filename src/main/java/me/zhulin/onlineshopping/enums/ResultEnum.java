package me.zhulin.onlineshopping.enums;

import lombok.Getter;

/**
 * Created By Zhu Lin on 3/10/2018.
 */
@Getter
public enum ResultEnum  {

    PARAM_ERROR(1, "Parameter Error"),
    PRODUCT_NOT_EXIST(10, "Product does not exit"),
    PRODUCT_NOT_ENOUGH(11, "Not enough products in stock"),
    PRODUCT_STATUS_ERROR(12, "Status is incorrect"),
    PRODUCT_OFF_SALE(13,"Product is off sale"),
    PRODUCT_NOT_IN_CART(14,"Product is not in the cart")


    ;

    private Integer code;

    private String message;

    ResultEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}