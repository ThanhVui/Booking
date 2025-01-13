<%-- 
    Document   : history
    Created on : Nov 2, 2024, 11:34:59 AM
    Author     : Nguyen Huy Hoang - CE182102
--%>

<%@page import="model.Hotel"%>
<%@page import="dal.HotelDAO"%>
<%@page import="model.Room"%>
<%@page import="dal.RoomDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>History Booking</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">History Booking</h2>

            <!-- Thanh tìm kiếm -->
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search booking...">
                        <button class="btn btn-primary">
                            <i class="fas fa-search"></i> Search
                        </button>
                    </div>
                </div>
            </div>

            <!-- Bảng hiển thị hóa đơn -->
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Invoice No</th>
                            <th>Guest Name</th>
                            <th>Hotel Name</th>
                            <th>Room</th>
                            <th>Total Amount</th>
                            <th>Payment Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="bill" items="${bills}">
                            <c:if test="${not empty bills}">
                                <tr>
                                    <td>${bill.invoiceNo}</td>
                                    <td>${bill.getGuest().fullName}</td>
                                    <td>${bill.getHotel(bill.getRoom(bill.getBooking().roomNo).hotelCode).hotelName}</td>
                                    <td>${bill.getBooking().roomNo}</td>
                                    <td><fmt:formatNumber value="${bill.totalAmount}" type="number" maxFractionDigits="3" />.000 VNĐ</td>
                                    <td>${bill.paymentDate}</td>
                                    <c:choose>
                                        <c:when test="${bill.paymentStatus == false}">
                                            <td><span class="badge bg-danger">Not checked in</span></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><span class="badge bg-success">Checked out</span></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Phân trang -->
            <!--            <nav aria-label="Page navigation" class="mt-4">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Trước</a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Sau</a>
                                </li>
                            </ul>
                        </nav>-->
        </div>
    </body>
</html>
