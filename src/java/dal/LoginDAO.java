/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class LoginDAO extends DBContext {
    public Account login(String userEmail, String password){
        String sql = "select * from tab_account where email = ? and password = ?";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userEmail);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                
                account.setUserName(rs.getString("user_name"));
                account.setPassword(rs.getString("password"));
                account.setIsUser(rs.getInt("is_user"));
                account.setIsAdmin(rs.getInt("is_admin"));
                account.setEmail(rs.getString("email"));
                
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        LoginDAO ldao = new LoginDAO();
        Account a = ldao.login("thanhtudzx@gmail.com", "123");
        System.out.println(a.toString());
    }
}
