/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.Iconstant;
import dal.GuestDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Guest;
import model.UserFacebookDTO;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import utils.EmailUtility;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
@WebServlet(name = "LoginFacebookHandlerServlet", urlPatterns = {"/loginFacebookHandlerServlet"})
public class LoginFacebookHandlerServlet extends HttpServlet {

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

//        String code = request.getParameter("code");
//        String accessToken = getToken(code);
//        UserFacebookDTO user = getUserInfo(accessToken);
//        System.out.println(user);
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Iconstant.FACEBOOK_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Iconstant.FACEBOOK_CLIENT_ID)
                                .add("client_secret", Iconstant.FACEBOOK_CLIENT_SECRET)
                                .add("redirect_uri", Iconstant.FACEBOOK_REDIRECT_URI)
                                .add("code", code)
                                .build()
                )
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserFacebookDTO getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = Iconstant.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserFacebookDTO fbAccount = new Gson().fromJson(response, UserFacebookDTO.class);
        return fbAccount;
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserFacebookDTO user = getUserInfo(accessToken);

        String fullName = user.getName();
        String email = user.getEmail();
        String provider = "Facebook";
        String provider_user_id = user.getId();

        // Nếu email là null, sử dụng provider_user_id để tạo định danh tạm thời
        if (email == null || email.isEmpty()) {
            email = "Facebook_" + provider_user_id;
        }

        Guest newGuest = new Guest();
        newGuest.setFullName(fullName);
        newGuest.setEmail(email);
        newGuest.setProvider(provider);
        newGuest.setProviderUserID(provider_user_id);

        System.out.println(user);
        System.out.println(newGuest);

        // Kiểm tra người dùng qua provider_user_id trước tiên
        Guest existingUserByProviderUserID = guestDAO.selectGuestByProviderUserId(provider_user_id, provider);
        

        // Nếu tìm thấy người dùng qua provider_user_id
        if (existingUserByProviderUserID != null) {
            System.out.println("Đã tìm thấy người dùng qua provider_user_id");

            // Kiểm tra nếu email hiện tại của người dùng khác với email mới (đã cập nhật email)
            if (!existingUserByProviderUserID.getEmail().equals(email)) {
                // Cập nhật email mới cho người dùng
                existingUserByProviderUserID.setEmail(email);
                guestDAO.updateGuestEmail(existingUserByProviderUserID); // Hàm này sẽ cập nhật email cho người dùng
                System.out.println("Đã cập nhật email mới cho người dùng");
            }

            // Đặt thông tin người dùng vào session và chuyển hướng tới trang Home
            HttpSession session = request.getSession();
            session.setAttribute("user", guestDAO.selectGuestByEmail(email));
            response.sendRedirect("Home.jsp");
            System.out.println("Đã login");

        } else {
            // Nếu không tìm thấy qua provider_user_id, kiểm tra qua email
            Guest existingGuestByEmail = guestDAO.selectGuestByEmail(email);

            // Nếu không tồn tại người dùng với email và provider_user_id => tiến hành signup
            if (existingGuestByEmail == null) {
                guestDAO.insertGuest(newGuest);
                System.out.println("Đã signup");
            }

            // Đặt thông tin người dùng vào session sau khi signup
            HttpSession session = request.getSession();
            session.setAttribute("user", guestDAO.selectGuestByEmail(email));
            response.sendRedirect("Home.jsp");
            System.out.println("Đã login");
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
//        processRequest(request, response);
        handleLogin(request, response);
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
//        processRequest(request, response);
//        handleLogin(request, response);
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
