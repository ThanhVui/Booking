/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class Discount {
    private int discountID;
    private String discountName;
    private double discountValue;
    private Date discountStartDate;
    private Date discountEndDate;

    public Discount() {
    }

    public Discount(int discountID, String discountName, double discountValue, Date discountStartDate, Date discountEndDate) {
        this.discountID = discountID;
        this.discountName = discountName;
        this.discountValue = discountValue;
        this.discountStartDate = discountStartDate;
        this.discountEndDate = discountEndDate;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public String getDiscountName() {
        return discountName;
    }

    public void setDiscountName(String discountName) {
        this.discountName = discountName;
    }

    public double getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(double discountValue) {
        this.discountValue = discountValue;
    }

    public Date getDiscountStartDate() {
        return discountStartDate;
    }

    public void setDiscountStartDate(Date discountStartDate) {
        this.discountStartDate = discountStartDate;
    }

    public Date getDiscountEndDate() {
        return discountEndDate;
    }

    public void setDiscountEndDate(Date discountEndDate) {
        this.discountEndDate = discountEndDate;
    }

    @Override
    public String toString() {
        return "Discount{" + "discountID=" + discountID + ", discountName=" + discountName + ", discountValue=" + discountValue + ", discountStartDate=" + discountStartDate + ", discountEndDate=" + discountEndDate + '}';
    }
    
    
}
