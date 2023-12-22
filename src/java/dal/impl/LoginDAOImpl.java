/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.impl;

import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class LoginDAOImpl extends DBContext{
    public Account login(String userName, String password){
        String sql = "select * from tab_account where user_name = ? and password = ?";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, password);
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
                
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
}
