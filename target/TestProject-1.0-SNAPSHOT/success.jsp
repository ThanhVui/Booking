<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Guest"%>
<%@page import="dal.PaymentDAO"%>
<%@page import="model.Booking"%>
<%
    String transactionId = request.getParameter("transactionId");
    Guest guest = (Guest) session.getAttribute("user");

    if (guest == null || transactionId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    PaymentDAO dao = new PaymentDAO();
    int guestID = guest.getGuestID();
    Booking booking = dao.getBookingByGuestID(guestID);

    if (booking == null) {
        out.println("<p>No booking found for the provided guest ID. Please contact support.</p>");
        return;
    }

    String roomNo = booking.getRoomNo();
    boolean paymentUpdated = dao.updatePaymentStatus(guestID, true);
    boolean bookingUpdated = dao.updateBookingStatus(guestID, true);
    boolean roomUpdated = dao.updateRoomAvailability(roomNo, false);

    if (!paymentUpdated || !bookingUpdated || !roomUpdated) {
        out.println("<p>Failed to complete the booking process. Please contact support.</p>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Payment Successful</title>
        <link rel="stylesheet" href="CSS/success.css">
    </head>
    <body>
        <div class="container">
            <h1 class="success-title">Payment Completed Successfully!</h1>
            <p class="success-message">Thank you for your payment.</p>
            <p class="thank-you-message">We appreciate your business.</p>
            <a href="Home.jsp" class="home-button">Return to Home</a>
        </div>
    </body>
</html>
