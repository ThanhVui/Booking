/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Hotel;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class HotelDAO extends DBContext {

    private static final String SELECT_HOTEL_BY_CODE = "SELECT * FROM Hotel WHERE HotelCode = ?";
    private static final String SELECT_ALL_HOTELS = "SELECT * FROM Hotel";
    
    private static final String INSERT_HOTEL_SQL = "INSERT INTO Hotel (HotelName, Address, AddressURL, NumberRooms, PhoneNumber, ImageBackgroundHotel) VALUES (?, ?, ?, ?, ?, ?)";
    
    private static final String UPDATE_HOTEL_SQL = "UPDATE Hotel SET HotelName = ?, Address = ?, AddressURL = ?, NumberRooms = ?, PhoneNumber = ?, ImageBackgroundHotel = ? WHERE HotelCode = ?";
    
    private static final String DELETE_HOTEL_SQL = "DELETE FROM Hotel WHERE HotelCode = ?";

    public Hotel selectHotelByCode(int hotelCode) {
        Hotel hotel = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_HOTEL_BY_CODE);
            st.setInt(1, hotelCode);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                hotel = mapResultSetToHotel(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hotel;
    }

    public List<Hotel> selectAllHotels() {
        List<Hotel> hotels = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_HOTELS);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                hotels.add(mapResultSetToHotel(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hotels;
    }

    public void insertHotel(Hotel hotel) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_HOTEL_SQL);
            st.setString(1, hotel.getHotelName());
            st.setString(2, hotel.getAddress());
            st.setString(3, hotel.getAddressURL());
            st.setInt(4, hotel.getNumberRooms());
            st.setString(5, hotel.getPhoneNumber());
            st.setString(6, hotel.getImageBackgroundHotel());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateHotel(Hotel hotel) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_HOTEL_SQL);
            st.setString(1, hotel.getHotelName());
            st.setString(2, hotel.getAddress());
            st.setString(3, hotel.getAddressURL());
            st.setInt(4, hotel.getNumberRooms());
            st.setString(5, hotel.getPhoneNumber());
            st.setString(6, hotel.getImageBackgroundHotel());
            st.setInt(7, hotel.getHotelCode());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteHotel(int hotelCode) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_HOTEL_SQL);
            st.setInt(1, hotelCode);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private Hotel mapResultSetToHotel(ResultSet rs) throws SQLException {
        Hotel hotel = new Hotel();
        hotel.setHotelCode(rs.getInt("HotelCode"));
        hotel.setHotelName(rs.getString("HotelName"));
        hotel.setAddress(rs.getString("Address"));
        hotel.setAddressURL(rs.getString("AddressURL"));
        hotel.setNumberRooms(rs.getInt("NumberRooms"));
        hotel.setPhoneNumber(rs.getString("PhoneNumber"));
        hotel.setImageBackgroundHotel(rs.getString("ImageBackgroundHotel"));
        return hotel;
    }
}
