/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ListRoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import model.Hotel;
import model.Room;
import model.RoomImage;
import model.RoomType;

/**
 *
 * @author Tang Thanh Vui - CE180901
 */
@MultipartConfig
public class AdminUpdateRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminUpdateRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUpdateRoomServlet at " + request.getContextPath() + "</h1>");
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
        ListRoomDAO ld = new ListRoomDAO();
        String id = request.getParameter("id");

        Room room = ld.getRoomByID(id);

        request.setAttribute("roomselect", room);

        List<RoomType> listRoomTypes = ld.selectAllRoomTypes();
        List<Hotel> listHotels = ld.selectAllHotels();
        request.setAttribute("listHotels", listHotels);
        request.setAttribute("listRoomTypes", listRoomTypes);

        request.getRequestDispatcher("adminUpdateRoom.jsp").forward(request, response);
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
        ListRoomDAO ld = new ListRoomDAO();

        String roomNo = request.getParameter("RoomNo");
        int roomTypeID = Integer.parseInt(request.getParameter("RoomType"));
        int hotelCode = Integer.parseInt(request.getParameter("HotelCode"));
        String amenities = request.getParameter("Amenities");
        boolean available = true; // Assume this comes from the form or defaults to true

        // Retrieve Room and Hotel information to construct folder path
        Room existingRoom = ld.getRoomByID(roomNo);
        String hotelName = ld.getHotelByHotelCode(hotelCode).getHotelName(); // Assuming getHotelByCode returns Hotel object
        String roomTypeName = ld.selectRoomTypeByID(roomTypeID).getRoomType(); // Assuming getRoomTypeByID returns RoomType object

        // Sanitize folder names (replace spaces and special characters if needed)
        hotelName = hotelName.replaceAll("\\s+", "");
        roomTypeName = roomTypeName.replaceAll("\\s+", "");

        // Construct the folder path based on hotel, room type, and room number
        String directoryPath = BASE_IMAGE_PATH + File.separator + hotelName + File.separator + roomNo + roomTypeName;

        // Ensure directory exists
        File dir = new File(directoryPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // Handle main image upload and rename
        Part mainImagePart = request.getPart("ImageBackground");
        String mainImageName = "room_main.jpg"; // Set a consistent name for the main image
        String mainImagePath = directoryPath + File.separator + mainImageName;
        mainImagePart.write(mainImagePath);

        // Create the Room object with the new image path for database storage
        Room room = new Room(roomNo, roomTypeID, hotelCode, "Images/" + hotelName + "/" + roomNo + roomTypeName + "/" + mainImageName, amenities, available);

        // Handle additional RoomImage uploads
        List<RoomImage> roomImages = new ArrayList<>();
        for (int i = 1; i <= 3; i++) {
            Part roomImagePart = request.getPart("RoomImages" + i);
            if (roomImagePart != null && roomImagePart.getSize() > 0) {
                String roomImageName = "room_detail" + i + ".jpg";
                String roomImagePath = directoryPath + File.separator + roomImageName;
                roomImagePart.write(roomImagePath);

                RoomImage roomImage = new RoomImage();
                roomImage.setRoomNo(roomNo);
                roomImage.setImageURL("Images/" + hotelName + "/" + roomNo + roomTypeName + "/" + roomImageName);
                roomImage.setImageTitle("Image " + i + " of Room " + roomNo);
                roomImages.add(roomImage);
            }
        }

        // Update Room and RoomImage records in the database
        ld.updateRoomAndImages(room, roomImages);

        // Set success message in session
        request.getSession().setAttribute("successMessage", "Update Room Successfully");

        // Redirect to the room list page
        request.getSession().setAttribute("showRoomListAfterUpdate", "true");
        response.sendRedirect("admin.jsp#roomsSection");
    }

    private static final String BASE_IMAGE_PATH = "C:\\Users\\ACER\\Documents\\Study\\tong_hop_hoc_lieu\\Ky_4\\PRJ301\\Code\\Project_PRJ301_4-11_Hoang\\TestProject_3\\TestProject_3\\src\\main\\webapp\\Images";

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
