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
import model.Booking;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class BookingDAO extends DBContext {

    private static final String SELECT_BOOKING_BY_ID = "SELECT * FROM Booking WHERE BookingID = ?";
    private static final String SELECT_ALL_BOOKINGS = "SELECT * FROM Booking";
    
    private static final String INSERT_BOOKING_SQL = "INSERT INTO Booking (GuestID, RoomNo, DiscountID, CheckInDate, CheckOutDate, NumberAdults, NumberChildrens, BookingStatus) "
                                                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    private static final String UPDATE_BOOKING_SQL = "UPDATE Booking SET GuestID = ?, RoomNo = ?, DiscountID = ?, CheckInDate = ?, CheckOutDate = ?, NumberAdults = ?, NumberChildrens = ?, BookingStatus = ? WHERE BookingID = ?";
    
    private static final String DELETE_BOOKING_SQL = "DELETE FROM Booking WHERE BookingID = ?";

    public Booking selectBookingById(int bookingId) {
        Booking booking = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_BOOKING_BY_ID);
            st.setInt(1, bookingId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                booking = mapResultSetToBooking(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return booking;
    }

    public List<Booking> selectAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_BOOKINGS);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                bookings.add(mapResultSetToBooking(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return bookings;
    }

    public void insertBooking(Booking booking) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_BOOKING_SQL);
            st.setInt(1, booking.getGuestID());
            st.setString(2, booking.getRoomNo());
            st.setInt(3, booking.getDiscountID());
            st.setDate(4, booking.getCheckInDate());
            st.setDate(5, booking.getCheckOutDate());
            st.setInt(6, booking.getNumberAdults());
            st.setInt(7, booking.getNumberChildrens());
            st.setBoolean(8, booking.isBookingStatus());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateBooking(Booking booking) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_BOOKING_SQL);
            st.setInt(1, booking.getGuestID());
            st.setString(2, booking.getRoomNo());
            st.setInt(3, booking.getDiscountID());
            st.setDate(4, booking.getCheckInDate());
            st.setDate(5, booking.getCheckOutDate());
            st.setInt(6, booking.getNumberAdults());
            st.setInt(7, booking.getNumberChildrens());
            st.setBoolean(8, booking.isBookingStatus());
            st.setInt(9, booking.getBookingID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteBooking(int bookingId) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_BOOKING_SQL);
            st.setInt(1, bookingId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private Booking mapResultSetToBooking(ResultSet rs) throws SQLException {
        Booking booking = new Booking();
        booking.setBookingID(rs.getInt("BookingID"));
        booking.setGuestID(rs.getInt("GuestID"));
        booking.setRoomNo(rs.getString("RoomNo"));
        booking.setDiscountID(rs.getInt("DiscountID"));
        booking.setCheckInDate(rs.getDate("CheckInDate"));
        booking.setCheckOutDate(rs.getDate("CheckOutDate"));
        booking.setNumberAdults(rs.getInt("NumberAdults"));
        booking.setNumberChildrens(rs.getInt("NumberChildrens"));
        booking.setBookingStatus(rs.getBoolean("BookingStatus"));
        return booking;
    }
}
