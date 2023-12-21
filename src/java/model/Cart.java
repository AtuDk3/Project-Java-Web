package model;

import java.util.Date;

/**
 *
 * @author Lenovo
 */
public class Cart {
    private int idCart;
    private Account buyer;
    private Date buyDate;

    public Cart(int idCart, Account buyer, Date buyDate) {
        this.idCart = idCart;
        this.buyer = buyer;
        this.buyDate = buyDate;
    }

    public Cart() {
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public Account getBuyer() {
        return buyer;
    }

    public void setBuyer(Account buyer) {
        this.buyer = buyer;
    }

    public Date getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(Date buyDate) {
        this.buyDate = buyDate;
    }

    @Override
    public String toString() {
        return "Cart{" + "idCart=" + idCart + ", buyer=" + buyer + ", buyDate=" + buyDate + '}';
    }
    
    
}
