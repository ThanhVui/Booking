<%@page import="model.Guest"%>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Guest guest = (Guest) session.getAttribute("user");
    if (guest == null) {
        response.sendRedirect("LoginFinal.jsp");
        return;
    }
    boolean submitted = request.getAttribute("submitted") != null;
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Payment Page</title>
        <link rel="stylesheet" href="CSS/payment.css">
    </head>
    <body>
        <div class="container">
            <h1 style="color: green;">Payment Page</h1>
            <form id="paymentForm" action="PaymentServlet" method="POST">
                <input type="hidden" name="submitted" value="true">

                <!-- Full Name Field -->
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" value="<%= guest.getFullName() != null ? guest.getFullName() : ""%>" readonly>
                <span id="fullNameError" class="error"><%= (submitted && request.getAttribute("fullNameError") != null) ? request.getAttribute("fullNameError") : ""%></span>

                <!-- Email Field -->
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= guest.getEmail() != null && guest.getEmail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$") ? guest.getEmail() : ""%>" <%= guest.getEmail() != null && guest.getEmail().matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$") ? "readonly" : ""%> required>
                <span id="emailError" class="error"><%= (submitted && request.getAttribute("emailError") != null) ? request.getAttribute("emailError") : ""%></span>

                <!-- Phone Number Field -->
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" value="<%= guest.getPhoneNumber() != null ? guest.getPhoneNumber() : ""%>" required>
                <span id="phoneNumberError" class="error"><%= (submitted && request.getAttribute("phoneNumberError") != null) ? request.getAttribute("phoneNumberError") : ""%></span>

                <!-- Final Price and Discount Message -->
                <div class="price-info" style="text-align: left;">
                    <p><strong>Hotel:</strong>${hotel.hotelName}</p>
                    <p><strong>RoomType:</strong>${roomType.roomType}</p>
                    <p style="font-weight: bold;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : ""%></p>
                    <p style="font-size: 1.2em; font-weight: bold; color: green;">
                        Your current payment is: <fmt:formatNumber value="${roomType.roomPrice * 100}" type="number" maxFractionDigits="3" /> VND
                      
                    </p>
                </div>

                <!-- Submit Button -->
                <button type="submit">Submit Payment</button>
            </form>
        </div>

        <!-- Confirmation Modal -->
        <div id="confirmationModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h3>Is all the information you entered correct?</h3>
                <p><strong>Full Name:</strong> <span id="confirmFullName"></span></p>
                <p><strong>Email:</strong> <span id="confirmEmail"></span></p>
                <p><strong>Phone Number:</strong> <span id="confirmPhone"></span></p>
                <p>The e-ticket/receipt will be sent to your email, and a booking summary will be sent to your phone number.</p>
                <button id="confirmButton" onclick="confirmPayment()">Confirm</button>
                <button id="changeButton" onclick="closeModal()">Go Back</button>
            </div>
        </div>

        <!-- JavaScript for Modal functionality -->
        <script>
            document.getElementById("paymentForm").onsubmit = function (event) {
                event.preventDefault(); // Ngăn không cho form submit ngay lập tức

                // Xóa thông báo lỗi cũ
                clearErrorMessages();

                // Lấy giá trị của các trường
                const fullName = document.getElementById("fullName").value;
                const email = document.getElementById("email").value;
                const phoneNumber = document.getElementById("phoneNumber").value;

                // Kiểm tra tính hợp lệ
                let isValid = true;

                if (!validateName(fullName)) {
                    document.getElementById("fullNameError").innerText = "Full name must contain only letters and spaces.";
                    isValid = false;
                }
                if (!validateEmail(email)) {
                    document.getElementById("emailError").innerText = "Invalid email format. Please enter a valid email.";
                    isValid = false;
                }
                if (!validatePhoneNumber(phoneNumber)) {
                    document.getElementById("phoneNumberError").innerText = "Phone number must start with 0, contain 10-11 digits, and no letters or special characters.";
                    isValid = false;
                }

                // Nếu tất cả thông tin hợp lệ, mở modal xác nhận
                if (isValid) {
                    openModal();
                }
            };

            // Hàm để xóa các thông báo lỗi cũ
            function clearErrorMessages() {
                document.getElementById("fullNameError").innerText = "";
                document.getElementById("emailError").innerText = "";
                document.getElementById("phoneNumberError").innerText = "";
            }

            // Hàm để hiển thị modal xác nhận
            function openModal() {
                document.getElementById("confirmFullName").innerText = document.getElementById("fullName").value;
                document.getElementById("confirmEmail").innerText = document.getElementById("email").value;
                document.getElementById("confirmPhone").innerText = document.getElementById("phoneNumber").value;
                document.getElementById("confirmationModal").style.display = "block";
            }

            // Các hàm validate cho các trường
            function validateName(name) {
                return /^[\p{L} ]+$/u.test(name);
            }




            function validateEmail(email) {
                return /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}$/.test(email);
            }

            function validatePhoneNumber(phone) {
                return /^0\d{9,10}$/.test(phone);
            }

            function closeModal() {
                document.getElementById("confirmationModal").style.display = "none";
            }

            function confirmPayment() {
                closeModal();
                let confirmInput = document.createElement("input");
                confirmInput.type = "hidden";
                confirmInput.name = "confirm";
                confirmInput.value = "true";
                document.getElementById("paymentForm").appendChild(confirmInput);
                document.getElementById("paymentForm").submit();
                window.location.href = 'PaymentServlet';
            }



        </script>
    </body>
</html>
