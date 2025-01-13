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
import model.Discount;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class DiscountDAO extends DBContext {

    // SQL queries
    private static final String SELECT_DISCOUNT_BY_ID = "SELECT * FROM Discount WHERE DiscountID = ?";
    private static final String SELECT_ALL_DISCOUNTS = "SELECT * FROM Discount";
    private static final String INSERT_DISCOUNT_SQL = "INSERT INTO Discount (DiscountName, DiscountValue, DiscountStartDate, DiscountEndDate) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_DISCOUNT_SQL = "UPDATE Discount SET DiscountName = ?, DiscountValue = ?, DiscountStartDate = ?, DiscountEndDate = ? WHERE DiscountID = ?";
    private static final String DELETE_DISCOUNT_SQL = "DELETE FROM Discount WHERE DiscountID = ?";

    // Select a single Discount by ID
    public Discount selectDiscountByID(int id) {
        Discount discount = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_DISCOUNT_BY_ID);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                discount = mapResultSetToDiscount(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return discount;
    }

    // Select all Discounts
    public List<Discount> selectAllDiscounts() {
        List<Discount> discounts = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_DISCOUNTS);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Discount discount = mapResultSetToDiscount(rs);
                discounts.add(discount);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return discounts;
    }

    // Insert a new Discount
    public void insertDiscount(Discount discount) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_DISCOUNT_SQL);
            st.setString(1, discount.getDiscountName());
            st.setDouble(2, discount.getDiscountValue());
            st.setDate(3, discount.getDiscountStartDate());
            st.setDate(4, discount.getDiscountEndDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Update an existing Discount
    public void updateDiscount(Discount discount) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_DISCOUNT_SQL);
            st.setString(1, discount.getDiscountName());
            st.setDouble(2, discount.getDiscountValue());
            st.setDate(3, discount.getDiscountStartDate());
            st.setDate(4, discount.getDiscountEndDate());
            st.setInt(5, discount.getDiscountID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Delete a Discount by ID
    public void deleteDiscount(int id) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_DISCOUNT_SQL);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    // Map ResultSet to Discount
    private Discount mapResultSetToDiscount(ResultSet rs) throws SQLException {
        Discount discount = new Discount();
        discount.setDiscountID(rs.getInt("DiscountID"));
        discount.setDiscountName(rs.getString("DiscountName"));
        discount.setDiscountValue(rs.getDouble("DiscountValue"));
        discount.setDiscountStartDate(rs.getDate("DiscountStartDate"));
        discount.setDiscountEndDate(rs.getDate("DiscountEndDate"));
        return discount;
    }
}
