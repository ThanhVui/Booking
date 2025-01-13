/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.FilterDAO;
import dal.ListRoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.Filters;
import model.Room;
import model.RoomImage;

/**
 *
 * @author Nguyen Huy Hoang - CE182102
 */
public class ListRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet ListRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListRoomServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        ListRoomDAO roomDAO = new ListRoomDAO();

        List<Room> listRooms = roomDAO.getAllRoomsInHotel();
        session.setAttribute("listRooms", listRooms);
        String reset = request.getParameter("reset");
        List<Room> originalRooms;

        if ("true".equals(reset)) {
            session.removeAttribute("destinationSearchBar");
            session.removeAttribute("checkInSearchBar");
            session.removeAttribute("checkOutSearchBar");
            session.removeAttribute("adultsSearchBar");
            session.removeAttribute("childrenSearchBar");

            originalRooms = roomDAO.getAllRoomsInHotel();
            session.setAttribute("originalRooms", originalRooms);
        } else {
            originalRooms = (List<Room>) session.getAttribute("originalRooms");
            if (originalRooms == null) {
                originalRooms = roomDAO.getAllRoomsInHotel();
                session.setAttribute("originalRooms", originalRooms);
            }
        }

        List<Room> filteredRooms = new ArrayList<>(originalRooms);

        String destination = (String) session.getAttribute("destinationSearchBar");
        String checkin = (String) session.getAttribute("checkInSearchBar");
        String checkout = (String) session.getAttribute("checkOutSearchBar");
        String adults = (String) session.getAttribute("adultsSearchBar");
        String children = (String) session.getAttribute("childrenSearchBar");

        if (destination != null && checkin != null && checkout != null && !"true".equals(reset)) {
            filteredRooms = roomDAO.getFilteredRooms(destination, checkin, checkout, adults, children);
        }

        if (filteredRooms != null && !filteredRooms.isEmpty()) {
            session.setAttribute("listRooms", filteredRooms);

            Map<String, List<RoomImage>> roomImagesMap = new HashMap<>();
            for (Room room : filteredRooms) {
                List<RoomImage> images = roomDAO.getRoomImages(room.getRoomNo());
                roomImagesMap.put(room.getRoomNo(), images);
            }
            session.setAttribute("roomImagesMap", roomImagesMap);
        } else {
            session.setAttribute("error", "No rooms available.");
        }

        request.getRequestDispatcher("listroom.jsp").forward(request, response);

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
        String json = request.getReader().lines().collect(Collectors.joining());
        System.out.println("Received JSON: " + json);  // Debugging line
        Gson gson = new Gson();
        Filters filters = gson.fromJson(json, Filters.class);

// Get the filtered rooms from DAO
        FilterDAO filterDAO = new FilterDAO();
        List<Room> filteredRooms = filterDAO.getFiltersRooms(filters);

// Debugging output to ensure proper filtering
        System.out.println("Filtered rooms count: " + filteredRooms.size());

// Set the filtered rooms in the session scope (you might remove this if only using AJAX)
        HttpSession session = request.getSession();
// Store search parameters in session
        session.setAttribute("searchDestination", filters.getDestination());
        session.setAttribute("searchCheckinDate", filters.getCheckinDate());
        session.setAttribute("searchCheckoutDate", filters.getCheckoutDate());
        session.setAttribute("searchAdultsCount", filters.getNumberAdults());
        session.setAttribute("searchChildrenCount", filters.getNumberChildren());
        session.setAttribute("searchTotalGuests", filters.getNumberAdults() + filters.getNumberChildren());

        if (filteredRooms != null && !filteredRooms.isEmpty()) {
            session.setAttribute("listRooms", filteredRooms);

            // Prepare the response with images
            List<Map<String, Object>> roomsWithImages = new ArrayList<>();
            for (Room room : filteredRooms) {
                Map<String, Object> roomData = new HashMap<>();

                // Add basic room data
                roomData.put("roomNo", room.getRoomNo());
                roomData.put("roomType", room.getRoomType());
                roomData.put("hotel", room.getHotel());
                roomData.put("imageBackground", room.getImageBackground());
                roomData.put("amenities", room.getAmenities());
                roomData.put("available", room.isAvailable());

                // Add images by calling getAllImagesByRoomNo()
                roomData.put("images", room.getAllImagesByRoomNo());

                // Add this room's data to the list
                roomsWithImages.add(roomData);
            }

            // Send the rooms with images as JSON response
            String jsonResponse = gson.toJson(roomsWithImages);
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse);
        } else {
            session.setAttribute("error", "No rooms available.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No Data Found");
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
