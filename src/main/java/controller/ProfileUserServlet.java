package controller;

import model.Guest;
import dal.GuestDAO;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "ProfileUserServlet", urlPatterns = {"/profileUserServlet"})
public class ProfileUserServlet extends HttpServlet {

    private GuestDAO guestDAO;

    @Override
    public void init() {
        guestDAO = new GuestDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Guest user = (Guest) session.getAttribute("user");

        if (user != null && (user.getEmail() != null || user.getPhoneNumber() != null)) {
            // Determine login method for editing restrictions
            boolean isEmailLogin = user.getEmail() != null && user.getEmail().contains("@");
            request.setAttribute("isEmailLogin", isEmailLogin); // True if login by email

            // Pass user details to the JSP
            request.setAttribute("user", user);
            request.getRequestDispatcher("/profileuser.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Guest user = (Guest) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            // Lấy thông tin từ form để cập nhật
            String fullName = request.getParameter("fullname");
            String dobStr = request.getParameter("dob");
            Date dob = dobStr != null && !dobStr.isEmpty() ? Date.valueOf(dobStr) : null;
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String address = request.getParameter("address");

            // Kiểm tra xem các trường không được để trống
            if (fullName == null || fullName.trim().isEmpty()
                    || password == null || password.trim().isEmpty()
                    || address == null || address.trim().isEmpty()) {
                request.setAttribute("updateSuccess", "false");
                request.setAttribute("errorMessage", "Please fill in all required fields.");
                request.getRequestDispatcher("/profileuser.jsp").forward(request, response);
                return;
            }

            // Mã hóa mật khẩu
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            System.out.println("pass: " + hashedPassword);

            // Cập nhật thông tin người dùng trong cơ sở dữ liệu
            boolean updateSuccess = guestDAO.updateUserProfile(fullName, dob, gender, phone, hashedPassword, address, user.getEmail());

            // Nếu cập nhật thành công, cập nhật lại thông tin trong session
            if (updateSuccess) {
                user.setFullName(fullName);
                user.setDOB(dob);
                user.setGender(gender);
                user.setPhoneNumber(phone);
                user.setPassword(hashedPassword);
                user.setAddress(address);
                session.setAttribute("user", user);
                request.setAttribute("updateSuccess", "true");
                request.setAttribute("message", "Profile updated successfully!");
            } else {
                request.setAttribute("updateSuccess", "false");
                request.setAttribute("errorMessage", "Profile update failed. Please try again.123");
            }
        } catch (Exception e) {
            request.setAttribute("updateSuccess", "false");
            request.setAttribute("errorMessage", "An error occurred while updating the profile. Please try again.");
            e.printStackTrace(); // Log ra console để kiểm tra lỗi
        }

        // Chuyển tiếp lại trang profile để hiển thị thông báo
        request.getRequestDispatcher("/profileuser.jsp").forward(request, response);
    }
}
