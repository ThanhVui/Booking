package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Booking;
import model.Guest;
import model.RoomPriceDetails;
import utils.DBContext;

public class PaymentDAO extends DBContext {

    // Cập nhật trạng thái thanh toán
    public boolean updatePaymentStatus(int guestID, boolean status) throws SQLException {
        String sql = "UPDATE Bill SET PaymentStatus = ? WHERE GuestID = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setBoolean(1, status);
            stmt.setInt(2, guestID);
            return stmt.executeUpdate() > 0;
        }
    }

    // Lấy thông tin khách dựa trên email/phone và mật khẩu
    public Guest getGuestByEmailOrPhone(String identifier, String password) throws SQLException {
        String sql = "SELECT [GuestID], [FullName], [Email], [PhoneNumber], [Provider] FROM Guest WHERE ([Email] = ? OR [PhoneNumber] = ?) AND [Password] = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, identifier);
            stmt.setString(2, identifier);
            stmt.setString(3, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Guest guest = new Guest();
                guest.setGuestID(rs.getInt("GuestID"));
                guest.setFullName(rs.getString("FullName"));
                guest.setEmail(rs.getString("Email"));
                guest.setPhoneNumber(rs.getString("PhoneNumber"));
                guest.setProvider(rs.getString("Provider"));
                return guest;
            }
        }
        return null;
    }

    // Cập nhật trạng thái đặt phòng
    public boolean updateBookingStatus(int guestID, boolean status) throws SQLException {
        String sql = "UPDATE Booking SET BookingStatus = ? WHERE GuestID = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setBoolean(1, status);
            stmt.setInt(2, guestID);
            return stmt.executeUpdate() > 0;
        }
    }

    // Lấy thông tin đặt phòng dựa trên GuestID
    public Booking getBookingByGuestID(int guestID) throws SQLException {
        String sql = "SELECT BookingID, GuestID, RoomNo, CheckInDate, CheckOutDate FROM Booking WHERE GuestID = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, guestID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingID(rs.getInt("BookingID"));
                booking.setGuestID(rs.getInt("GuestID"));
                booking.setRoomNo(rs.getString("RoomNo"));
                booking.setCheckInDate(rs.getDate("CheckInDate"));
                booking.setCheckOutDate(rs.getDate("CheckOutDate"));
                return booking;
            }
        }
        return null;
    }

    // Phương thức để lấy thông tin phòng và ngày Check-in, Check-out
    public Booking getBookingDetails(int guestID) {
        Booking bookingDetails = null;
        String query = "SELECT RoomNo, CheckInDate, CheckOutDate FROM Booking WHERE GuestID = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, guestID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                bookingDetails = new Booking();
                bookingDetails.setRoomNo(rs.getString("RoomNo"));
                bookingDetails.setCheckInDate(rs.getDate("CheckInDate"));
                bookingDetails.setCheckOutDate(rs.getDate("CheckOutDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingDetails;
    }

// Cập nhật trạng thái sẵn sàng của phòng
    public boolean updateRoomAvailability(String roomNo, boolean available) throws SQLException {
        String sql = "UPDATE Room SET Available = ? WHERE RoomNo = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {  // Sử dụng kết nối từ DBContext
            stmt.setBoolean(1, available);
            stmt.setString(2, roomNo);
            return stmt.executeUpdate() > 0;
        }
    }

// Lấy thông tin khách dựa trên email/phone và mật khẩu
    public Guest getGuestByIdentifierAndPassword(String identifier, String password) throws SQLException {
        String sql = "SELECT [GuestID], [FullName], [Email], [PhoneNumber], [Provider] FROM Guest WHERE ([Email] = ? OR [PhoneNumber] = ?) AND [Password] = ?";
        try ( PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, identifier);
            stmt.setString(2, identifier);
            stmt.setString(3, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Guest guest = new Guest();
                guest.setGuestID(rs.getInt("GuestID"));
                guest.setFullName(rs.getString("FullName"));
                guest.setEmail(rs.getString("Email"));
                guest.setPhoneNumber(rs.getString("PhoneNumber"));
                guest.setProvider(rs.getString("Provider"));
                return guest;
            }
        }
        return null;
    }

    // Lấy thông tin giá phòng và giảm giá nếu có
    public RoomPriceDetails getRoomPriceDetails(String roomNo, Date checkInDate) {
        RoomPriceDetails priceDetails = new RoomPriceDetails();
        String query = "SELECT rt.RoomPrice, d.DiscountName, d.DiscountValue, d.DiscountStartDate, d.DiscountEndDate "
                + "FROM Booking b "
                + "JOIN Room r ON b.RoomNo = r.RoomNo "
                + "JOIN RoomType rt ON r.RoomTypeID = rt.RoomTypeID "
                + "LEFT JOIN Discount d ON b.DiscountID = d.DiscountID "
                + "WHERE b.RoomNo = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, roomNo);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    priceDetails.setRoomPrice(resultSet.getFloat("RoomPrice"));
                    Date discountStartDate = resultSet.getDate("DiscountStartDate");
                    Date discountEndDate = resultSet.getDate("DiscountEndDate");
                    String discountName = resultSet.getString("DiscountName");
                    float discountValue = resultSet.getFloat("DiscountValue");

                    // Kiểm tra nếu có Discount áp dụng
                    if (discountStartDate != null && discountEndDate != null
                            && !checkInDate.before(discountStartDate) && !checkInDate.after(discountEndDate)) {
                        priceDetails.setDiscounted(true);
                        priceDetails.setDiscountName(discountName);
                        priceDetails.setDiscountValue(discountValue);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return priceDetails;
    }

}
