/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.GuestDAO;
import jakarta.mail.MessagingException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.EmailUtility;
import static utils.EmailUtility.sendEmail;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class ForgetPasswordServlet extends HttpServlet {

    private GuestDAO guestDAO;
    private EmailUtility emailUtility;

    public void init() {
        guestDAO = new GuestDAO();
        emailUtility = new EmailUtility();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgetPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgetPasswordServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private void moveToOTP(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, MessagingException {
        String email = request.getParameter("email");

        if (guestDAO.selectGuestByEmail(email) == null) {
            request.setAttribute("errorMessage", "Invalid email");
            request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
        } else {
            String recipient = email;
            String subject = "Email verification";

            // Tạo mã xác minh 6 chữ số ngẫu nhiên
            Random random = new Random();
            int verificationCode = 100000 + random.nextInt(900000); // Tạo số ngẫu nhiên từ 100000 đến 999999
            System.out.println("Verification OTP: " + verificationCode);

            String content = "Your verification code is: " + verificationCode;
            emailUtility.sendEmail(recipient, subject, content);

            HttpSession session = request.getSession();
            session.setAttribute("verificationCode", verificationCode); // Lưu OTP vào session
            session.setAttribute("userForgetPassword", guestDAO.selectGuestByEmail(email));

            response.sendRedirect("otpForm.jsp"); // Chuyển người dùng đến trang nhập OTP
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //        processRequest(request, response);
            moveToOTP(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(ForgetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
