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
public class Admin {
    private int adminID;
    private String fullName;
    private String phoneNo;
    private String email;
    private String password;
    private Date createdAt;

    public Admin() {
    }

    public Admin(int adminID, String fullName, String phoneNo, String email, String password, Date createdAt) {
        this.adminID = adminID;
        this.fullName = fullName;
        this.phoneNo = phoneNo;
        this.email = email;
        this.password = password;
        this.createdAt = createdAt;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Admin{" + "adminID=" + adminID + ", fullName=" + fullName + ", phoneNo=" + phoneNo + ", email=" + email + ", password=" + password + ", createdAt=" + createdAt + '}';
    }
    
    
    
}
