/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.impl;

import dal.CartDao;
import dal.impl.CartDaoImpl;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import service.CartService;

/**
 *
 * @author Lenovo
 */
public class CartServiceImpl implements CartService {
    
    CartDao cartDao = new CartDaoImpl();

    @Override
    public void insert(Cart cart) {
        cartDao.insert(cart);
        
    }

    @Override
    public void edit(Cart cart) {
        Cart oldCart = cartDao.get(cart.getIdCart());
        
        oldCart.setBuyer(cart.getBuyer());
        oldCart.setBuyDate(cart.getBuyDate());
        
        cartDao.edit(oldCart);
    }

    @Override
    public void delete(String idCart) {
        cartDao.delete(idCart);
    }

    @Override
    public Cart get(String idCart) {
        return cartDao.get(idCart);
    }

    @Override
    public List<Cart> getAll() {
        return cartDao.getAll();
    }

    @Override
    public List<Cart> search(String txtSearch) {
        return cartDao.search(txtSearch);
    }

    @Override
    public void processedOrder(Cart cart) {
        Cart oldCart = cartDao.get(cart.getIdCart());
        
        oldCart.setStatusOrder(cart.getStatusOrder());
        
        cartDao.processedOrder(oldCart);
    }

    @Override
    public List<Cart> getByUser(int id) {
        return cartDao.getByUser(id);
    }
    
}
