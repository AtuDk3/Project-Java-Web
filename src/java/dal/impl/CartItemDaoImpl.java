/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.impl;

import dal.CartItemDao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.CartItem;
import model.Product;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author Lenovo
 */
public class CartItemDaoImpl extends DBContext implements CartItemDao{
    
    UserService userService = new UserServiceImpl();

    @Override
    public void insert(CartItem cartItem) {
        String sql = "insert into tab_cart_item(quantity, unit_price, id_product, id_cart) values(?, ?, ?, ?) ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setInt(1, cartItem.getQuantity());
            ps.setDouble(2, cartItem.getUnitPrice());
            ps.setInt(3, cartItem.getProduct().getIdProduct());
            ps.setInt(4, cartItem.getCart().getIdCart());
            
            ResultSet rs = ps.executeQuery();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void edit(CartItem cartItem) {
        String sql = "update tab_cart_item set quantity = ?, unit_price = ?, id_product = ?, id_cart = ? where id_cart_item = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setInt(1, cartItem.getQuantity());
            ps.setDouble(2, cartItem.getUnitPrice());
            ps.setInt(3, cartItem.getProduct().getIdProduct());
            ps.setInt(4, cartItem.getCart().getIdCart());
            ps.setInt(5, cartItem.getIdCartItem());
            
            ResultSet rs = ps.executeQuery();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(int cartItem) {
        String sql = "delete from tab_cart_item where id_cart_item = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cartItem);
            ResultSet rs = ps.executeQuery();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public CartItem get(int idCartItem) {
        String sql = "select citem.id_cart_item, citem.quantity, citem.unit_price, c.user_id, c.buy_date, p.title_product, p.price_product"
                + " from tab_cart_item as citem inner join tab_cart as c on c.id_cart = citem.id_cart_item "
                + " inner join tab_product as p on citem.id_product = p.id_product where citem.id_cart_item = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idCartItem);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                Account user = userService.get(rs.getInt("a.id"));               
                
                Cart cart = new Cart();
                cart.setBuyer(user);
                cart.setBuyDate(rs.getDate("c.buy_date"));
                
                Product product = new Product();
                product.setTitleProduct(rs.getString("p.title_product"));
                product.setPriceProduct(rs.getDouble("p.price_product"));
                
                CartItem cartItem = new CartItem();               
                cartItem.setIdCartItem(rs.getInt("citem.id_cart_item"));
                cartItem.setQuantity(rs.getInt("citem.quantity"));
                cartItem.setUnitPrice(rs.getInt("citem.unit_price"));
                cartItem.setProduct(product);
                cartItem.setCart(cart);
                
                return cartItem;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // viết sau
    @Override
    public CartItem get(String name) {
        return null;
    }

    @Override
    public List<CartItem> getAll() {
        List<CartItem> listCartItem = new ArrayList<>();
        
        String sql = "select citem.id_cart_item, citem.quantity, citem.unit_price, c.user_id, c.buy_date, p.title_product, p.price_product"
                + " from tab_cart_item as citem inner join tab_cart as c on c.id_cart = citem.id_cart_item "
                + " inner join tab_product as p on citem.id_product = p.id_product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                Account user = userService.get(rs.getInt("a.id"));               
                
                Cart cart = new Cart();
                cart.setBuyer(user);
                cart.setBuyDate(rs.getDate("c.buy_date"));
                
                Product product = new Product();
                product.setTitleProduct(rs.getString("p.title_product"));
                product.setPriceProduct(rs.getDouble("p.price_product"));
                
                CartItem cartItem = new CartItem();               
                cartItem.setIdCartItem(rs.getInt("citem.id_cart_item"));
                cartItem.setQuantity(rs.getInt("citem.quantity"));
                cartItem.setUnitPrice(rs.getInt("citem.unit_price"));
                cartItem.setProduct(product);
                cartItem.setCart(cart);
                
                return listCartItem;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // viết sau
    @Override
    public List<CartItem> search(String txtSearch) {
        return null;
    }

    
    
}
