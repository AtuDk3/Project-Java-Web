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

    public Cart(String idCart, Account buyer, Timestamp  buyDate) {
        this.idCart = idCart;
        this.buyer = buyer;
        this.buyDate = buyDate;
    }

    public Cart(Account buyer, Timestamp  buyDate) {
        this.buyer = buyer;
        this.buyDate = buyDate;
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

    @Override
    public String toString() {
        return "Cart{" + "idCart=" + idCart + ", buyer=" + buyer + ", buyDate=" + buyDate + '}';
    }
    
    
}
