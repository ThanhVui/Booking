package controller;

import dal.GuestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.Guest;
import org.mindrot.jbcrypt.BCrypt;
import utils.EmailUtility;

/**
 * Servlet xử lý đăng nhập và đăng ký
 */
@WebServlet(name = "AuthServlet", urlPatterns = {"/auth"})
public class AuthServlet extends HttpServlet {

    private GuestDAO guestDAO;
    private EmailUtility emailUtility;

    public void init() {
        guestDAO = new GuestDAO();
        emailUtility = new EmailUtility();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AuthServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthServlet at " + Timestamp.valueOf(LocalDateTime.now()) + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // Xử lý đăng ký
    private void handleSignUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        
        // Mã hóa mật khẩu
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println("pass: " + hashedPassword);
        
        Guest newGuest = new Guest();
        newGuest.setFullName(fullName);
        newGuest.setEmail(email);
        newGuest.setPassword(hashedPassword);
        System.out.println("User: " + newGuest.toString());
        
        Guest existingGuestByEmail = guestDAO.selectGuestByEmail(email);

        if (existingGuestByEmail == null) {
            newGuest.setProvider("Email");
            
            System.out.println(newGuest.toString());
            
            guestDAO.insertGuest(newGuest);
            HttpSession session = request.getSession();
            session.setAttribute("user", guestDAO.selectGuestByEmail(email));
//            request.getRequestDispatcher("Home.jsp").forward(request, response);
            response.sendRedirect("Home.jsp");
        } 
        else if (existingGuestByEmail != null && !existingGuestByEmail.getProvider().contains("Email")) {
            newGuest.setProvider(existingGuestByEmail.getProvider() + ", Email");
            guestDAO.updateGuestPasswordProvider(newGuest);
        } 
        else {
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("LoginFinal.jsp").forward(request, response);
        }
    }

    // Xử lý đăng nhập
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Guest existingGuest = guestDAO.selectGuestByEmail(email);
        
        System.out.println("pass"+password);
        System.out.println("db" +existingGuest.getPassword());

        if (existingGuest != null && BCrypt.checkpw(password, existingGuest.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("user", guestDAO.selectGuestByEmail(email));
            response.sendRedirect("Home.jsp");
//            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Invalid email or password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("LoginFinal.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("signup".equals(action)) {
            handleSignUp(request, response);
        } else if ("login".equals(action)) {
            handleLogin(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "AuthServlet handles signup and login operations";
    }

}
