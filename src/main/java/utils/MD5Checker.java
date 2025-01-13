/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class MD5Checker {
    // Hàm chuyển byte array thành chuỗi hex
    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02X", b));
        }
        return sb.toString();
    }
    
    // Hàm tạo MD5 từ một chuỗi
    public static String createMD5(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] messageDigest = md.digest(input.getBytes());
        return bytesToHex(messageDigest);
    }
    
    private boolean checkMD5(String targetMD5, String passwordToTry) {
        try {
            String generatedMD5 = createMD5(passwordToTry);
            
            if (generatedMD5.equalsIgnoreCase(targetMD5)) {
                return true;
            }
        } catch (NoSuchAlgorithmException e) {
        }
        return false;
    }
            
            
    public static void main(String[] args) {
        String targetMD5 = "12D18F4659750DF0401DA710B73CDB67";
        String passwordToTry = "smith456"; // Thử với mật khẩu này
        
        try {
            String generatedMD5 = createMD5(passwordToTry);
            System.out.println("Testing password: " + passwordToTry);
            System.out.println("Generated MD5: " + generatedMD5);
            System.out.println("Target MD5:    " + targetMD5);
            
            if (generatedMD5.equalsIgnoreCase(targetMD5)) {
                System.out.println("MATCH FOUND! Password is: " + passwordToTry);
            } else {
                System.out.println("No match.");
            }
            
        } catch (NoSuchAlgorithmException e) {
        }
    }
}
