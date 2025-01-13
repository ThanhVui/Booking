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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Guest;
import model.UserGoogleDTO;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import utils.EmailUtility;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
@WebServlet(name = "LoginGoogleHandlerServlet", urlPatterns = {"/loginGoogleHandlerServlet"})
public class LoginGoogleHandlerServlet extends HttpServlet {

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
//        String code = request.getParameter("code");
//        String accessToken = getToken(code);
//        UserGoogleDTO user = getUserInfo(accessToken);
//        System.out.println(user.getPicture());
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Iconstant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Iconstant.GOOGLE_CLIENT_ID)
                                .add("client_secret", Iconstant.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", Iconstant.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", Iconstant.GOOGLE_GRANT_TYPE)
                                .build()
                )
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = Iconstant.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);
        return googlePojo;
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            UserGoogleDTO user = getUserInfo(accessToken);

            System.out.println(user);

            String fullName = user.getName();
            String email = user.getEmail();
            String image = user.getPicture();
            String provider_user_id = user.getId();

            Guest newGuest = new Guest();
            newGuest.setFullName(fullName);
            newGuest.setEmail(email);
            newGuest.setImageLink(image);
            newGuest.setProviderUserID(provider_user_id);

            System.out.println(newGuest);

            Guest existingGuestByEmail = guestDAO.selectGuestByEmail(email);

            // Nếu không tồn tại người dùng với email hoặc provider của người dùng đó là null => tiến hành signup
            if (existingGuestByEmail == null) {
                newGuest.setProvider("Google");

                guestDAO.insertGuest(newGuest);
                System.out.println("Signup");
            } // Nếu tồn tại và provider không chứa "Google" thì cập nhật provider với giá trị mới
            else if (!existingGuestByEmail.getProvider().contains("Google")) {
                newGuest.setProvider(existingGuestByEmail.getProvider() + ", Google");
                guestDAO.updateGuestProviderID(newGuest);
            }

            // Đặt thông tin người dùng vào session sau khi signup
            HttpSession session = request.getSession();
            session.setAttribute("user", guestDAO.selectGuestByEmail(email));
//        request.getRequestDispatcher("Home.jsp").forward(request, response);
            response.sendRedirect("Home.jsp");
        } catch (Exception e) {
            request.setAttribute("error", "Login fail!");
            request.getRequestDispatcher("LoginFinal.jsp").forward(request, response);
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
        handleLogin(request, response);
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
