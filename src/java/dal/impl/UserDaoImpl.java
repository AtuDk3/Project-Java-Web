/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.impl;

import dal.UserDAO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.Account;

/**
 *
 * @author Lenovo
 */
public class UserDaoImpl extends DBContext implements UserDAO {

    @Override
    public void insert(Account account) {
        String sql = "insert into tab_account(user_name, email, password, full_name, avatar, phone, create_date, role_id, address) "
                + " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, account.getUserName());
            ps.setString(2, account.getEmail());
            ps.setString(3, account.getPassword());
            ps.setString(4, account.getFullName());
            ps.setString(5, account.getAvatar());
            ps.setString(6, account.getPhone());
            ps.setDate(7, (Date) account.getCreateDate());
            ps.setInt(8, account.getRoleID());
            ps.setString(9, account.getAddress());
            
            ps.executeUpdate();
        }
    catch (SQLException e) {
            System.out.println(e);
    }

    }

    @Override
    public Account get(String userName) {
        String sql = "select * from tab_account where user_name = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();

                account.setUserName(rs.getString("user_name"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("full_name"));
                account.setAvatar(rs.getString("avatar"));
                account.setPhone(rs.getString("phone"));
                account.setCreateDate(rs.getDate("create_date"));
                account.setRoleID(rs.getInt("role_id"));
                account.setAddress(rs.getString("address"));
                
                return account;
            }           
        }
    catch (SQLException e) {
            System.out.println(e);
    }
        return null;
    }

    @Override
    public Account get(int id) {
        String sql = "select * from tab_account where id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();

                account.setUserName(rs.getString("user_name"));
                account.setEmail(rs.getString("email"));
                account.setPassword(rs.getString("password"));
                account.setFullName(rs.getString("full_name"));
                account.setAvatar(rs.getString("avatar"));
                account.setPhone(rs.getString("phone"));
                account.setCreateDate(rs.getDate("create_date"));
                account.setRoleID(rs.getInt("role_id"));
                account.setAddress(rs.getString("address"));
                
                return account;
            }           
        }
    catch (SQLException e) {
            System.out.println(e);
    }
        return null;
    }

    @Override
    public void update(Account account) {
        String sql = "update tab_account set full_name = ?, avatar = ?, address = ? where user_name = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setString(1, account.getFullName());
            ps.setString(2, account.getAvatar());
            ps.setString(3, account.getAddress());
            ps.setString(4, account.getUserName());

            ResultSet rs = ps.executeQuery();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Account> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean checkExitsEmail(String email) {
        String sql = "select * from tab_account where email = ?";
        boolean duplicate = false;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {               
                duplicate = true;
            }           
        }
    catch (SQLException e) {
            System.out.println(e);
    }
        return duplicate;
    }

    @Override
    public boolean checkExitsUserName(String userName) {
        String sql = "select * from tab_account where user_name = ?";
        boolean duplicate = false;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {               
                duplicate = true;
            }           
        }
    catch (SQLException e) {
            System.out.println(e);
    }
        return duplicate;
    }

    @Override
    public boolean checkExitsPhone(String phone) {
        String sql = "select * from tab_account where phone = ?";
        boolean duplicate = false;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {               
                duplicate = true;
            }           
        }
    catch (SQLException e) {
            System.out.println(e);
    }
        return duplicate;
    }

    @Override
    public void changePassword(Account account) {
        String sql = "update tab_account set password = ? where user_name = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            
            ps.setString(1, account.getPassword());
            ps.setString(2, account.getUserName());
            
            ResultSet rs = ps.executeQuery();
         
        }
    catch (SQLException e) {
            System.out.println(e);
    }
    }
    
}
