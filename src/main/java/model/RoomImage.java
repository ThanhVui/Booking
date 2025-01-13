/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class RoomImage {
    private int roomImageID;
    private String roomNo;
    private String imageURL;
    private String imageTitle;

    public RoomImage() {
    }

    public RoomImage(int roomImageID, String roomNo, String imageURL, String imageTitle) {
        this.roomImageID = roomImageID;
        this.roomNo = roomNo;
        this.imageURL = imageURL;
        this.imageTitle = imageTitle;
    }

    public int getRoomImageID() {
        return roomImageID;
    }

    public void setRoomImageID(int roomImageID) {
        this.roomImageID = roomImageID;
    }

    public String getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(String roomNo) {
        this.roomNo = roomNo;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getImageTitle() {
        return imageTitle;
    }

    public void setImageTitle(String imageTitle) {
        this.imageTitle = imageTitle;
    }

    @Override
    public String toString() {
        return "RoomImage{" + "roomImageID=" + roomImageID + ", roomNo=" + roomNo + ", imageURL=" + imageURL + ", imageTitle=" + imageTitle + '}';
    }
    
    
}
