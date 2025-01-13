/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Guest;
import model.Hotel;
import model.ReviewHotel;
import model.Room;
import model.RoomType;
import utils.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.RoomImage;

/**
 *
 * @author Tang Thanh Vui - CE180901
 */
public class ListRoomDAO extends DBContext {

    public List<Room> getAllRoomsInHotel() {
        List<Room> listRooms = new ArrayList<>();

        String sql = "WITH RoomData AS (\n"
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
                + "        Hotel.Address AS Expr2, \n"
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
                + "WHERE RowNum = 1;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
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
                listRooms.add(room);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return listRooms;
    }

    public List<RoomImage> getRoomImages(String roomNo) {
        List<RoomImage> images = new ArrayList<>();
        String sql = "SELECT * FROM RoomImage WHERE RoomNo = ?";  // Only fetch images for the given roomNo

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roomNo);  // Bind the room number
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                RoomImage roomImage = new RoomImage(
                        rs.getInt("RoomImageID"),
                        rs.getString("RoomNo"),
                        rs.getString("ImageURL"),
                        rs.getString("ImageTitle")
                );
                images.add(roomImage);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching room images: " + e.getMessage());
        }

        return images;
    }

    public List<Room> getFilteredRooms(String destination, String checkin, String checkout, String adults, String children) {
        List<Room> rooms = new ArrayList<>();

        // Base SQL query
        StringBuilder sql = new StringBuilder(
                "SELECT    Guest.GuestID, Guest.FullName, Guest.Email, Guest.Password, Guest.PhoneNumber, Guest.Gender, Guest.DOB, Guest.Address, Guest.ImageLink, Guest.Provider, Guest.ProviderUserID, Guest.CreatedAt, \n"
                + "                      Room.RoomNo, Room.RoomTypeID, Room.HotelCode, Room.ImageBackground, Room.Amenities, Room.Available, Hotel.HotelCode AS Expr1, Hotel.HotelName, Hotel.Address AS Expr2, Hotel.AddressURL, \n"
                + "                      Hotel.NumberRooms, Hotel.PhoneNumber AS Expr3, Hotel.ImageBackgroundHotel, RoomImage.RoomImageID, RoomImage.RoomNo AS Expr4, RoomImage.ImageURL, RoomImage.ImageTitle, \n"
                + "                      ReviewHotel.ReviewHotelID, ReviewHotel.HotelCode AS Expr5, ReviewHotel.GuestID AS Expr6, ReviewHotel.StarRating, ReviewHotel.Comment, ReviewHotel.ReviewDate, RoomType.RoomTypeID AS Expr7, \n"
                + "                      RoomType.RoomType, RoomType.RoomPrice, RoomType.DefaultRoomPrice, RoomType.Occupancy, RoomType.RoomDescription\n"
                + "FROM         Guest INNER JOIN\n"
                + "                      ReviewHotel ON Guest.GuestID = ReviewHotel.GuestID INNER JOIN\n"
                + "                      Hotel ON ReviewHotel.HotelCode = Hotel.HotelCode INNER JOIN\n"
                + "                      Room ON Hotel.HotelCode = Room.HotelCode INNER JOIN\n"
                + "                      RoomImage ON Room.RoomNo = RoomImage.RoomNo INNER JOIN\n"
                + "                      RoomType ON Room.RoomTypeID = RoomType.RoomTypeID "
                + "WHERE Room.Available = 1"
        );

        List<Object> parameters = new ArrayList<>();

        // Add destination filter
        if (destination != null && !destination.isEmpty()) {
            sql.append(" AND Hotel.Address LIKE ?");
            parameters.add("%" + destination + "%");
        }

        // Add date filter (for available rooms)
        if (checkin != null && checkout != null) {
            sql.append(" AND Room.RoomNo NOT IN (SELECT B.RoomNo FROM Booking B WHERE ? < B.CheckOutDate AND ? > B.CheckInDate)");
            parameters.add(checkin);
            parameters.add(checkout);
        }

        // Add total guest filter
        int totalGuests = Integer.parseInt(adults) + Integer.parseInt(children);
        sql.append(" AND RoomType.Occupancy >= ?");
        parameters.add(totalGuests);

        try ( PreparedStatement st = connection.prepareStatement(sql.toString())) {
            // Set parameters for the prepared statement
            for (int i = 0; i < parameters.size(); i++) {
                st.setObject(i + 1, parameters.get(i));
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                // Retrieve guest information
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

//    public List<Hotel> getAllHotels() {
//        List<Hotel> listHotels = new ArrayList<>();
//
//        String sql = "SELECT \n"
//                + "    Hotel.HotelCode,\n"
//                + "    Hotel.HotelName,\n"
//                + "    Hotel.[Address],\n"
//                + "    Hotel.AddressURL,\n"
//                + "    Hotel.NumberRooms,\n"
//                + "    Hotel.PhoneNumber,\n"
//                + "    Hotel.ImageBackgroundHotel,\n"
//                + "    AVG(ReviewHotel.StarRating) AS AverageStarRating,\n"
//                + "    COUNT(ReviewHotel.StarRating) AS ReviewCount\n"
//                + "FROM \n"
//                + "    Hotel\n"
//                + "INNER JOIN \n"
//                + "    ReviewHotel ON Hotel.HotelCode = ReviewHotel.HotelCode\n"
//                + "WHERE \n"
//                + "    Hotel.HotelCode BETWEEN 1 AND 10\n"
//                + "GROUP BY \n"
//                + "    Hotel.HotelCode, Hotel.HotelName, Hotel.[Address], Hotel.AddressURL,\n"
//                + "    Hotel.NumberRooms, Hotel.PhoneNumber, Hotel.ImageBackgroundHotel\n"
//                + "ORDER BY \n"
//                + "    Hotel.HotelCode;";
//
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//
//                Hotel hotel = new Hotel(
//                        rs.getInt("HotelCode"),
//                        rs.getString("HotelName"),
//                        rs.getString("Address"),
//                        rs.getString("AddressURL"),
//                        rs.getInt("NumberRooms"),
//                        rs.getString("PhoneNumber"),
//                        rs.getString("ImageBackgroundHotel"),
//                        rs.getFloat("AverageStarRating"),
//                        rs.getInt("ReviewCount")
//                );
//
//                listHotels.add(hotel);
//            }
//
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return listHotels;
//    }
    public Room getRoomByID(String roomNo) {
        String sql = "select * from [dbo].[Room]\n"
                + "where RoomNo = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roomNo);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Room room = new Room(
                        rs.getString("RoomNo"),
                        rs.getInt("RoomTypeID"),
                        rs.getInt("HotelCode"),
                        rs.getString("ImageBackground"),
                        rs.getString("Amenities"),
                        rs.getBoolean("Available")
                );
                return room;
            }
        } catch (SQLException e) {
            System.out.println("Wrong get Room by ID!");
        }
        return null;
    }

    public List<Room> adminGetAllRoom() {
        List<Room> listRooms = new ArrayList<>();
        String sql = "SELECT TOP (1000) [RoomNo]\n"
                + "      ,[RoomTypeID]\n"
                + "      ,[HotelCode]\n"
                + "      ,[ImageBackground]\n"
                + "      ,[Amenities]\n"
                + "      ,[Available]\n"
                + "  FROM [Project_PRJ301_Group5_Booking_Room_Hotel].[dbo].[Room]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room room = new Room(rs.getString("RoomNo"),
                        rs.getInt("RoomTypeID"),
                        rs.getInt("HotelCode"),
                        rs.getString("ImageBackground"),
                        rs.getString("Amenities"),
                        rs.getBoolean("Available"));
                listRooms.add(room);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return listRooms;
    }

//    =====Update ------ 4 _ 11
    public void adminAddNewRoom(Room room, List<RoomImage> roomImages) {
        String sqlRoom = "INSERT INTO [dbo].[Room] "
                + "([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) "
                + "VALUES (?, ?, ?, ?, ?, ?);";

        String sqlRoomImage = "INSERT INTO [dbo].[RoomImage] "
                + "([RoomNo], [ImageURL], [ImageTitle]) "
                + "VALUES (?, ?, ?);";

        try {
            // Bắt đầu giao dịch
            connection.setAutoCommit(false);

            // Thêm dữ liệu vào bảng Room
            PreparedStatement stRoom = connection.prepareStatement(sqlRoom);
            stRoom.setString(1, room.getRoomNo());
            stRoom.setInt(2, room.getRoomTypeID());
            stRoom.setInt(3, room.getHotelCode());
            stRoom.setString(4, room.getImageBackground());
            stRoom.setString(5, room.getAmenities());
            stRoom.setBoolean(6, room.isAvailable());
            stRoom.executeUpdate();

            // Thêm dữ liệu vào bảng RoomImage cho từng ảnh trong danh sách
            PreparedStatement stRoomImage = connection.prepareStatement(sqlRoomImage);
            for (RoomImage roomImage : roomImages) {
                stRoomImage.setString(1, roomImage.getRoomNo());
                stRoomImage.setString(2, roomImage.getImageURL());
                stRoomImage.setString(3, roomImage.getImageTitle());
                stRoomImage.executeUpdate();
            }

            // Xác nhận giao dịch
            connection.commit();
        } catch (SQLException e) {
            System.out.println("Error while adding new room and room images!");
            e.printStackTrace();
            try {
                // Hủy giao dịch nếu có lỗi
                connection.rollback();
            } catch (SQLException rollbackException) {
                rollbackException.printStackTrace();
            }
        } finally {
            try {
                // Thiết lập lại chế độ tự động commit
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public void updateRoom(Room room) {
        String sql = "";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, room.getRoomTypeID());
            st.setInt(2, room.getHotelCode());
            st.setString(3, room.getImageBackground());
            st.setString(4, room.getAmenities());
            st.setBoolean(5, room.isAvailable());
            st.setString(6, room.getRoomNo());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteRoom(String roomNo) {
        String sql = "";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roomNo);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Hotel> selectAllHotels() {
        List<Hotel> hotels = new ArrayList<>();
        String sql = "SELECT [HotelCode]\n"
                + "      ,[HotelName]\n"
                + "      ,[Address]\n"
                + "      ,[AddressURL]\n"
                + "      ,[NumberRooms]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[ImageBackgroundHotel]\n"
                + "  FROM [dbo].[Hotel]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Hotel hotel = new Hotel(
                        rs.getInt("HotelCode"),
                        rs.getString("HotelName"),
                        rs.getString("Address"),
                        rs.getString("AddressURL"),
                        rs.getInt("NumberRooms"),
                        rs.getString("PhoneNumber"),
                        rs.getString("ImageBackgroundHotel"));
                hotels.add(hotel);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return hotels;
    }

    public List<RoomType> selectAllRoomTypes() {
        List<RoomType> roomTypes = new ArrayList<>();
        String sql = "SELECT [RoomTypeID]\n"
                + "      ,[RoomType]\n"
                + "      ,[RoomPrice]\n"
                + "      ,[DefaultRoomPrice]\n"
                + "      ,[Occupancy]\n"
                + "      ,[RoomDescription]\n"
                + "  FROM [dbo].[RoomType]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                RoomType room = new RoomType(
                        rs.getInt("RoomTypeID"),
                        rs.getString("RoomType"),
                        rs.getFloat("RoomPrice"),
                        rs.getFloat("DefaultRoomPrice"),
                        rs.getInt("Occupancy"),
                        rs.getString("RoomDescription"));
                roomTypes.add(room);
            }
        } catch (SQLException e) {
            System.out.println("Error selecting all room types: " + e.getMessage());
        }
        return roomTypes;
    }

    public Hotel getHotelByHotelCode(int hotelCode) {
        String sql = "SELECT [HotelCode]\n"
                + "      ,[HotelName]\n"
                + "      ,[Address]\n"
                + "      ,[AddressURL]\n"
                + "      ,[NumberRooms]\n"
                + "      ,[PhoneNumber]\n"
                + "      ,[ImageBackgroundHotel]\n"
                + "  FROM [dbo].[Hotel]\n"
                + "  WHERE [HotelCode] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, hotelCode);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Hotel hotel = new Hotel(
                        rs.getInt("HotelCode"),
                        rs.getString("HotelName"),
                        rs.getString("Address"),
                        rs.getString("AddressURL"),
                        rs.getInt("NumberRooms"),
                        rs.getString("PhoneNumber"),
                        rs.getString("ImageBackgroundHotel")
                );
                return hotel;
            }
        } catch (SQLException e) {
            System.out.println("Error fetching filtered rooms: " + e.getMessage());
        }

        return null;
    }

    public RoomType selectRoomTypeByID(int id) {
        String sql = "SELECT [RoomTypeID]\n"
                + "      ,[RoomType]\n"
                + "      ,[RoomPrice]\n"
                + "      ,[DefaultRoomPrice]\n"
                + "      ,[Occupancy]\n"
                + "      ,[RoomDescription]\n"
                + "  FROM [dbo].[RoomType] WHERE [RoomTypeID] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                RoomType rt = new RoomType(
                        rs.getInt("RoomTypeID"),
                        rs.getString("RoomType"),
                        rs.getFloat("RoomPrice"),
                        rs.getFloat("DefaultRoomPrice"),
                        rs.getInt("Occupancy"),
                        rs.getString("RoomDescription"));
                return rt;
            }
        } catch (SQLException e) {
            System.out.println("Error selecting room type by ID: " + e.getMessage());
        }
        return null;
    }

    public void deleteRoomByRoomNo(String roomNo) {
        String sql = "DELETE FROM [Room] WHERE [RoomNo] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roomNo);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRoomByRoomNo(String roomNo) {
        String sql = " UPDATE [dbo].[Room]\n"
                + "   SET [RoomNo] = <RoomNo, nvarchar(50),>\n"
                + "      ,[RoomTypeID] = <RoomTypeID, int,>\n"
                + "      ,[HotelCode] = <HotelCode, int,>\n"
                + "      ,[ImageBackground] = <ImageBackground, nvarchar(255),>\n"
                + "      ,[Amenities] = <Amenities, nvarchar(255),>\n"
                + "      ,[Available] = <Available, bit,>\n"
                + " WHERE <Search Conditions,,>\n"
                + "\n"
                + " UPDATE [dbo].[RoomImage]\n"
                + "   SET [RoomNo] = <RoomNo, nvarchar(50),>\n"
                + "      ,[ImageURL] = <ImageURL, nvarchar(255),>\n"
                + "      ,[ImageTitle] = <ImageTitle, nvarchar(255),>\n"
                + " WHERE <Search Conditions,,>";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, roomNo);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRoomAndImages(Room room, List<RoomImage> roomImages) {
        String updateRoomSQL = "UPDATE Room SET RoomTypeID = ?, HotelCode = ?, ImageBackground = ?, Amenities = ?, Available = ? WHERE RoomNo = ?";
        String updateRoomImageSQL = "UPDATE RoomImage SET ImageURL = ?, ImageTitle = ? WHERE RoomNo = ? AND RoomImageID = ?";

        try {
            // Bắt đầu transaction
            connection.setAutoCommit(false);

            // Cập nhật Room
            PreparedStatement stRoom = connection.prepareStatement(updateRoomSQL);
            stRoom.setInt(1, room.getRoomTypeID());
            stRoom.setInt(2, room.getHotelCode());
            stRoom.setString(3, room.getImageBackground());
            stRoom.setString(4, room.getAmenities());
            stRoom.setBoolean(5, room.isAvailable());
            stRoom.setString(6, room.getRoomNo());
            stRoom.executeUpdate();

            // Cập nhật từng RoomImage
            for (RoomImage image : roomImages) {
                PreparedStatement stRoomImage = connection.prepareStatement(updateRoomImageSQL);
                stRoomImage.setString(1, image.getImageURL());
                stRoomImage.setString(2, image.getImageTitle());
                stRoomImage.setString(3, room.getRoomNo());
                stRoomImage.setInt(4, image.getRoomImageID());
                stRoomImage.executeUpdate();
            }

            // Hoàn thành transaction
            connection.commit();
        } catch (SQLException e) {
            // Rollback nếu có lỗi
            try {
                connection.rollback();
            } catch (SQLException ex) {
                System.out.println("Rollback failed: " + ex);
            }
            System.out.println("Update failed: " + e);
        } finally {
            try {
                // Đặt lại chế độ tự động commit
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                System.out.println("Failed to reset auto-commit: " + e);
            }
        }
    }

    public static void main(String[] args) {
        ListRoomDAO ld = new ListRoomDAO();
        List<Room> list = ld.adminGetAllRoom();
        for (Room room : list) {
            System.out.println(room.getRoomNo());
        }
//        System.out.println(ld.getRoomByID("CS101"));
//        List<Room> list = d.getAllRoomsInHotel();
//        for (Room room : list) {
//            List<RoomImage> listimage = room.getAllImagesByRoomNo();
//            System.out.println(room.getRoomNo());
//            for (RoomImage roomImage : listimage) {
//                System.out.println(roomImage.getImageURL());
//            }
//        }
        // find image from room
//        for (Room room : list) {
//            System.out.println("Room No: " + room.getRoomNo());
//            List<RoomImage> images = d.getRoomImages(room.getRoomNo());  // Pass the room number dynamically
//            for (RoomImage image : images) {
//                System.out.println("Image URL: " + image.getImageURL());
//            }
//        }
        // find image from room
//        List<Room> listFilters = d.getFilteredRooms("TP Can Tho", "2024-09-15", "2024-11-10", "1", "1");
//        for (Room listFilter : listFilters) {
//            System.out.println(listFilter.getRoomNo());
//        }
//        System.out.println(d.getHotelByHotelCode(1));
//        List<Hotel> hotels = d.getAllHotels();
//        for (Hotel hotel : hotels) {
//            System.out.println(hotel.getAverageStarRating());
//            System.out.println(hotel.getReviewCount());
//        }
//        System.out.println(d.getRoomByID("CS101").getImageBackground());
    }
}
