/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Objects;

/**
 *
 * @author Lenovo
 */
public class CartItem {
    private int idCartItem;
    private int quantity;
    private double unitPrice;
    private Product product;
    private Cart cart;

    public CartItem(int idCartItem, int quantity, double unitPrice, Product product, Cart cart) {
        this.idCartItem = idCartItem;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.product = product;
        this.cart = cart;
    }

    public CartItem() {
    }

    public int getIdCartItem() {
        return idCartItem;
    }

    public void setIdCartItem(int idCartItem) {
        this.idCartItem = idCartItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    @Override
    public String toString() {
        return "CartItem{" + "idCartItem=" + idCartItem + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", product=" + product + ", cart=" + cart + '}';
    }

    
    
    
    
    
}
