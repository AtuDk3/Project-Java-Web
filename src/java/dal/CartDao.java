/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal;

import java.util.List;
import model.Cart;

/**
 *
 * @author Lenovo
 */
public interface CartDao {
    void insert(Cart cart);
    
    void edit(Cart cart);
    
    void delete(int idCart);
    
    Cart get(int idCart);
    
    Cart get(String name);
    
    List<Cart> getAll();
    
    List<Cart> search(String txtSearch);
}
