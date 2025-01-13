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
import model.RoomType;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class RoomTypeDAO extends DBContext {
    
    private static final String SELECT_ROOM_TYPE_BY_ID = "SELECT * FROM RoomType WHERE RoomTypeID = ?";
    private static final String SELECT_ALL_ROOM_TYPES = "SELECT * FROM RoomType";
    private static final String INSERT_ROOM_TYPE_SQL = "INSERT INTO RoomType (RoomType, RoomPrice, DefaultRoomPrice, Occupancy, RoomDescription) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_ROOM_TYPE_SQL = "UPDATE RoomType SET RoomType = ?, RoomPrice = ?, DefaultRoomPrice = ?, Occupancy = ?, RoomDescription = ? WHERE RoomTypeID = ?";
    private static final String DELETE_ROOM_TYPE_SQL = "DELETE FROM RoomType WHERE RoomTypeID = ?";

    public RoomType selectRoomTypeByID(int id) {
        RoomType roomType = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ROOM_TYPE_BY_ID);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                roomType = mapResultSetToRoomType(rs);
            }
        } catch (SQLException e) {
            System.out.println("Error selecting room type by ID: " + e.getMessage());
        }
        return roomType;
    }

    public List<RoomType> selectAllRoomTypes() {
        List<RoomType> roomTypes = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_ROOM_TYPES);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                RoomType roomType = mapResultSetToRoomType(rs);
                roomTypes.add(roomType);
            }
        } catch (SQLException e) {
            System.out.println("Error selecting all room types: " + e.getMessage());
        }
        return roomTypes;
    }

    public void insertRoomType(RoomType roomType) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_ROOM_TYPE_SQL);
            st.setString(1, roomType.getRoomType());
            st.setDouble(2, roomType.getRoomPrice());
            st.setDouble(3, roomType.getDefaultRoomPrice());
            st.setInt(4, roomType.getOccupancy());
            st.setString(5, roomType.getRoomDescription());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting room type: " + e.getMessage());
        }
    }

    public void updateRoomType(RoomType roomType) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_ROOM_TYPE_SQL);
            st.setString(1, roomType.getRoomType());
            st.setDouble(2, roomType.getRoomPrice());
            st.setDouble(3, roomType.getDefaultRoomPrice());
            st.setInt(4, roomType.getOccupancy());
            st.setString(5, roomType.getRoomDescription());
            st.setInt(6, roomType.getRoomTypeID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error updating room type: " + e.getMessage());
        }
    }

    public void deleteRoomType(int id) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_ROOM_TYPE_SQL);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting room type: " + e.getMessage());
        }
    }

    private RoomType mapResultSetToRoomType(ResultSet rs) throws SQLException {
        RoomType roomType = new RoomType();
        roomType.setRoomTypeID(rs.getInt("RoomTypeID"));
        roomType.setRoomType(rs.getString("RoomType"));
        roomType.setRoomPrice(rs.getDouble("RoomPrice"));
        roomType.setDefaultRoomPrice(rs.getDouble("DefaultRoomPrice"));
        roomType.setOccupancy(rs.getInt("Occupancy"));
        roomType.setRoomDescription(rs.getString("RoomDescription"));
        return roomType;
    }
}
