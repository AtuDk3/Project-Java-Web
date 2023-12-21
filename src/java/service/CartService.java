/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.util.List;
import model.Cart;

/**
 *
 * @author Lenovo
 */
public interface CartService {
    void insert(Cart cart);
    
    void edit(Cart cart);
    
    void delete(int idCart);
    
    Cart get(int idCart);
    
    List<Cart> getAll();
    
    List<Cart> search(String txtSearch);
}
