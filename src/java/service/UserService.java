/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import java.util.List;
import model.Account;

/**
 *
 * @author Lenovo
 */
public interface UserService {
    
    Account login(String userName, String password);
    
    Account get(String userName);
    
    Account get(int id);
    
    void insert (Account account); 
    
    void update(Account account);
    
    void updateAdmmin(Account account);
    
    void delete(int id);
    
    boolean register(String userName, String email, String password, String phone);
    
    List<Account> getAll();
    
    boolean checkExitsEmail(String email);
    
    boolean checkExitsUserName(String userName);
    
    boolean checkExitsPhone(String phone);
    
    void changePassword(Account account);
}
