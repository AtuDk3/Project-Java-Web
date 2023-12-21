/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.impl;

import dal.CartItemDao;
import dal.impl.CartItemDaoImpl;
import java.util.List;
import model.Cart;
import model.CartItem;
import service.CartItemService;

/**
 *
 * @author Lenovo
 */
public class CartItemServiceImpl implements CartItemService{
    
    CartItemDao cartItemDao = new CartItemDaoImpl();

    @Override
    public void insert(CartItem cartItem) {
        cartItemDao.insert(cartItem);
    }

    @Override
    public void edit(CartItem cartItem) {
        CartItem cartItemOld = cartItemDao.get(cartItem.getIdCartItem());
        
        cartItemOld.setQuantity(cartItem.getQuantity());
        cartItemOld.setProduct(cartItem.getProduct());
        cartItemOld.setCart(cartItem.getCart());
        
        cartItemDao.edit(cartItemOld);
    }

    @Override
    public void delete(int idCartItem) {
        cartItemDao.delete(idCartItem);
    }

    @Override
    public CartItem get(int idCartItem) {
        return cartItemDao.get(idCartItem);
    }

    @Override
    public List<CartItem> getAll() {
        return cartItemDao.getAll();
    }

    @Override
    public List<CartItem> search(String txtSearch) {
        return cartItemDao.search(txtSearch);
    }

   
    
}
