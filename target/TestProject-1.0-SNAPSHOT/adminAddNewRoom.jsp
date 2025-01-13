<%-- 
    Document   : adminAddNewRoom
    Created on : Nov 3, 2024, 8:58:16 PM
    Author     : Tang Thanh Vui - CE180901
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
        <style>
            body {
                background: #ffffff;
                color: #333;
            }

            .container {
                max-width: 700px;
                margin: 50px auto;
                padding: 30px;
                background: linear-gradient(135deg, #ffffff, #e0f7ff);
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
                border-top: 5px solid #007bff;
                transition: transform 0.3s ease-in-out, box-shadow 0.3s;
            }

            .container:hover {
                transform: scale(1.02);
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #0056b3;
                font-weight: bold;
                font-size: 1.8em;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
            }

            .form-group label {
                font-weight: bold;
                color: #333;
                font-size: 1.1em;
            }

            .form-control {
                margin-bottom: 15px;
                border-radius: 6px;
                border: 1px solid #ced4da;
                transition: box-shadow 0.3s, border-color 0.3s;
                background-color: #f9fcff;
            }

            .form-control:focus {
                box-shadow: 0 0 10px rgba(38, 143, 255, 0.5);
                border-color: #007bff;
                transform: scale(1.01);
            }

            .btn-primary {
                background-color: #007bff;
                border-color: #007bff;
                transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s;
                box-shadow: 0 4px 10px rgba(0, 123, 255, 0.3);
            }

            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #004085;
                transform: scale(1.05);
                box-shadow: 0 6px 15px rgba(0, 123, 255, 0.4);
            }

            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
                margin-left: 10px;
                transition: background-color 0.3s ease, border-color 0.3s ease, transform 0.3s;
                box-shadow: 0 4px 10px rgba(220, 53, 69, 0.3);
            }

            .btn-danger:hover {
                background-color: #c82333;
                border-color: #bd2130;
                transform: scale(1.05);
                box-shadow: 0 6px 15px rgba(220, 53, 69, 0.4);
            }

            .alert {
                margin-bottom: 20px;
                border-radius: 5px;
                color: #721c24;
                background-color: #f8d7da;
                border-color: #f5c6cb;
                font-size: 1.05em;
            }

            input[type="file"] {
                padding: 3px;
                background-color: #f1f3f5;
                border: 1px solid #ced4da;
                transition: box-shadow 0.3s, border-color 0.3s;
            }

            input[type="file"]:focus {
                box-shadow: 0 0 6px rgba(38, 143, 255, 0.5);
                border-color: #007bff;
            }

            button[type="submit"], .btn-danger {
                font-size: 16px;
                width: 48%;
                padding: 10px;
                color: #fff;
            }

            button[type="submit"] {
                background-color: #007bff;
                border: none;
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <!-- Title -->
            <h2>Create New Room</h2>
            <c:if test="${not empty sessionScope.successMessageRoomAddExist}">
                <div class="alert alert-danger">
                    ${sessionScope.successMessageRoomAddExist}
                </div>
                <c:remove var="successMessageRoomAddExist" scope="session"/>
            </c:if>
            <!-- Product Form -->
            <form action="adminAddNewRoomServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="RoomNo">Room Number</label>
                    <input type="text" class="form-control" id="RoomNo" name="RoomNo" required>
                </div>
                <div class="form-group" style="margin-bottom: 10px;">
                    <label for="RoomType">Room Type</label>
                    <select class="form-control" id="RoomType" name="RoomType" required>
                        <c:forEach items="${requestScope.listRoomTypes}" var="rt">
                            <option value="1">${rt.roomType}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group" style="margin-bottom: 10px;">
                    <label for="HotelCode">Hotel Code</label>
                    <select class="form-control" id="HotelCode" name="HotelCode" required>
                        <c:forEach items="${requestScope.listHotels}" var="ht">
                            <option value="1">${ht.hotelName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="ImageBackground">Main Image Background</label>
                    <input type="file" class="form-control" id="ImageBackground" name="ImageBackground" accept="image/*" required>
                </div>
                <div class="form-group">
                    <label for="RoomImages1">Image Room Detail 1</label>
                    <input type="file" class="form-control" id="RoomImages1" name="RoomImages" accept="image/*" required>
                </div>
                <div class="form-group">
                    <label for="RoomImages2">Image Room Detail 2</label>
                    <input type="file" class="form-control" id="RoomImages2" name="RoomImages" accept="image/*" required>
                </div>
                <div class="form-group">
                    <label for="RoomImages3">Image Room Detail 3</label>
                    <input type="file" class="form-control" id="RoomImages3" name="RoomImages" accept="image/*" required>
                </div>
                <div class="form-group">
                    <label for="Amenities">Amenities</label>
                    <input type="text" class="form-control" id="Amenities" name="Amenities" required>
                </div>
                <button type="submit" class="btn btn-primary" name="AddRoom">Add Room</button>
            </form>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
