/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.impl;

import dal.CartDao;
import java.sql.Date;
import java.util.List;
import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Timestamp;
import model.Account;
import service.UserService;
import service.impl.UserServiceImpl;

/**
 *
 * @author Lenovo
 */
public class CartDaoImpl extends DBContext implements CartDao {

    UserService userService = new UserServiceImpl();

    @Override
    public void insert(Cart cart) {
        String sql = "insert into tab_cart(id_cart, user_id, buy_date, status_order) values(?, ?, ?, ?) ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cart.getIdCart());
            ps.setInt(2, cart.getBuyer().getId());
            ps.setTimestamp(3, new Timestamp(cart.getBuyDate().getTime()));
            ps.setInt(4, cart.getStatusOrder());
            ResultSet rs = ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void edit(Cart cart) {
        String sql = "update tab_cart set user_id = ?, buy_date = ? where id_cart = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart.getBuyer().getId());
            ps.setDate(2, new Date(cart.getBuyDate().getTime()));
            ps.setString(3, cart.getIdCart());
            ResultSet rs = ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(String idCart) {
        String sql = "delete from tab_cart_item where id_cart = ?; delete from tab_cart where id_cart = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, idCart);
            ps.setString(2, idCart);
            ResultSet rs = ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public Cart get(String idCart) {
        String sql = "select c.id_cart, c.buy_date, c.status_order, a.id, a.user_name, a.email from tab_cart as c "
                + "inner join tab_account as a on c.user_id = a.id where c.id_cart = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, idCart);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Account user = userService.get(rs.getInt("id"));
                Cart cart = new Cart();

                cart.setIdCart(rs.getString("id_cart"));
                cart.setBuyer(user);
                cart.setBuyDate(rs.getTimestamp("buy_date"));
                cart.setStatusOrder(rs.getInt("status_order"));

                return cart;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    
    // Purchase History
    @Override
    public List<Cart> getByUser(int id) {
        List<Cart> listCart = new ArrayList<>();
        
        String sql = "select c.id_cart, c.buy_date, c.status_order, a.id, a.user_name, a.email from tab_cart as c "
                + "inner join tab_account as a on c.user_id = a.id where c.user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Account user = userService.get(rs.getInt("id"));
                Cart cart = new Cart();

                cart.setIdCart(rs.getString("id_cart"));
                cart.setBuyer(user);
                cart.setBuyDate(rs.getTimestamp("buy_date"));
                cart.setStatusOrder(rs.getInt("status_order"));

                listCart.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return listCart;
    }

    @Override
    public List<Cart> getAll() {
        List<Cart> listCart = new ArrayList<>();

        String sql = "select c.id_cart, c.buy_date, c.status_order, a.id, a.user_name, a.email from tab_cart as c "
                + "inner join tab_account as a on c.user_id = a.id";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account user = userService.get(rs.getInt("id"));
                Cart cart = new Cart();

                cart.setIdCart(rs.getString("id_cart"));
                cart.setBuyer(user);
                cart.setBuyDate(rs.getTimestamp("buy_date"));
                cart.setStatusOrder(rs.getInt("status_order"));

                listCart.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return listCart;
    }

    // check lại
    @Override
    public List<Cart> search(String name) {
        List<Cart> listCart = new ArrayList<>();

        String sql = "select c.id_cart, c.buy_date, a.id, a.user_name, a.email from tab_cart as c "
                + "inner join tab_account as a on c.user_id = a.id where a.email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Account user = userService.get(rs.getInt("a.id"));
                Cart cart = new Cart();

                cart.setIdCart(rs.getString("c.id_cart"));
                cart.setBuyer(user);
                cart.setBuyDate(rs.getTimestamp("c.buy_date"));

                listCart.add(cart);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return listCart;
    }
    
    @Override
    public void processedOrder(Cart cart) {
        String sql = "update tab_cart set status_order = 1 where id_cart = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cart.getIdCart());
            ResultSet rs = ps.executeQuery();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
