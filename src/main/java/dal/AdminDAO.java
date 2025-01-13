/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Admin;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class AdminDAO extends DBContext {

    private static final String SELECT_ADMIN_BY_ID = "SELECT * FROM Admin WHERE AdminID = ?";
    private static final String SELECT_ADMIN_BY_EMAIL = "SELECT * FROM Admin WHERE Email = ?";
    private static final String INSERT_ADMIN_SQL = "INSERT INTO Admin (FullName, PhoneNo, Email, Password, CreateAt) VALUES (?, ?, ?, ?, GETDATE())";
    private static final String UPDATE_ADMIN_SQL = "UPDATE Admin SET FullName = ?, PhoneNo = ?, Email = ?, Password = ? WHERE AdminID = ?";
    private static final String DELETE_ADMIN_SQL = "DELETE FROM Admin WHERE AdminID = ?";

    public Admin selectAdminById(int adminId) {
        Admin admin = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ADMIN_BY_ID);
            st.setInt(1, adminId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                admin = mapResultSetToAdmin(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return admin;
    }

    public Admin selectAdminByEmail(String email) {
        Admin admin = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ADMIN_BY_EMAIL);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                admin = mapResultSetToAdmin(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return admin;
    }

    public void insertAdmin(Admin admin) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_ADMIN_SQL);
            st.setString(1, admin.getFullName());
            st.setString(2, admin.getPhoneNo());
            st.setString(3, admin.getEmail());
            st.setString(4, admin.getPassword());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateAdmin(Admin admin) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_ADMIN_SQL);
            st.setString(1, admin.getFullName());
            st.setString(2, admin.getPhoneNo());
            st.setString(3, admin.getEmail());
            st.setString(4, admin.getPassword());
            st.setInt(5, admin.getAdminID());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAdmin(int adminId) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_ADMIN_SQL);
            st.setInt(1, adminId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private Admin mapResultSetToAdmin(ResultSet rs) throws SQLException {
        Admin admin = new Admin();
        admin.setAdminID(rs.getInt("AdminID"));
        admin.setFullName(rs.getString("FullName"));
        admin.setPhoneNo(rs.getString("PhoneNo"));
        admin.setEmail(rs.getString("Email"));
        admin.setPassword(rs.getString("Password"));
        return admin;
    }
}
