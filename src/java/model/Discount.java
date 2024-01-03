/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Lenovo
 */
public class Discount {
    private int idDiscount;
    private String codeDiscount;
    private float discount;
    private Date startDate, endStart;

    public Discount() {
    }

    public Discount(int idDiscount, String codeDiscount, float discount, Date startDate, Date endStart) {
        this.idDiscount = idDiscount;
        this.codeDiscount = codeDiscount;
        this.discount = discount;
        this.startDate = startDate;
        this.endStart = endStart;
    }

    public int getIdDiscount() {
        return idDiscount;
    }

    public void setIdDiscount(int idDiscount) {
        this.idDiscount = idDiscount;
    }

    public String getCodeDiscount() {
        return codeDiscount;
    }

    public void setCodeDiscount(String codeDiscount) {
        this.codeDiscount = codeDiscount;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndStart() {
        return endStart;
    }

    public void setEndStart(Date endStart) {
        this.endStart = endStart;
    }

    @Override
    public String toString() {
        return "Discount{" + "idDiscount=" + idDiscount + ", codeDiscount=" + codeDiscount + ", discount=" + discount + ", startDate=" + startDate + ", endStart=" + endStart + '}';
    }
    
    
}
