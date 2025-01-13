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
import model.Bill;
import utils.DBContext;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class BillDAO extends DBContext {

    private static final String SELECT_BILL_BY_INVOICE_NO = "SELECT * FROM Bill WHERE InvoiceNo = ?";
    private static final String SELECT_BILL_BY_GUEST_ID = "SELECT * FROM Bill WHERE GuestID = ?";
    private static final String SELECT_ALL_BILLS = "SELECT * FROM Bill";
    
    private static final String INSERT_BILL_SQL = "INSERT INTO Bill (GuestID, BookingID, TotalAmount, PaymentDate, PaymentStatus) VALUES (?, ?, ?, ?, ?)";
    
    private static final String UPDATE_BILL_SQL = "UPDATE Bill SET GuestID = ?, BookingID = ?, TotalAmount = ?, PaymentDate = ?, PaymentStatus = ? WHERE InvoiceNo = ?";
    
    private static final String DELETE_BILL_SQL = "DELETE FROM Bill WHERE InvoiceNo = ?";

    public Bill selectBillByInvoiceNo(int invoiceNo) {
        Bill bill = null;
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_BILL_BY_INVOICE_NO);
            st.setInt(1, invoiceNo);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                bill = mapResultSetToBill(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return bill;
    } 
    
    public List<Bill>  selectBillByGuestID(int guestID) {
        List<Bill> bills = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_BILL_BY_GUEST_ID);
            st.setInt(1, guestID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                bills.add(mapResultSetToBill(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return bills;
    }

    public List<Bill> selectAllBills() {
        List<Bill> bills = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(SELECT_ALL_BILLS);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                bills.add(mapResultSetToBill(rs));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return bills;
    }

    public void insertBill(Bill bill) {
        try {
            PreparedStatement st = connection.prepareStatement(INSERT_BILL_SQL);
            st.setInt(1, bill.getGuestID());
            st.setInt(2, bill.getBookingID());
            st.setDouble(3, bill.getTotalAmount());
            st.setDate(4, bill.getPaymentDate());
            st.setBoolean(5, bill.isPaymentStatus());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateBill(Bill bill) {
        try {
            PreparedStatement st = connection.prepareStatement(UPDATE_BILL_SQL);
            st.setInt(1, bill.getGuestID());
            st.setInt(2, bill.getBookingID());
            st.setDouble(3, bill.getTotalAmount());
            st.setDate(4, bill.getPaymentDate());
            st.setBoolean(5, bill.isPaymentStatus());
            st.setInt(6, bill.getInvoiceNo());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteBill(int invoiceNo) {
        try {
            PreparedStatement st = connection.prepareStatement(DELETE_BILL_SQL);
            st.setInt(1, invoiceNo);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private Bill mapResultSetToBill(ResultSet rs) throws SQLException {
        Bill bill = new Bill();
        bill.setInvoiceNo(rs.getInt("InvoiceNo"));
        bill.setGuestID(rs.getInt("GuestID"));
        bill.setBookingID(rs.getInt("BookingID"));
        bill.setTotalAmount(rs.getDouble("TotalAmount"));
        bill.setPaymentDate(rs.getDate("PaymentDate"));
        bill.setPaymentStatus(rs.getBoolean("PaymentStatus"));
        return bill;
    }
}
