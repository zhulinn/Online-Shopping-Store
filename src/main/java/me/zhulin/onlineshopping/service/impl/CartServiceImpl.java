package me.zhulin.onlineshopping.service.impl;

import me.zhulin.onlineshopping.dto.Item;
import me.zhulin.onlineshopping.entity.ProductInfo;
import me.zhulin.onlineshopping.enums.ProductStatusEnum;
import me.zhulin.onlineshopping.enums.ResultEnum;
import me.zhulin.onlineshopping.exception.MyException;
import me.zhulin.onlineshopping.form.ItemForm;
import me.zhulin.onlineshopping.service.CartService;
import me.zhulin.onlineshopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import java.math.BigDecimal;
import java.util.*;

/**
 * Created By Zhu Lin on 3/11/2018.
 */
@Service
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CartServiceImpl implements CartService {
    @Autowired
    ProductService productService;

    private Map<String, Item> map = new LinkedHashMap<>();

    @Override
    public void addItem(ItemForm itemForm) {
        ProductInfo productInfo = productService.findOne(itemForm.getProductId());

        if (productInfo.getProductStatus() == ProductStatusEnum.DOWN.getCode()) {
            throw new MyException(ResultEnum.PRODUCT_OFF_SALE);
        }

        // Check whether is in the cart
        if(map.containsKey(itemForm.getProductId())){
            // Update quantity
            Integer old = map.get(itemForm.getProductId()).getQuantity();
            itemForm.setQuantity(old + itemForm.getQuantity());
        }

        map.put(itemForm.getProductId(), new Item(productInfo, itemForm.getQuantity()));
    }

    @Override
    public void removeItem(String productId) {
        if (!map.containsKey(productId)) throw new MyException(ResultEnum.PRODUCT_NOT_IN_CART);
        map.remove(productId);
    }

    @Override
    public void updateQuantity(String productId, Integer quantity) {
        if (!map.containsKey(productId)) throw new MyException(ResultEnum.PRODUCT_NOT_IN_CART);
        Item item = map.get(productId);
        Integer max = item.getProductInfo().getProductStock();
        if(quantity > 0) {
            item.setQuantity(quantity > max ? max : quantity);
        }
    }

    @Override
    public Collection<Item> findAll() {
        return map.values();
    }

    @Override
    @Transactional
    public void checkout() {
        //TODO
        // Order Detail
        // Login Check to get user's detail

        for (String productId : map.keySet()) {
            productService.decreaseStock(productId, map.get(productId).getQuantity());
        }
        map.clear();
    }

    @Override
    public BigDecimal getTotal() {
        Collection<Item> items = findAll();
        BigDecimal total = new BigDecimal(0);
        for (Item item : items) {
            BigDecimal price = item.getProductInfo().getProductPrice();
            BigDecimal quantity = new BigDecimal(item.getQuantity());
            total = total.add(price.multiply(quantity));
        }
        return total;
    }
}
