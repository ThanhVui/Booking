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
import model.RoomImage;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class RoomImageDAO extends DBContext {

    private static final String SELECT_ROOM_IMAGE_BY_ID = "SELECT * FROM RoomImage WHERE RoomImageID = ?";
    private static final String SELECT_ROOM_IMAGES_BY_ROOM_NO = "SELECT * FROM RoomImage WHERE RoomNo = ?";
    
    private static final String INSERT_ROOM_IMAGE_SQL = "INSERT INTO RoomImage (RoomNo, ImageURL, ImageTitle) VALUES (?, ?, ?)";
    
    private static final String UPDATE_ROOM_IMAGE_SQL = "UPDATE RoomImage SET RoomNo = ?, ImageURL = ?, ImageTitle = ? WHERE RoomImageID = ?";
    
    private static final String DELETE_ROOM_IMAGE_SQL = "DELETE FROM RoomImage WHERE RoomImageID = ?";

    public RoomImage selectRoomImageById(int roomImageId) {
        RoomImage roomImage = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ROOM_IMAGE_BY_ID);
            st.setInt(1, roomImageId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                roomImage = mapResultSetToRoomImage(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return roomImage;
    }

    public List<RoomImage> selectRoomImagesByRoomNo(String roomNo) {
        List<RoomImage> roomImages = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ROOM_IMAGES_BY_ROOM_NO);
            st.setString(1, roomNo);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                roomImages.add(mapResultSetToRoomImage(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return roomImages;
    }

    public void insertRoomImage(RoomImage roomImage) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_ROOM_IMAGE_SQL);
            st.setString(1, roomImage.getRoomNo());
            st.setString(2, roomImage.getImageURL());
            st.setString(3, roomImage.getImageTitle());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateRoomImage(RoomImage roomImage) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_ROOM_IMAGE_SQL);
            st.setString(1, roomImage.getRoomNo());
            st.setString(2, roomImage.getImageURL());
            st.setString(3, roomImage.getImageTitle());
            st.setInt(4, roomImage.getRoomImageID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteRoomImage(int roomImageId) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_ROOM_IMAGE_SQL);
            st.setInt(1, roomImageId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private RoomImage mapResultSetToRoomImage(ResultSet rs) throws SQLException {
        RoomImage roomImage = new RoomImage();
        roomImage.setRoomImageID(rs.getInt("RoomImageID"));
        roomImage.setRoomNo(rs.getString("RoomNo"));
        roomImage.setImageURL(rs.getString("ImageURL"));
        roomImage.setImageTitle(rs.getString("ImageTitle"));
        return roomImage;
    }
}