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
import model.Room;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class RoomDAO extends DBContext {

    private static final String SELECT_ROOM_BY_NO = "SELECT * FROM Room WHERE RoomNo = ?";
    private static final String SELECT_ALL_ROOMS = "SELECT * FROM Room";
    
    private static final String INSERT_ROOM_SQL = "INSERT INTO Room (RoomNo, RoomTypeID, HotelCode, ImageBackground, Amenities, Available) "
                                                    + "VALUES (?, ?, ?, ?, ?, ?)";
    
    private static final String UPDATE_ROOM_SQL = "UPDATE Room SET RoomTypeID = ?, HotelCode = ?, ImageBackground = ?, Amenities = ?, Available = ? WHERE RoomNo = ?";
    
    private static final String DELETE_ROOM_SQL = "DELETE FROM Room WHERE RoomNo = ?";

    public Room selectRoomByNo(String roomNo) {
        Room room = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ROOM_BY_NO);
            st.setString(1, roomNo);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                room = mapResultSetToRoom(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return room;
    }

    public List<Room> selectAllRooms() {
        List<Room> rooms = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_ROOMS);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                rooms.add(mapResultSetToRoom(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return rooms;
    }

    public void insertRoom(Room room) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_ROOM_SQL);
            st.setString(1, room.getRoomNo());
            st.setInt(2, room.getRoomTypeID());
            st.setInt(3, room.getHotelCode());
            st.setString(4, room.getImageBackground());
            st.setString(5, room.getAmenities());
            st.setBoolean(6, room.isAvailable());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRoom(Room room) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_ROOM_SQL);
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
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_ROOM_SQL);
            st.setString(1, roomNo);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private Room mapResultSetToRoom(ResultSet rs) throws SQLException {
        Room room = new Room();
        room.setRoomNo(rs.getString("RoomNo"));
        room.setRoomTypeID(rs.getInt("RoomTypeID"));
        room.setHotelCode(rs.getInt("HotelCode"));
        room.setImageBackground(rs.getString("ImageBackground"));
        room.setAmenities(rs.getString("Amenities"));
        room.setAvailable(rs.getBoolean("Available"));
        return room;
    }
    
    public static void main(String[] args) {
        RoomDAO roomDAO = new RoomDAO();
        Room room = roomDAO.selectRoomByNo("A101");
        System.out.println(room);
    }
}
