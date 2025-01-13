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
public class AdminAddNewRoomServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminAddNewRoomServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddNewRoomServlet at " + request.getContextPath() + "</h1>");
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

        List<RoomType> listRoomTypes = ld.selectAllRoomTypes();
        List<Hotel> listHotels = ld.selectAllHotels();
        request.setAttribute("listHotels", listHotels);
        request.setAttribute("listRoomTypes", listRoomTypes);
        request.getRequestDispatcher("adminAddNewRoom.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        ListRoomDAO roomDAO = new ListRoomDAO();
        String roomNo = request.getParameter("RoomNo");
        String amenities = request.getParameter("Amenities");
        String hotelCodeParam = request.getParameter("HotelCode");
        String roomTypeParam = request.getParameter("RoomType");

        Room existroom = roomDAO.getRoomByID(roomNo);

        if (existroom != null) {
            request.getSession().setAttribute("successMessageRoomAddExist", "This Room is Already Exist! Please Try Again!");
            request.getSession().setAttribute("showRoomListAfterUpdate", "true");
            response.sendRedirect("adminAddNewRoomServlet#roomsSection");
        } else {

            try {
                int roomTypeID = Integer.parseInt(roomTypeParam);
                int hotelCode = Integer.parseInt(hotelCodeParam);

                Hotel hotelU = roomDAO.getHotelByHotelCode(hotelCode);
                RoomType rt = roomDAO.selectRoomTypeByID(roomTypeID);

                // Giả sử bạn đã lấy tên khách sạn và tên loại phòng từ CSDL
                String hotelName = hotelU.getHotelName(); // Lấy từ database
                String roomTypeName = rt.getRoomType(); // Lấy từ database

                // Xử lý ảnh chính (Main Image Background)
                Part mainImagePart = request.getPart("ImageBackground");
                String mainImageName = mainImagePart.getSubmittedFileName();
                String mainImageAbsolutePath = generateImagePath(hotelName, roomNo, roomTypeName, mainImageName);
                String mainImageRelativePath = getRelativeImagePath(hotelName, roomNo, roomTypeName, mainImageName);
                mainImagePart.write(mainImageAbsolutePath);

                // Tạo đối tượng Room với ảnh chính và lưu đường dẫn tương đối vào CSDL
                Room room = new Room();
                room.setRoomNo(roomNo);
                room.setRoomTypeID(roomTypeID);
                room.setHotelCode(hotelCode);
                room.setImageBackground(mainImageRelativePath); // Lưu đường dẫn tương đối
                room.setAmenities(amenities);
                room.setAvailable(true);

                // Xử lý các ảnh phụ (RoomImages)
                List<RoomImage> roomImages = new ArrayList<>();
                for (Part roomImagePart : request.getParts()) {
                    if (roomImagePart.getName().equals("RoomImages") && roomImagePart.getSize() > 0) {
                        String roomImageName = roomImagePart.getSubmittedFileName();
                        String roomImageAbsolutePath = generateImagePath(hotelName, roomNo, roomTypeName, roomImageName);
                        String roomImageRelativePath = getRelativeImagePath(hotelName, roomNo, roomTypeName, roomImageName);
                        roomImagePart.write(roomImageAbsolutePath);

                        RoomImage roomImage = new RoomImage();
                        roomImage.setRoomNo(roomNo);
                        roomImage.setImageURL(roomImageRelativePath); // Lưu đường dẫn tương đối
                        roomImage.setImageTitle("Additional view of Room " + roomNo);
                        roomImages.add(roomImage);
                    }
                }

                // Gọi phương thức adminAddNewRoom để thêm Room và danh sách RoomImage vào cơ sở dữ liệu
                request.getSession().setAttribute("successMessageRoomAdd", "Add New Room Successfully");
                roomDAO.adminAddNewRoom(room, roomImages);
                request.getSession().setAttribute("showRoomListAfterUpdate", "true");
                response.sendRedirect("admin.jsp#roomsSection");
            } catch (NumberFormatException e) {
                e.printStackTrace();
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

    private static final String BASE_IMAGE_PATH = "C:\\Users\\ACER\\Documents\\Study\\tong_hop_hoc_lieu\\Ky_4\\PRJ301\\Code\\Project_PRJ301_4-11_Hoang\\TestProject_3\\TestProject_3\\src\\main\\webapp\\Images";

    private String generateImagePath(String hotelName, String roomNo, String roomTypeName, String imageFileName) {
        String sanitizedHotelName = hotelName.replaceAll("\\s+", "");
        String sanitizedRoomTypeName = roomTypeName.replaceAll("\\s+", "");
        String relativePath = "Images" + File.separator + sanitizedHotelName + File.separator + roomNo + sanitizedRoomTypeName;
        String directoryPath = BASE_IMAGE_PATH + File.separator + sanitizedHotelName + File.separator + roomNo + sanitizedRoomTypeName;

        // Kiểm tra và tạo thư mục nếu chưa tồn tại
        File directory = new File(directoryPath);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        // Trả về đường dẫn tuyệt đối để lưu file và đường dẫn tương đối để lưu trong CSDL
        return directory.getAbsolutePath() + File.separator + imageFileName;
    }

    private String getRelativeImagePath(String hotelName, String roomNo, String roomTypeName, String imageFileName) {
        String sanitizedHotelName = hotelName.replaceAll("\\s+", "");
        String sanitizedRoomTypeName = roomTypeName.replaceAll("\\s+", "");
        return "Images" + File.separator + sanitizedHotelName + File.separator + roomNo + sanitizedRoomTypeName + File.separator + imageFileName;
    }

}
