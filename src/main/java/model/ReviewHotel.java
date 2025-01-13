/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.GuestDAO;
import java.sql.Date;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class ReviewHotel {

    private int reviewHotelID;
    private int hotelCode;
    private int guestID;
    private Guest guest;
    private int starRating;
    private String comment;
    private Date reviewDate;

    public ReviewHotel() {
    }

    public ReviewHotel(int reviewHotelID) {
        this.reviewHotelID = reviewHotelID;
    }

    public ReviewHotel(int reviewHotelID, int hotelCode, Guest guest, int starRating, String comment, Date reviewDate) {
        this.reviewHotelID = reviewHotelID;
        this.hotelCode = hotelCode;
        this.guest = guest;
        this.starRating = starRating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }

    public ReviewHotel(int reviewHotelID, int hotelCode, int guestID, int starRating, String comment, Date reviewDate) {
        this.reviewHotelID = reviewHotelID;
        this.hotelCode = hotelCode;
        this.guestID = guestID;
        this.starRating = starRating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }
    
    public Guest getObjGuest() {
        GuestDAO guestDAO = new GuestDAO();
        Guest guestObj = guestDAO.selectGuestByID(guestID);
        return guestObj;
    }

    public int getReviewHotelID() {
        return reviewHotelID;
    }

    public void setReviewHotelID(int reviewHotelID) {
        this.reviewHotelID = reviewHotelID;
    }

    public int getHotelCode() {
        return hotelCode;
    }

    public void setHotelCode(int hotelCode) {
        this.hotelCode = hotelCode;
    }

    public int getGuestID() {
        return guestID;
    }

    public void setGuestID(int guestID) {
        this.guestID = guestID;
    }

    public int getStarRating() {
        return starRating;
    }

    public void setStarRating(int starRating) {
        this.starRating = starRating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    @Override
    public String toString() {
        return "ReviewHotel{" + "reviewHotelID=" + reviewHotelID + ", hotelCode=" + hotelCode + ", guestID=" + guestID + ", starRating=" + starRating + ", comment=" + comment + ", reviewDate=" + reviewDate + '}';
    }

    public Guest getGuest() {
        return guest;
    }

    public void setGuest(Guest guest) {
        this.guest = guest;
    }

}
