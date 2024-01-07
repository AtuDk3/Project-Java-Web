package model;

import java.sql.Timestamp;



/**
 *
 * @author Lenovo
 */
public class Cart {
    private String idCart;
    private Account buyer;
    private Timestamp buyDate;
    private int statusOrder;

    public Cart(String idCart, Account buyer, Timestamp  buyDate, int statusOrder) {
        this.idCart = idCart;
        this.buyer = buyer;
        this.buyDate = buyDate;
        this.statusOrder = statusOrder;
    }

    public Cart(Account buyer, Timestamp  buyDate, int statusOrder) {
        this.buyer = buyer;
        this.buyDate = buyDate;
        this.statusOrder = statusOrder;
    }
    

    public Cart() {
    }

    public String getIdCart() {
        return idCart;
    }

    public void setIdCart(String idCart) {
        this.idCart = idCart;
    }

    public Account getBuyer() {
        return buyer;
    }

    public void setBuyer(Account buyer) {
        this.buyer = buyer;
    }

    public Timestamp  getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(Timestamp  buyDate) {
        this.buyDate = buyDate;
    }

    public int getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(int statusOrder) {
        this.statusOrder = statusOrder;
    }

    @Override
    public String toString() {
        return "Cart{" + "idCart=" + idCart + ", buyer=" + buyer + ", buyDate=" + buyDate + ", statusOrder=" + statusOrder + '}';
    }

    
    
    
}
