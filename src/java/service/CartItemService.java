/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.util.List;
import model.CartItem;

/**
 *
 * @author Lenovo
 */
public interface CartItemService {
    void insert(CartItem cartItem);
    
    void edit(CartItem cartItem);
    
    void delete(int idCartItem);
    
    CartItem get(int idCartItem);
    
    List<CartItem> getAll();
    
    List<CartItem> search(String txtSearch);
    
    CartItem getByCart(int idCart);
}
