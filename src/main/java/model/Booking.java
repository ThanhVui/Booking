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
public class Booking {
    private int bookingID;
    private int guestID;
    private String roomNo;
    private int discountID;
    private Date checkInDate;
    private Date checkOutDate;
    private int numberAdults;
    private int numberChildrens;
    private boolean bookingStatus;

    public Booking() {
    }

    public Booking(int bookingID, int guestID, String roomNo, int discountID, Date checkInDate, Date checkOutDate, int numberAdults, int numberChildrens, boolean bookingStatus) {
        this.bookingID = bookingID;
        this.guestID = guestID;
        this.roomNo = roomNo;
        this.discountID = discountID;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numberAdults = numberAdults;
        this.numberChildrens = numberChildrens;
        this.bookingStatus = bookingStatus;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getGuestID() {
        return guestID;
    }

    public void setGuestID(int guestID) {
        this.guestID = guestID;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public int getNumberAdults() {
        return numberAdults;
    }

    public void setNumberAdults(int numberAdults) {
        this.numberAdults = numberAdults;
    }

    public int getNumberChildrens() {
        return numberChildrens;
    }

    public void setNumberChildrens(int numberChildrens) {
        this.numberChildrens = numberChildrens;
    }

    public boolean isBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(boolean bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    @Override
    public String toString() {
        return "Booking{" + "bookingID=" + bookingID + ", guestID=" + guestID + ", roomNo=" + roomNo + ", discountID=" + discountID + ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate + ", numberAdults=" + numberAdults + ", numberChildrens=" + numberChildrens + ", bookingStatus=" + bookingStatus + '}';
    }
    
    
    
}
