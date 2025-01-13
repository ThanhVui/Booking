<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Profile</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh; /* Chiều cao toàn màn hình */
                width: 100vw;  /* Chiều rộng toàn màn hình */
                background-image: url('${pageContext.request.contextPath}/Images/MuongThanh.jpeg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                overflow: hidden; /* Loại bỏ scroll nếu có */
                font-family: Arial, sans-serif;
            }

            .update-container {
                width: 450px; /* Tăng chiều rộng để các trường rộng hơn */
                padding: 30px; /* Tăng padding để tạo không gian rộng rãi */
                border-radius: 12px; /* Tăng độ bo tròn góc */
                background-color: rgba(255, 255, 255, 0.95); /* Tăng độ mờ của nền để hòa hợp với nền */
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Đổ bóng mạnh hơn để tách biệt */
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input, select {
                width: 100%;
                height: 45px; /* Đảm bảo chiều cao đồng nhất */
                padding: 10px;
                margin-bottom: 15px; /* Tăng khoảng cách giữa các trường */
                border: 1px solid #ccc; /* Thay đổi màu sắc viền để mềm mại hơn */
                border-radius: 8px; /* Tăng độ bo tròn góc */
                box-sizing: border-box;
                font-size: 1em; /* Tăng kích thước chữ để dễ đọc hơn */
            }

            input[type="submit"] {
                width: 100%;
                height: 50px; /* Tăng chiều cao để tạo cảm giác nút nổi bật hơn */
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 1.1em; /* Tăng kích thước chữ cho nút */
                transition: background-color 0.3s; /* Hiệu ứng mượt khi hover */
            }

            input[type="submit"]:hover {
                background-color: #218838;
            }

            .error {
                color: red;
                font-size: 0.9em;
                margin-bottom: 15px; /* Tạo thêm khoảng cách phía dưới để tách biệt lỗi với các trường khác */
            }

            .update-container h2 {
                text-align: center; /* Căn giữa chữ */
                color: #28a745; /* Màu xanh lá */
margin-bottom: 25px; /* Tăng khoảng cách dưới */
                font-size: 26px; /* Tăng kích thước chữ */
                font-weight: bold; /* Tạo điểm nhấn cho tiêu đề */
            }


        </style>
        <script>
            // Validate Full Name (No numbers allowed)
            function validateFullName(input) {
                const regex = /^[a-zA-Z\s]*$/;
                const errorElement = document.getElementById('fullname-error');
                if (!regex.test(input.value)) {
                    errorElement.textContent = "Full Name must not contain numbers.";
                } else {
                    errorElement.textContent = "";
                }
            }

            // Validate Phone Number (Exactly 10 digits)
            function validatePhone(input) {
                const regex = /^\d{10}$/; // Exactly 10 digits
                const errorElement = document.getElementById('phone-error');
                if (!regex.test(input.value)) {
                    errorElement.textContent = "Phone Number must contain exactly 10 digits.";
                } else {
                    errorElement.textContent = "";
                }
            }

            // Validate DOB (Year between 1900 and 2024, User must be at least 18 years old)
            function validateDOB(input) {
                const dob = new Date(input.value);
                const today = new Date();
                const errorElement = document.getElementById('dob-error');

                // Check if input date is valid
                if (isNaN(dob.getTime())) {
                    errorElement.textContent = "Please enter a valid date.";
                    return;
                }

                let age = today.getFullYear() - dob.getFullYear();
                const monthDiff = today.getMonth() - dob.getMonth();

                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                    age--;
                }

                if (dob.getFullYear() < 1900 || dob.getFullYear() > 2024) {
                    errorElement.textContent = "Year must be between 1900 and 2024.";
                } else if (age < 18) {
                    errorElement.textContent = "You must be at least 18 years old.";
                } else {
                    errorElement.textContent = "";
                }
            }
        </script>
    </head>
    <body>
        <div class="update-container">
            <h2>Update Profile</h2>
            <c:if test="${not empty errorMessage}">
                <p style="color:red; text-align:center;">${errorMessage}</p>
            </c:if>
            <c:if test="${updateSuccess == 'true'}">
                <p style="color:green; text-align:center;">${message}</p>
            </c:if>
            <form action="${pageContext.request.contextPath}/profileUserServlet" method="post">
                <c:choose>
                    <c:when test="${user.email != null}">
<label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="${user.email}" readonly>
                    </c:when>
                    <c:otherwise>
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="">
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${user.phoneNumber != null}">
                        <label for="phone">Phone Number:</label>
                        <input type="text" id="phone" name="phone" value="${user.phoneNumber}" oninput="validatePhone(this)">
                        <div id="phone-error" class="error"></div>
                    </c:when>
                    <c:otherwise>
                        <label for="phone">Phone Number:</label>
                        <input type="text" id="phone" name="phone" value="" oninput="validatePhone(this)">
                        <div id="phone-error" class="error"></div>
                    </c:otherwise>
                </c:choose>

                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required value="${user.fullName}" oninput="validateFullName(this)">
                <div id="fullname-error" class="error"></div>

                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" value="${user.DOB != null ? user.DOB : ''}" onchange="validateDOB(this)">
                <div id="dob-error" class="error"></div>

                <c:choose>
                    <c:when test="${user.gender != null}">
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender">
                            <option value="Male" <c:if test="${user.gender == 'Male'}">selected</c:if>>Male</option>
                            <option value="Female" <c:if test="${user.gender == 'Female'}">selected</c:if>>Female</option>
                            <option value="Other" <c:if test="${user.gender == 'Other'}">selected</c:if>>Other</option>
                            </select>
                    </c:when>
                    <c:otherwise>
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender">
                            <option value="" selected disabled>Select your gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${user.password != null}">
                        <label for="password">Password:</label>
<input type="password" id="password" name="password" value="${user.password}">
                    </c:when>
                    <c:otherwise>
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" value="">
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${user.address != null}">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="${user.address}">
                    </c:when>
                    <c:otherwise>
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="">
                    </c:otherwise>
                </c:choose>

                <input type="submit" value="Update Profile">
            </form>

            <%-- Thông báo cập nhật --%>
            <%
                String updateSuccess = (String) request.getAttribute("updateSuccess");
                if ("true".equals(updateSuccess)) {
            %>
            <p style="color:green; text-align:center;">Profile updated successfully!</p>
            <%
            } else if ("false".equals(updateSuccess)) {
            %>
            <p style="color:red; text-align:center;">Profile update failed. Please try again.</p>
            <%
                }
            %>
        </div> 
    </body>
</html>