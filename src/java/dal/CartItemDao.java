/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal;

import java.util.List;
import model.CartItem;

/**
 *
 * @author Lenovo
 */
public interface CartItemDao {
    void insert(CartItem cartItem);
    
    void edit(CartItem cartItem);
    
    void delete(int cartItem);
    
    CartItem get(int idCartItem);
    
    CartItem get(String name);
    
    List<CartItem> getAll();
    
    List<CartItem> search(String txtSearch);
}
