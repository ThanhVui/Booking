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
import model.ReviewHotel;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class ReviewHotelDAO extends DBContext {

    // SQL Statements
    private static final String SELECT_ALL_REVIEW = "SELECT * FROM ReviewHotel";
    private static final String SELECT_REVIEW_BY_ID = "SELECT * FROM ReviewHotel WHERE ReviewHotelID = ?";
    private static final String SELECT_REVIEWS_BY_HOTEL = "SELECT * FROM ReviewHotel WHERE HotelCode = ?";
    
    private static final String INSERT_REVIEW_SQL = "INSERT INTO ReviewHotel (HotelCode, GuestID, StarRating, Comment, ReviewDate) VALUES (?, ?, ?, ?, GETDATE())";
    
    private static final String UPDATE_REVIEW_SQL = "UPDATE ReviewHotel SET Comment = ? WHERE ReviewHotelID = ?";
    
    private static final String DELETE_REVIEW_SQL = "DELETE FROM ReviewHotel WHERE ReviewHotelID = ?";

    // Phương thức 
    public List<ReviewHotel> selectAllReview() {
        List<ReviewHotel> listReview = new ArrayList<>(); // Khởi tạo danh sách Room
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_REVIEW);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                listReview.add(mapResultSetToReview(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listReview;
    }

    // Select Review by ID
    public ReviewHotel selectReviewByID(int id) {
        ReviewHotel review = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_REVIEW_BY_ID);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                review = mapResultSetToReview(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return review;
    }

    // Select Reviews by HotelCode
    public List<ReviewHotel> selectReviewsByHotel(int hotelCode) {
        List<ReviewHotel> reviews = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_REVIEWS_BY_HOTEL);
            st.setInt(1, hotelCode);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                reviews.add(mapResultSetToReview(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return reviews;
    }

    // Insert a new review
    public void insertReview(ReviewHotel review) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_REVIEW_SQL);
            st.setInt(1, review.getHotelCode());
            st.setInt(2, review.getGuestID());
            st.setInt(3, review.getStarRating());
            st.setString(4, review.getComment());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Update a review
    public void updateReviewComment(ReviewHotel review) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_REVIEW_SQL);
            st.setString(1, review.getComment());
            st.setInt(2, review.getReviewHotelID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//    // Delete a review
    public void deleteReview(int id) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_REVIEW_SQL);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Delete a review
//    public boolean deleteReview(int reviewHotelID) {
//        String DELETE_REVIEW_SQL = "DELETE FROM ReviewHotel WHERE reviewHotelID = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(DELETE_REVIEW_SQL);
//            st.setInt(1, reviewHotelID);
//            int affectedRows = st.executeUpdate(); // Thực thi câu lệnh DELETE
//
//            return affectedRows > 0; // Trả về true nếu xóa thành công
//        } catch (SQLException e) {
//            System.out.println("Error deleting review: " + e.getMessage());
//            return false; // Trả về false nếu có lỗi xảy ra
//        }
//    }

    // Map ResultSet to ReviewHotel object
    private ReviewHotel mapResultSetToReview(ResultSet rs) throws SQLException {
        ReviewHotel review = new ReviewHotel();
        review.setReviewHotelID(rs.getInt("ReviewHotelID"));
        review.setHotelCode(rs.getInt("HotelCode"));
        review.setGuestID(rs.getInt("GuestID"));
        review.setStarRating(rs.getInt("StarRating"));
        review.setComment(rs.getString("Comment"));
        review.setReviewDate(rs.getDate("ReviewDate"));
        return review;
    }
}
