/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dal;

import java.util.List;
import model.Account;

/**
 *
 * @author Lenovo
 */
public interface UserDAO {
    
    Account get(String userName);
    
    Account get(int id);
    
    void insert (Account account); 
    
    void update(Account account);
    
    void updateAdmmin(Account account);
    
    void delete(int id);
    
    List<Account> getAll();
    
    boolean checkExitsEmail(String email);
    
    boolean checkExitsUserName(String userName);
    
    boolean checkExitsPhone(String phone);
    
    void changePassword(Account account);
    
    Account getEmail(String email);
    
    Account getPhone(String phone);
}
