/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Guest;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class GuestDAO extends DBContext {

    private static final String SELECT_ALL_GUEST = "SELECT * FROM [Project_PRJ301_Group5_Booking_Room_Hotel].[dbo].[Guest]";
    private static final String SELECT_GUEST_BY_ID = "SELECT * FROM Guest WHERE GuestID = ?";
    private static final String SELECT_GUEST_BY_EMAIL = "SELECT * FROM Guest WHERE Email = ?";
    
    private static final String INSERT_GUEST_SQL = "INSERT INTO Guest (FullName, Email, Password, PhoneNumber, Gender, DOB, Address, ImageLink, Provider, ProviderUserID, CreatedAt)"
                                                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE())";
    
    private static final String UPDATE_GUEST_EMAIL = "UPDATE Guest SET Email = ? WHERE ProviderUserID = ? AND Provider = ?";
    private static final String UPDATE_GUEST_PROVIDER_ID = "UPDATE Guest SET Provider = ?, ProviderUserID = ? WHERE Email = ?";
    private static final String UPDATE_GUEST_PASSWORD_PROVIDER = "UPDATE Guest SET Password = ?, Provider = ? WHERE Email = ?";
    private static final String UPDATE_GUEST_PASSWORD = "UPDATE Guest SET Password = ? WHERE Email = ?";
    
    private static final String VALIDATE_GUEST_SQL = "SELECT * FROM Guest WHERE Email = ? AND Password = ?";

    public List<Guest> selectAllGuest() {
        List<Guest> guests = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_GUEST);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                guests.add(mapResultSetToGuest(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return guests;
    }
    
    public Guest selectGuestByID(int id) {
        Guest guest = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_GUEST_BY_ID);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                guest = mapResultSetToGuest(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return guest;
    }

    public boolean validateGuest(String email, String password) {
        try {
            PreparedStatement st = connection.prepareStatement(VALIDATE_GUEST_SQL);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void insertGuest(Guest guest) {
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
        try {
            //(FullName, Email, Password, PhoneNumber, Gender, DOB, Address, ImageLink, Provider, ProviderUserID, CreatedAt 
            //VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, GETDATE())
            PreparedStatement st = connection.prepareStatement(INSERT_GUEST_SQL);
            st.setString(1, guest.getFullName());
            st.setString(2, guest.getEmail());
            st.setString(3, guest.getPassword());
            st.setString(4, guest.getPhoneNumber());
            st.setString(5, guest.getGender()); // Changed to String
            st.setDate(6, guest.getDOB());
            st.setString(7, guest.getAddress());
            st.setString(8, guest.getImageLink());
            st.setString(9, guest.getProvider());
            st.setString(10, guest.getProviderUserID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Guest selectGuestByEmail(String email) {
        Guest guest = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_GUEST_BY_EMAIL);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                guest = mapResultSetToGuest(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return guest;
    }

    public Guest selectGuestByProviderUserId(String providerUserId, String provider) {
        Guest guest = null;
        String SELECT_GUEST_BY_PROVIDER_ID = "SELECT * FROM Guest WHERE ProviderUserID = ? AND Provider = ?";
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_GUEST_BY_PROVIDER_ID);
            st.setString(1, providerUserId);
            st.setString(2, provider);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                guest = mapResultSetToGuest(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return guest;
    }

    public void updateGuestEmail(Guest guest) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_GUEST_EMAIL);
            st.setString(1, guest.getEmail());
            st.setString(2, guest.getProviderUserID());
            st.setString(3, guest.getProvider());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateGuestProviderID(Guest guest) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_GUEST_PROVIDER_ID);
            st.setString(1, guest.getProvider());
            st.setString(2, guest.getProviderUserID());
            st.setString(3, guest.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateGuestPasswordProvider(Guest guest) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_GUEST_PASSWORD_PROVIDER);
            st.setString(1, guest.getPassword());
            st.setString(2, guest.getProvider());
            st.setString(3, guest.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating guest password and provider: " + e.getMessage());
        }
    }
    
    public void updateGuestPassword(String email, String password) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_GUEST_PASSWORD);
            st.setString(1, password);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating guest password and provider: " + e.getMessage());
        }
    }
    
    public boolean updateUserProfile(String fullName, Date dob, String gender, String phone, String password, String address, String loginIdentifier) {
        String query = "UPDATE Guest SET FullName = ?, DOB = ?, Gender = ?, PhoneNumber = ?, Password = ?, Address = ? WHERE ";
        query += loginIdentifier.contains("@") ? "Email = ?" : "PhoneNumber = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, fullName);
            stmt.setDate(2, dob);
            stmt.setString(3, gender);
            stmt.setString(4, phone);
            stmt.setString(5, password);
            stmt.setString(6, address);
            stmt.setString(7, loginIdentifier);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Guest mapResultSetToGuest(ResultSet rs) throws SQLException {
        Guest guest = new Guest();
        guest.setGuestID(rs.getInt("GuestID")); // Changed to int
        guest.setFullName(rs.getString("FullName"));
        guest.setEmail(rs.getString("Email"));
        guest.setPassword(rs.getString("Password"));
        guest.setPhoneNumber(rs.getString("PhoneNumber"));
        guest.setGender(rs.getString("Gender")); // Changed to String
        guest.setDOB(rs.getDate("DOB"));
        guest.setAddress(rs.getString("Address"));
        guest.setImageLink(rs.getString("ImageLink"));
        guest.setProvider(rs.getString("Provider"));
        guest.setProviderUserID(rs.getString("ProviderUserID"));
        guest.setCreatedAt(rs.getDate("CreatedAt"));
        return guest;
    }
    
    public static void main(String[] args) {
        String[] labels = new String[12];
        long totalGuestOfMonth;
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
        
        GuestDAO gd = new GuestDAO();
        List<Guest> g = gd.selectAllGuest();
        
        for (int i = 0; i < 10; i++) {
            
        }
        
        
//        System.out.println(currentDate);
//        System.out.println(g.getCreatedAt());
//        System.out.println(g.getCreatedAt().toLocalDate().getMonth());
//        System.out.println(g.getCreatedAt().toLocalDate().getMonthValue());
//        System.out.println(g.getCreatedAt().toLocalDate().getYear());
//        System.out.println(g.getCreatedAt().toLocalDate().getDayOfWeek());
//        System.out.println(g.getCreatedAt().toLocalDate().getDayOfYear());
//        System.out.println(g.getCreatedAt().toLocalDate().getDayOfMonth());
        
//        String[] labels = new String[12];
//        label = label.substring(0, 1).toUpperCase() + label.substring(1).toLowerCase();
//        
//        for (String l : labels) {
//            System.out.println(l);
//        }
    }
}
