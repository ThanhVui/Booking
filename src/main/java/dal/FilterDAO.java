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
import java.util.Arrays;
import java.util.List;
import model.Filters;
import model.Guest;
import model.Hotel;
import model.ReviewHotel;
import model.Room;
import model.RoomType;
import utils.DBContext;

/**
 *
 * @author Tang Thanh Vui - CE180901
 */
public class FilterDAO extends DBContext {

    public List<Room> getFiltersRooms(Filters filters) {
        List<Room> rooms = new ArrayList<>();

        StringBuilder sql = new StringBuilder("WITH RoomData AS (\n"
                + "    SELECT \n"
                + "        Guest.GuestID, \n"
                + "        Guest.FullName, \n"
                + "        Guest.Email, \n"
                + "        Guest.Password, \n"
                + "        Guest.PhoneNumber, \n"
                + "        Guest.Gender, \n"
                + "        Guest.DOB, \n"
                + "        Guest.Address, \n"
                + "        Guest.ImageLink, \n"
                + "        Guest.Provider, \n"
                + "        Guest.ProviderUserID, \n"
                + "        Guest.CreatedAt, \n"
                + "        Room.RoomNo, \n"
                + "        Room.RoomTypeID, \n"
                + "        Room.HotelCode, \n"
                + "        Room.ImageBackground, \n"
                + "        Room.Amenities, \n"
                + "        Room.Available, \n"
                + "        Hotel.HotelCode AS Expr1, \n"
                + "        Hotel.HotelName, \n"
                + "        Hotel.Address AS Expr2, \n" // Make sure this column is included in the CTE
                + "        Hotel.AddressURL, \n"
                + "        Hotel.NumberRooms, \n"
                + "        Hotel.PhoneNumber AS Expr3, \n"
                + "        Hotel.ImageBackgroundHotel, \n"
                + "        ri.RoomImageID, \n"
                + "        ri.ImageURL, \n"
                + "        ri.ImageTitle, \n"
                + "        rh.ReviewHotelID, \n"
                + "        rh.StarRating, \n"
                + "        rh.Comment, \n"
                + "        rh.ReviewDate, \n"
                + "        RoomType.RoomTypeID AS Expr7, \n"
                + "        RoomType.RoomType, \n"
                + "        RoomType.RoomPrice, \n"
                + "        RoomType.DefaultRoomPrice, \n"
                + "        RoomType.Occupancy, \n"
                + "        RoomType.RoomDescription,\n"
                + "        ROW_NUMBER() OVER (PARTITION BY Room.RoomNo ORDER BY rh.ReviewDate DESC) AS RowNum\n"
                + "    FROM \n"
                + "        Guest \n"
                + "    INNER JOIN\n"
                + "        ReviewHotel ON Guest.GuestID = ReviewHotel.GuestID \n"
                + "    INNER JOIN\n"
                + "        Hotel ON ReviewHotel.HotelCode = Hotel.HotelCode \n"
                + "    INNER JOIN\n"
                + "        Room ON Hotel.HotelCode = Room.HotelCode \n"
                + "    INNER JOIN\n"
                + "        RoomType ON Room.RoomTypeID = RoomType.RoomTypeID\n"
                + "    OUTER APPLY (SELECT TOP 1 * FROM RoomImage WHERE RoomImage.RoomNo = Room.RoomNo) AS ri\n"
                + "    OUTER APPLY (SELECT TOP 1 * FROM ReviewHotel WHERE ReviewHotel.HotelCode = Room.HotelCode) AS rh\n"
                + ")\n"
                + "SELECT *\n"
                + "FROM RoomData\n"
                + "WHERE RowNum = 1 AND Available = 1"); // Use all columns from RoomData only

        // Collect parameters
        List<Object> parameters = new ArrayList<>();

        // Destination filter
        if (filters.getDestination() != null && !filters.getDestination().isEmpty()) {
            sql.append(" AND RoomData.Expr2 LIKE ?");
            parameters.add("%" + filters.getDestination() + "%");
        }

        // Check-in/check-out date filter (assuming you want to exclude rooms booked in the given range)
        if (filters.getCheckinDate() != null && filters.getCheckoutDate() != null) {
            sql.append(" AND RoomNo NOT IN (SELECT B.RoomNo FROM Booking B WHERE ? < B.CheckOutDate AND ? > B.CheckInDate)");
            parameters.add(filters.getCheckinDate());
            parameters.add(filters.getCheckoutDate());
        }

        // Total guests filter (adults + children)
        int totalGuests = filters.getNumberAdults() + filters.getNumberChildren();
        sql.append(" AND Occupancy >= ?");
        parameters.add(totalGuests);

        // Star rating filter
        if (!filters.getStarRating().isEmpty()) {
            sql.append(" AND StarRating IN (");
            for (int i = 0; i < filters.getStarRating().size(); i++) {
                sql.append("?");
                if (i < filters.getStarRating().size() - 1) {
                    sql.append(",");
                }
                parameters.add(Integer.parseInt(filters.getStarRating().get(i))); // Parse star ratings to integers
            }
            sql.append(")");
        }

        // Facilities filter
        if (!filters.getFacilities().isEmpty()) {
            for (String facility : filters.getFacilities()) {
                sql.append(" AND Amenities LIKE ?");
                parameters.add("%" + facility + "%");
            }
        }

        // Room type filter
        if (!filters.getRoomType().isEmpty()) {
            sql.append(" AND RoomType IN (");
            for (int i = 0; i < filters.getRoomType().size(); i++) {
                sql.append("?");
                if (i < filters.getRoomType().size() - 1) {
                    sql.append(",");
                }
                parameters.add(filters.getRoomType().get(i));
            }
            sql.append(")");
        }

        // Add occupancy filter
        if (!filters.getOccupancy().isEmpty()) {
            sql.append(" AND Occupancy IN (");
            for (int i = 0; i < filters.getOccupancy().size(); i++) {
                sql.append("?");
                if (i < filters.getOccupancy().size() - 1) {
                    sql.append(",");
                }
                parameters.add(Integer.parseInt(filters.getOccupancy().get(i)));
            }
            sql.append(")");
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql.toString());

            // Set dynamic parameters in the prepared statement
            for (int i = 0; i < parameters.size(); i++) {
                st.setObject(i + 1, parameters.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Guest guest = new Guest(
                        rs.getInt("GuestID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Password"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Gender"),
                        rs.getDate("DOB"),
                        rs.getString("Address"),
                        rs.getString("ImageLink"),
                        rs.getString("Provider"),
                        rs.getString("ProviderUserID"),
                        rs.getDate("CreatedAt")
                );

                ReviewHotel reviewHotelID = new ReviewHotel(
                        rs.getInt("ReviewHotelID"),
                        rs.getInt("HotelCode"),
                        guest,
                        rs.getInt("StarRating"),
                        rs.getString("Comment"),
                        rs.getDate("ReviewDate")
                );

                RoomType roomtype = new RoomType(
                        rs.getInt("RoomTypeID"),
                        rs.getString("RoomType"),
                        rs.getFloat("RoomPrice"),
                        rs.getFloat("DefaultRoomPrice"),
                        rs.getInt("Occupancy"),
                        rs.getString("RoomDescription")
                );

                Hotel hotel = new Hotel(
                        rs.getInt("HotelCode"),
                        rs.getString("HotelName"),
                        reviewHotelID,
                        rs.getString(21),
                        rs.getString("AddressURL"),
                        rs.getInt("NumberRooms"),
                        rs.getString("PhoneNumber"),
                        rs.getString("ImageBackgroundHotel")
                );

                Room room = new Room(
                        rs.getString("RoomNo"),
                        roomtype,
                        hotel,
                        rs.getString("ImageBackground"),
                        rs.getString("Amenities"),
                        rs.getBoolean("Available")
                );
                rooms.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching filtered rooms: " + e.getMessage());
        }

        return rooms;
    }

    public static void main(String[] args) {
        FilterDAO ld = new FilterDAO();
        // Tạo đối tượng Filters với các danh sách và ngày tháng hợp lệ
        List<String> starRating = Arrays.asList("5");
        List<String> facilities = Arrays.asList("Room Service");
        List<String> roomType = Arrays.asList("Family");
        List<String> occupancy = Arrays.asList("5");

        Date checkinDate = Date.valueOf("2024-09-15");
        Date checkoutDate = Date.valueOf("2024-11-10");

        Filters filters = new Filters(starRating, facilities, roomType, occupancy, "TP Can Tho", checkinDate, checkoutDate, 1, 1);

        // Sử dụng đối tượng filters để gọi phương thức getFiltersRooms
        List<Room> filterRooms = ld.getFiltersRooms(filters);
        for (Room filterRoom : filterRooms) {
            System.out.println(filterRoom.getRoomNo());
        }
    }
}
