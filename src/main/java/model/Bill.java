/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.HotelDAO;
import dal.RoomDAO;
import java.sql.Date;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class Bill {
    private int invoiceNo;
    private int guestID;
    private int bookingID;
    private double totalAmount;
    private Date paymentDate;
    private boolean paymentStatus;

    public Bill() {
    }

    public Bill(int invoiceNo, int guestID, int bookingID, double totalAmount, Date paymentDate, boolean paymentStatus) {
        this.invoiceNo = invoiceNo;
        this.guestID = guestID;
        this.bookingID = bookingID;
        this.totalAmount = totalAmount;
        this.paymentDate = paymentDate;
        this.paymentStatus = paymentStatus;
    }
    
    public Guest getGuest() {
        GuestDAO guestDAO = new GuestDAO();
        Guest guest = guestDAO.selectGuestByID(guestID);
        return guest;
    }
    
    public Booking getBooking() {
        BookingDAO bookingDAO = new BookingDAO();
        Booking booking = bookingDAO.selectBookingById(bookingID);
        return booking;
    }
    
    public Hotel getHotel(int hotelCode) {
        HotelDAO hd = new HotelDAO();
        Hotel h = hd.selectHotelByCode(hotelCode);
        return h;
    }
    
    public Room getRoom(String roomNo) {
        RoomDAO rd = new RoomDAO();
        Room r = rd.selectRoomByNo(roomNo);
        return r;
    }
    
//    public Hotel getHotel() {
//        HotelDAO hotelDAO = new HotelDAO();
//        Hotel hotel = hotelDAO.selectHotelByCode();
//        return hotel;
//    }

    public int getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(int invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    public int getGuestID() {
        return guestID;
    }

    public void setGuestID(int guestID) {
        this.guestID = guestID;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public boolean isPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    @Override
    public String toString() {
        return "Bill{" + "invoiceNo=" + invoiceNo + ", guestID=" + guestID + ", bookingID=" + bookingID + ", totalAmount=" + totalAmount + ", paymentDate=" + paymentDate + ", paymentStatus=" + paymentStatus + '}';
    }
    
    
}
