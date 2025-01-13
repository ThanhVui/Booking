/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class RoomType{
    private int roomTypeID;
    private String roomType;
    private double roomPrice;
    private double defaultRoomPrice;
    private int occupancy;
    private String roomDescription;

    public RoomType() {
    }

    public RoomType(int roomTypeID, String roomType, double roomPrice, double defaultRoomPrice, int occupancy, String roomDescription) {
        this.roomTypeID = roomTypeID;
        this.roomType = roomType;
        this.roomPrice = roomPrice;
        this.defaultRoomPrice = defaultRoomPrice;
        this.occupancy = occupancy;
        this.roomDescription = roomDescription;
    }
    
    public int getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(int roomTypeID) {
        this.roomTypeID = roomTypeID;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public double getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(double roomPrice) {
        this.roomPrice = roomPrice;
    }

    public double getDefaultRoomPrice() {
        return defaultRoomPrice;
    }

    public void setDefaultRoomPrice(double defaultRoomPrice) {
        this.defaultRoomPrice = defaultRoomPrice;
    }

    public int getOccupancy() {
        return occupancy;
    }

    public void setOccupancy(int occupancy) {
        this.occupancy = occupancy;
    }

    public String getRoomDescription() {
        return roomDescription;
    }

    public void setRoomDescription(String roomDescription) {
        this.roomDescription = roomDescription;
    }

    @Override
    public String toString() {
        return "RoomType{" + "roomTypeID=" + roomTypeID + ", roomType=" + roomType + ", roomPrice=" + roomPrice + ", defaultRoomPrice=" + defaultRoomPrice + ", occupancy=" + occupancy + ", roomDescription=" + roomDescription + '}';
    }
    
    
}
