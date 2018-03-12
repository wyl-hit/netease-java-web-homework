package com.shopping.service;

import com.shopping.entity.ShoppingCar;

import java.util.List;

/**
 * Created by wyl on 2018/3/1.
 */
public interface ShoppingCarService {
    public ShoppingCar getShoppingCar(int userId, int productId);

    public void addShoppingCar(ShoppingCar shoppingCar);

    public boolean deleteShoppingCar(int userId,int productId);

    public boolean updateShoppingCar(ShoppingCar shoppingCar);

    public List<ShoppingCar> getShoppingCars(int userId);
}
