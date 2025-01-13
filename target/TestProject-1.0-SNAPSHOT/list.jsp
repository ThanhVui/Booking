<%-- 
    Document   : list
    Created on : Nov 4, 2024, 9:54:44 PM
    Author     : Nguyen Huy Hoang - CE182102
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guest List</title>
    </head>
    <body>
        <c:if test="${requestScope.error != null}">
            <h2 style="color: red;">${requestScope.error}</h2>
        </c:if>

        <h1>Guest List</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>GuestID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phone Number</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Address</th>
                    <th>ImageLink</th>
                    <th>Provider</th>
                    <th>ProviderUserID</th>
                    <th>CreatedAt</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="guest" items="${requestScope.list}">
                    <tr>
                        <td>${guest.guestID != null ? guest.guestID : "N/A"}</td>
                        <td>${guest.fullName != null ? guest.fullName : "N/A"}</td>
                        <td>${guest.email != null ? guest.email : "N/A"}</td>
                        <td>${guest.password != null ? guest.password : "N/A"}</td>
                        <td>${guest.phoneNumber != null ? guest.phoneNumber : "N/A"}</td>
                        <td>${guest.gender != null ? guest.gender : "N/A"}</td>
                        <td>${guest.DOB != null ? guest.DOB : "N/A"}</td>
                        <td>${guest.address != null ? guest.address : "N/A"}</td>
                        <td>${guest.imageLink != null ? guest.imageLink : "N/A"}</td>
                        <td>${guest.provider != null ? guest.provider : "N/A"}</td>
                        <td>${guest.providerUserID != null ? guest.providerUserID : "N/A"}</td>
                        <td>${guest.createdAt != null ? guest.createdAt : "N/A"}</td>
                        <td>
                          <a href="deleteguest?GuestID=${guest.guestID}">Delete</a>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
