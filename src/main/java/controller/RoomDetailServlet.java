/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.GuestDAO;
import dal.HotelDAO;
import dal.ListRoomDAO;
import dal.ReviewHotelDAO;
import dal.RoomDAO;
import dal.RoomImageDAO;
import dal.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Hotel;
import model.ReviewHotel;
import model.Room;
import model.RoomImage;
import model.RoomType;
import java.util.Collections;
import java.util.Comparator;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class RoomDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet RoomDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void sortReviewsByDate(List<ReviewHotel> reviews) {
        Collections.sort(reviews, new Comparator<ReviewHotel>() {
            @Override
            public int compare(ReviewHotel r1, ReviewHotel r2) {
                // So sánh reviewDate theo thứ tự giảm dần (mới nhất trước)
                return r2.getReviewDate().compareTo(r1.getReviewDate());
            }
        });
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
        String id = request.getParameter("id");

        RoomDAO roomDAO = new RoomDAO();
        RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
        RoomImageDAO roomImageDAO = new RoomImageDAO();
        HotelDAO hotelDAO = new HotelDAO();
        ReviewHotelDAO reviewHotelDAO = new ReviewHotelDAO();

        Room room = roomDAO.selectRoomByNo(id);
        RoomType roomType = roomTypeDAO.selectRoomTypeByID(room.getRoomTypeID());
//        RoomImage roomImage = (RoomImage) roomImageDAO.selectRoomImagesByRoomNo(room.getRoomNo());
        List<Room> listRoom = roomDAO.selectAllRooms();
        Hotel hotel = hotelDAO.selectHotelByCode(room.getHotelCode());
        List<ReviewHotel> reviews = reviewHotelDAO.selectReviewsByHotel(room.getHotelCode());
        sortReviewsByDate(reviews);

        HttpSession session = request.getSession();
        session.setAttribute("room", room);
        session.setAttribute("hotel", hotel);
        session.setAttribute("roomType", roomType);
//        session.setAttribute("roomImage", roomImage);
        session.setAttribute("listRoom", listRoom);
        session.setAttribute("reviews", reviews);

        response.sendRedirect("roomDetail.jsp");
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
        String action = request.getParameter("action");
        ReviewHotelDAO reviewHotelDAO = new ReviewHotelDAO();

        if ("addReview".equals(action)) {
            try {
                String hotelCodeParam = request.getParameter("hotelCode");
                String guestIDParam = request.getParameter("guestID");
                String starRatingParam = request.getParameter("starRating");
                String comment = request.getParameter("comment");

                System.out.println(hotelCodeParam);
                System.out.println(guestIDParam);
                System.out.println(starRatingParam);
                System.out.println(comment);

                if (hotelCodeParam != null && guestIDParam != null && starRatingParam != null && comment != null) {
                    int hotelCode = Integer.parseInt(hotelCodeParam);
                    int guestID = Integer.parseInt(guestIDParam);
                    int starRating = Integer.parseInt(starRatingParam);

                    ReviewHotel review = new ReviewHotel();
                    review.setHotelCode(hotelCode);
                    review.setGuestID(guestID);
                    review.setStarRating(starRating);
                    review.setComment(comment);

                    // Thêm bình luận vào cơ sở dữ liệu
                    reviewHotelDAO.insertReview(review);

                    // Sau khi thêm bình luận, lấy lại danh sách bình luận
                    List<ReviewHotel> reviews = reviewHotelDAO.selectReviewsByHotel(hotelCode);
                    sortReviewsByDate(reviews); // Sắp xếp bình luận nếu cần

                    // Đặt lại danh sách bình luận trong session
                    request.getSession().setAttribute("reviews", reviews);

                    // Chuyển hướng lại trang roomDetail.jsp để cập nhật danh sách bình luận
                    response.sendRedirect("roomDetail.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing input fields.");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input for hotel code, guest ID, or star rating.");
            }
        }

        if ("editReview".equals(action)) {
            try {
                String reviewIDParam = request.getParameter("reviewID");
                String newComment = request.getParameter("comment");

                System.out.println(reviewIDParam);
                System.out.println(newComment);

                if (reviewIDParam != null && newComment != null) {

                    ReviewHotel rh = new ReviewHotel();
                    rh.setReviewHotelID(Integer.parseInt(reviewIDParam));
                    rh.setComment(newComment);

                    ReviewHotelDAO rhd = new ReviewHotelDAO();
                    rhd.updateReviewComment(rh); // Giả sử có hàm update trong DAO
                    
                    response.sendRedirect("roomDetail");
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing input fields for review editing.");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid review ID.");
            }
        }

        if ("deleteReview".equals(action)) {
            try {
                String reviewIDParam = request.getParameter("reviewID");

                if (reviewIDParam != null) {
                    int reviewID = Integer.parseInt(reviewIDParam);
                    ReviewHotel review = reviewHotelDAO.selectReviewByID(reviewID);
                    int guestID = review.getGuestID();

                    if (guestID == (Integer) request.getSession().getAttribute("userID")) {
                        reviewHotelDAO.deleteReview(reviewID);
                        response.getWriter().write("success");
                    } else {
                        response.sendError(HttpServletResponse.SC_FORBIDDEN, "You cannot delete this comment.");
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing review ID for deletion.");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid review ID.");
            }
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
