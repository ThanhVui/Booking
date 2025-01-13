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
public class Guest {

    private int GuestID;
    private String FullName;
    private String Email;
    private String Password;
    private String PhoneNumber;
    private String Gender;
    private Date DOB;
    private String Address;
    private String ImageLink;
    private String Provider;
    private String ProviderUserID;
    private Date CreatedAt;

    public Guest() {
    }

    public Guest(int GuestID, String FullName, String Email, String Password, String PhoneNumber, String Gender, Date DOB, String Address, String ImageLink, String Provider, String ProviderUserID, Date CreatedAt) {
        this.GuestID = GuestID;
        this.FullName = FullName;
        this.Email = Email;
        this.Password = Password;
        this.PhoneNumber = PhoneNumber;
        this.Gender = Gender;
        this.DOB = DOB;
        this.Address = Address;
        this.ImageLink = ImageLink;
        this.Provider = Provider;
        this.ProviderUserID = ProviderUserID;
        this.CreatedAt = CreatedAt;
    }

    public int getGuestID() {
        return GuestID;
    }

    public void setGuestID(int GuestID) {
        this.GuestID = GuestID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getImageLink() {
        return ImageLink;
    }

    public void setImageLink(String ImageLink) {
        this.ImageLink = ImageLink;
    }

    public String getProvider() {
        return Provider;
    }

    public void setProvider(String Provider) {
        this.Provider = Provider;
    }

    public String getProviderUserID() {
        return ProviderUserID;
    }

    public void setProviderUserID(String ProviderUserID) {
        this.ProviderUserID = ProviderUserID;
    }

    public Date getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(Date CreatedAt) {
        this.CreatedAt = CreatedAt;
    }

    @Override
    public String toString() {
        return "Guest{" + "GuestID=" + GuestID + ", FullName=" + FullName + ", Email=" + Email + ", Password=" + Password + ", PhoneNumber=" + PhoneNumber + ", Gender=" + Gender + ", DOB=" + DOB + ", Address=" + Address + ", ImageLink=" + ImageLink + ", Provider=" + Provider + ", ProviderUserID=" + ProviderUserID + ", CreatedAt=" + CreatedAt + '}';
    }

}
