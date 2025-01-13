<%-- 
    Document   : adminListRooms
    Created on : Nov 3, 2024, 8:40:12 PM
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
                background-color: #f8f9fa;
                color: #333;
            }

            .container {
                max-width: 90%;
                margin: 30px auto;
                padding: 20px;
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #007bff;
            }

            .btn-primary {
                margin-bottom: 10px;
                color: #fff;
                transition: background-color 0.3s ease, box-shadow 0.3s;
                box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
            }

            .btn-primary:hover {
                background-color: #0056b3;
                box-shadow: 0 6px 15px rgba(0, 123, 255, 0.4);
            }

            .table {
                background-color: #ffffff;
                border-radius: 8px;
                overflow: hidden;
            }

            .table thead th {
                background-color: #007bff;
                color: #000;
            }

            .table tbody tr:hover {
                background-color: #e9f5ff;
            }

            .status-indicator {
                font-weight: bold;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .status-available {
                color: #28a745;
                background-color: #eafaf1;
            }

            .status-unavailable {
                color: #dc3545;
                background-color: #fdecea;
            }

            .btn-success, .btn-danger {
                transition: transform 0.2s ease;
                font-size: 0.9em;
                color: #fff;
            }

            .btn-success:hover {
                transform: scale(1.1);
                background-color: #28a745;
            }

            .btn-danger:hover {
                transform: scale(1.1);
                background-color: #c82333;
            }

            .btn-success i, .btn-danger i {
                margin-right: 5px;
            }


            /*Button icon delete and edit*/
            .btn-icon {
                width: 32px;
                height: 32px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                color: #fff;
                font-size: 18px;
                transition: background-color 0.3s, transform 0.2s;
                cursor: pointer;
                margin-bottom: 10px;
            }

            .btn-edit {
                background-color: #ffc107;
            }

            .btn-delete {
                background-color: #dc3545;
            }

            .btn-icon:hover {
                transform: scale(1.1);
            }

            .btn-icon i {
                margin: 0;
            }

        </style>
    </head>
    <body>
        <div class="text-center">
            <!-- Success Message -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">
                    ${successMessage}
                </div>
                <c:remove var="successMessage" scope="session"/>
            </c:if>
            <!-- Success Message -->
            <c:if test="${not empty sessionScope.successMessageRoomAdd}">
                <div class="alert alert-success">
                    ${sessionScope.successMessageRoomAdd}
                </div>
                <c:remove var="successMessageRoomAdd" scope="session"/>
            </c:if>
            <!-- Success Message -->
            <c:if test="${not empty sessionScope.DeleteSuccessFully}">
                <div class="alert alert-success">
                    ${sessionScope.DeleteSuccessFully}
                </div>
                <c:remove var="DeleteSuccessFully" scope="session"/>
            </c:if>
            <!-- Title -->
            <h1>List of Rooms</h1>

            <!-- Product Table -->
            <table class="table table-bordered">
                <tr>
                    <th>Room No</th>
                    <th>Room Type ID</th>
                    <th>Hotel Code</th>
                    <th>Image Background</th>
                    <th>Amenities</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <c:if test="${not empty requestScope.listRoomsAD}">
                    <c:forEach var="room" items="${requestScope.listRoomsAD}">
                        <tr>
                            <td>${room.roomNo}</td>
                            <td>${room.roomTypeID}</td>
                            <td>${room.hotelCode}</td>
                            <td>${room.imageBackground}</td>
                            <td>${room.amenities}</td>
                            <td>${room.available}</td>
                            <td>
                                <a href="adminUpdateRoomServlet?id=${room.roomNo}" class="btn-icon btn-edit">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="adminDeleteRoomServlet?id=${room.roomNo}" onclick="confirmDelete('${room.roomNo}')" class="btn-icon btn-delete">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
        <script>
                                    function confirmDelete(id) {
                                        if (confirm("Are you sure you want to delete the Room " + id + "?")) {
                                            window.location.href = "adminDeleteRoomServlet?id=" + id;
                                        }
                                    }
        </script>
    </body>
</html>
