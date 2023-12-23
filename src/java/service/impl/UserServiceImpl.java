/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service.impl;

import dal.UserDAO;
import dal.impl.UserDaoImpl;
import java.util.List;
import model.Account;
import service.UserService;

/**
 *
 * @author Lenovo
 */
public class UserServiceImpl implements UserService{
    UserDAO userDAO = new UserDaoImpl();
    
    @Override
    public void insert(Account account) {
        userDAO.insert(account);
    }

    @Override
    public Account login(String userName, String password) {
        Account account = this.get(userName);
        
        if (account != null && password.equals(account.getPassword())){
            return account;
        }
        return null;
    }

    @Override
    public Account get(String userName) {
        return userDAO.get(userName);
    }

    @Override
    public Account get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Account account) {
        Account oldAccount = userDAO.get(account.getUserName());
        
        oldAccount.setFullName(account.getFullName());
        oldAccount.setAvatar(account.getAvatar());
        oldAccount.setAddress(account.getAddress());
        
        userDAO.update(oldAccount);
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean register(String userName, String email, String password, String phone) {
        if(userDAO.checkExitsEmail(userName) || userDAO.checkExitsEmail(email) || userDAO.checkExitsPhone(phone)){
            return false;
        }
        
        // Hàm lưu ngày giờ tạo account trong sql
        long millis = System.currentTimeMillis();
        java.sql.Date createDate = new java.sql.Date(millis);
        userDAO.insert(new Account(userName, email, password, null, "avatar_default.jpg", phone, createDate, 2));
        return true;
    }

    @Override
    public List<Account> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean checkExitsEmail(String email) {
        return userDAO.checkExitsEmail(email);
    }

    @Override
    public boolean checkExitsUserName(String userName) {
        return userDAO.checkExitsUserName(userName);
    }

    @Override
    public boolean checkExitsPhone(String phone) {
        return userDAO.checkExitsPhone(phone);
    }

    @Override
    public void changePassword(Account account) {
        Account oldAccount = userDAO.get(account.getUserName());
        oldAccount.setPassword(account.getPassword());
        userDAO.changePassword(oldAccount);
    }
}
