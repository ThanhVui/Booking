/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BookingDAO;
import dal.GuestDAO;
import dal.ReviewHotelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.Month;
import java.util.List;
import model.Booking;
import model.Guest;
import model.ReviewHotel;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class AdminServlet extends HttpServlet {
   
    private GuestDAO guestDAO;
    private BookingDAO bookingDAO;
    private ReviewHotelDAO reviewHotelDAO;

    public void init() {
        guestDAO = new GuestDAO();
        bookingDAO = new BookingDAO();
        reviewHotelDAO = new ReviewHotelDAO();
    }

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 
    
    public void totalGuestDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
        List<Guest> guestList = guestDAO.selectAllGuest();

        String label;
        String[] labels = new String[12];
        long[] totalGuestOfMonths = new long[12];

        // Tạo mảng chứa các nhãn tháng
        for (int month = 1; month <= currentDate.toLocalDate().getMonthValue(); month++) {
            label = Month.of(month).toString().substring(0, 1).toUpperCase() + Month.of(month).toString().substring(1).toLowerCase();
            labels[month - 1] = label; // Gán nhãn vào mảng
        }

        // Đếm tổng số Guest cho từng tháng
        for (Guest guest : guestList) {
            if (guest.getCreatedAt() != null) {
                int month = guest.getCreatedAt().toLocalDate().getMonthValue(); // Lấy tháng từ CreatedAt
                totalGuestOfMonths[month - 1]++; // Tăng tổng số guest cho tháng đó
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("labels", labels);
        session.setAttribute("totalGuestOfMonths", totalGuestOfMonths);
//        response.sendRedirect("admin.jsp");
    }
    
    public void totalBookingDashboard(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
        List<Booking> bookingList = bookingDAO.selectAllBookings();

        String label;
        String[] labels = new String[12];
        long[] totalBookingOfMonths = new long[12];

        // Tạo mảng chứa các nhãn tháng
        for (int month = 1; month <= currentDate.toLocalDate().getMonthValue(); month++) {
            label = Month.of(month).toString().substring(0, 1).toUpperCase() + Month.of(month).toString().substring(1).toLowerCase();
            labels[month - 1] = label; // Gán nhãn vào mảng
        }

        // Đếm tổng số Guest cho từng tháng
        for (Booking booking : bookingList) {
            if (booking.getCheckInDate() != null) {
                int month = booking.getCheckInDate().toLocalDate().getMonthValue();
                totalBookingOfMonths[month - 1]++;
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("labels", labels);
        session.setAttribute("totalBookingOfMonths", totalBookingOfMonths);
//        response.sendRedirect("admin.jsp");
    }
    
    public void reviews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ReviewHotel> reviews = reviewHotelDAO.selectAllReview();
        HttpSession session = request.getSession();
        session.setAttribute("reviews", reviews);
        response.sendRedirect("admin.jsp");
//        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        totalGuestDashboard(request, response);
        totalBookingDashboard(request, response);
        
        response.sendRedirect("admin.jsp");

    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
