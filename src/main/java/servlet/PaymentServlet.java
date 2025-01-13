package servlet;

// Các thư viện cần thiết cho servlet
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Các thư viện cho xử lý ngày và UUID
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

// Import các lớp liên quan trong mô hình và DAO
import model.Guest;
import model.Booking;
import dal.PaymentDAO;
import dal.RoomTypeDAO;
import java.text.NumberFormat;
import java.util.Locale;
import model.Room;
import model.RoomPriceDetails;
import model.RoomType;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    private PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String transactionId = UUID.randomUUID().toString();
        session.setAttribute("transactionId", transactionId);
        response.sendRedirect("qrPayment.jsp");
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Guest guest = (Guest) session.getAttribute("user");
        Room room = (Room) session.getAttribute("room");
        

        if (guest == null) {
            response.sendRedirect("LoginFinal.jsp");
            return;
        }
        try {
            // Lấy thông tin Booking từ DAO
            Booking bookingDetails = paymentDAO.getBookingByGuestID(guest.getGuestID());

            if (bookingDetails == null) {
                request.setAttribute("errorMessage", "Booking details not found. Please try again.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            // Lấy các giá trị roomNo, checkInDate, và checkOutDate từ đối tượng bookingDetails
            String roomNo = bookingDetails.getRoomNo();
            Date checkInDate = bookingDetails.getCheckInDate();
            Date checkOutDate = bookingDetails.getCheckOutDate();

            // Kiểm tra nếu checkInDate và checkOutDate không phải null
            if (checkInDate != null && checkOutDate != null) {
                long stayDays = ChronoUnit.DAYS.between(checkInDate.toLocalDate(), checkOutDate.toLocalDate());

                if (stayDays <= 0) {
                    request.setAttribute("errorMessage", "Check-out date must be after check-in date.");
                    request.getRequestDispatcher("payment.jsp").forward(request, response);
                    return;
                }

                // Lấy giá phòng và chiết khấu từ DAO
                RoomPriceDetails priceDetails = paymentDAO.getRoomPriceDetails(roomNo, checkInDate);
                if (priceDetails == null) {
                    request.setAttribute("errorMessage", "Room details not found. Please try again.");
                    request.getRequestDispatcher("payment.jsp").forward(request, response);
                    return;
                }

                RoomTypeDAO rtd = new RoomTypeDAO();
                Room r = (Room) session.getAttribute("room");
                RoomType rt = rtd.selectRoomTypeByID(r.getRoomTypeID());
                    
                // Tính FinalPrice
                float finalPrice;
                if (priceDetails.isDiscounted()) {
                    // Có giảm giá
                    float discountedPrice = (float) (rt.getRoomPrice() - (rt.getRoomPrice() * priceDetails.getDiscountValue() / 100));
                    finalPrice = discountedPrice * stayDays;

                    // Loại bỏ phần thập phân trong giá trị phần trăm
                    int discountValue = (int) priceDetails.getDiscountValue();
                    request.setAttribute("message", "Congratulations, you received voucher: " + priceDetails.getDiscountName() + " and got " + discountValue + "% discount on default room price!");
                } else {
                    // Không có giảm giá
                    finalPrice = (float) (rt.getRoomPrice() * stayDays);
                    request.setAttribute("message", "Congratulations, your room is now discounted. The default price is: " + rt.getRoomPrice());
                }

                // Định dạng `finalPrice` với dấu chấm phân cách hàng nghìn
                NumberFormat currencyFormatter = NumberFormat.getNumberInstance(Locale.GERMANY); // Định dạng theo chuẩn Đức để sử dụng dấu chấm
                String formattedPrice = currencyFormatter.format(finalPrice) + " VND";
                request.setAttribute("formattedFinalPrice", formattedPrice);

                // In log để kiểm tra giá trị `finalPrice` và `formattedPrice`
                System.out.println("Final Price: " + finalPrice);
                System.out.println("Formatted Price: " + formattedPrice);

                // Chỉ chuyển hướng đến trang QR nếu xác nhận
                if ("true".equals(request.getParameter("confirm"))) {
                    String transactionId = UUID.randomUUID().toString();
                    session.setAttribute("transactionId", transactionId);
                    response.sendRedirect("qrPayment.jsp");
                } else {
                    // Trả về trang payment.jsp để hiển thị kết quả nếu không xác nhận
                    request.getRequestDispatcher("payment.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("errorMessage", "Invalid check-in or check-out date.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while retrieving booking details. Please try again.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }

    // Phương thức xác thực dữ liệu đầu vào
    private boolean validateInput(String fullName, String email, String phone) {
        return validateName(fullName) && validateEmail(email) && validatePhoneNumber(phone);
    }

    // Xác thực tên (chỉ chứa chữ cái và khoảng trắng, không cho phép chữ số)
    private boolean validateName(String name) {
        return name != null && name.matches("^[\\p{L} ]+$");
    }

    // Xác thực định dạng email (phải chứa @ và một tên miền hợp lệ sau dấu chấm)
    private boolean validateEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,6})$");
    }

    // Xác thực số điện thoại (phải bắt đầu bằng 0, có từ 10 đến 11 chữ số, không chứa chữ cái hoặc ký tự đặc biệt)
    private boolean validatePhoneNumber(String phone) {
        return phone != null && phone.matches("^0\\d{9,10}$");
    }
}
