/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class Hotel {

    private int hotelCode;
    private String hotelName;
    private ReviewHotel reviewHotel;
    private String address;
    private String addressURL;
    private int numberRooms;
    private String phoneNumber;
    private String imageBackgroundHotel;

    public Hotel() {
    }

    public Hotel(int hotelCode, String hotelName, ReviewHotel reviewHotel, String address, String addressURL, int numberRooms, String phoneNumber, String imageBackgroundHotel) {
        this.hotelCode = hotelCode;
        this.hotelName = hotelName;
        this.reviewHotel = reviewHotel;
        this.address = address;
        this.addressURL = addressURL;
        this.numberRooms = numberRooms;
        this.phoneNumber = phoneNumber;
        this.imageBackgroundHotel = imageBackgroundHotel;
    }

    public Hotel(int hotelCode, String hotelName, String address, String addressURL, int numberRooms, String phoneNumber, String imageBackgroundHotel) {
        this.hotelCode = hotelCode;
        this.hotelName = hotelName;
        this.address = address;
        this.addressURL = addressURL;
        this.numberRooms = numberRooms;
        this.phoneNumber = phoneNumber;
        this.imageBackgroundHotel = imageBackgroundHotel;
    }

    public int getHotelCode() {
        return hotelCode;
    }

    public void setHotelCode(int hotelCode) {
        this.hotelCode = hotelCode;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddressURL() {
        return addressURL;
    }

    public void setAddressURL(String addressURL) {
        this.addressURL = addressURL;
    }

    public int getNumberRooms() {
        return numberRooms;
    }

    public void setNumberRooms(int numberRooms) {
        this.numberRooms = numberRooms;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getImageBackgroundHotel() {
        return imageBackgroundHotel;
    }

    public void setImageBackgroundHotel(String imageBackgroundHotel) {
        this.imageBackgroundHotel = imageBackgroundHotel;
    }

    @Override
    public String toString() {
        return "Hotel{" + "hotelCode=" + hotelCode + ", hotelName=" + hotelName + ", address=" + address + ", addressURL=" + addressURL + ", numberRooms=" + numberRooms + ", phoneNumber=" + phoneNumber + ", imageBackgroundHotel=" + imageBackgroundHotel + '}';
    }

    public ReviewHotel getReviewHotel() {
        return reviewHotel;
    }

    public void setReviewHotel(ReviewHotel reviewHotel) {
        this.reviewHotel = reviewHotel;
    }

}
