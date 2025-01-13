/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Tang Thanh Vui - CE180901
 */
public class Filters {

    private List<String> starRating;
    private List<String> facilities;
    private List<String> roomType;
    private List<String> occupancy;
    private String destination;
    private Date checkinDate;
    private Date checkoutDate;
    private int numberAdults;
    private int numberChildren;

    public Filters() {
    }

    public Filters(List<String> starRating, List<String> facilities, List<String> roomType, List<String> occupancy, String destination, Date checkinDate, Date checkoutDate, int numberAdults, int numberChildren) {
        this.starRating = starRating;
        this.facilities = facilities;
        this.roomType = roomType;
        this.occupancy = occupancy;
        this.destination = destination;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.numberAdults = numberAdults;
        this.numberChildren = numberChildren;
    }

    public List<String> getStarRating() {
        return starRating;
    }

    public void setStarRating(List<String> starRating) {
        this.starRating = starRating;
    }

    public List<String> getFacilities() {
        return facilities;
    }

    public void setFacilities(List<String> facilities) {
        this.facilities = facilities;
    }

    public List<String> getRoomType() {
        return roomType;
    }

    public void setRoomType(List<String> roomType) {
        this.roomType = roomType;
    }

    public List<String> getOccupancy() {
        return occupancy;
    }

    public void setOccupancy(List<String> occupancy) {
        this.occupancy = occupancy;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public int getNumberAdults() {
        return numberAdults;
    }

    public void setNumberAdults(int numberAdults) {
        this.numberAdults = numberAdults;
    }

    public int getNumberChildren() {
        return numberChildren;
    }

    public void setNumberChildren(int numberChildren) {
        this.numberChildren = numberChildren;
    }

    
}
