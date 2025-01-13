/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ListRoomDAO;
import java.util.List;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class Room {

    private String roomNo;
    private int roomTypeID;
    private RoomType roomType;
    private int hotelCode;
    private Hotel hotel;
    private String imageBackground;
    private String amenities;
    private boolean available;

    public Room() {
    }

    public Room(String roomNo, RoomType roomType, Hotel hotel, String imageBackground, String amenities, boolean available) {
        this.roomNo = roomNo;
        this.roomType = roomType;
        this.hotel = hotel;
        this.imageBackground = imageBackground;
        this.amenities = amenities;
        this.available = available;
    }

    public Room(String roomNo, int roomTypeID, int hotelCode, String imageBackground, String amenities, boolean available) {
        this.roomNo = roomNo;
        this.roomTypeID = roomTypeID;
        this.hotelCode = hotelCode;
        this.imageBackground = imageBackground;
        this.amenities = amenities;
        this.available = available;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public int getHotelCode() {
        return hotelCode;
    }

    public void setHotelCode(int hotelCode) {
        this.hotelCode = hotelCode;
    }

    public String getImageBackground() {
        return imageBackground;
    }

    public void setImageBackground(String imageBackground) {
        this.imageBackground = imageBackground;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    @Override
    public String toString() {
        return "Room{" + "roomNo=" + roomNo + ", roomTypeID=" + roomTypeID + ", hotelCode=" + hotelCode + ", imageBackground=" + imageBackground + ", amenities=" + amenities + ", available=" + available + '}';
    }

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public List<RoomImage> getAllImagesByRoomNo() {
        ListRoomDAO ld = new ListRoomDAO();
        List<RoomImage> listImages = ld.getRoomImages(this.roomNo);
        return listImages;
    }

}
