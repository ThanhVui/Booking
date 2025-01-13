<%-- 
    Document   : header
    Created on : Oct 26, 2024, 9:07:32 PM
    Author     : Tang Thanh Vui - CE180901
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/header.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
        <style>
            html {
                scroll-behavior: smooth;
            }

            .account {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            .account img,
            .account .auth__img {
                height: 46px;
                border-radius: 50%;
                padding-left: 10px
            }

            .auth__img {
                position: relative;
                cursor: pointer;
                display: flex;
                align-items: center;
                width: 100%;
            }

            .dropdown-menu {
                display: none;
                position: absolute;
                top: calc(100% - 1px);
                left: 0;
                background-color: white;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                min-width: 150px;
                z-index: 1;
                padding: 10px 0;
                width: 100%;
            }

            .dropdown-menu a {
                display: block;
                padding: 8px 16px;
                text-decoration: none;
                color: black;
            }

            .dropdown-menu a:hover {
                background-color: #f1f1f1;
            }

            .dropdown-menu a i {
                padding: 0 10px;
            }

            /* Hiệu ứng hover để hiển thị dropdown */
            .auth__img:hover .dropdown-menu {
                display: block;
            }

        </style>
    </head>
    <body>
        <header class="header">
            <div class="container">
                <div class="logo" >
                    <img style="height: 110px; width: 130px; max-height: 250px; max-width: 250px;" src="./Images/Logo/Lovepik_com-401691155-hotel-logo.png" alt="Luxe Hotel">
                </div>
                <nav>
                    <ul>
                        <li><a href="Home.jsp">Home</a></li>
                        <li><a href="#about">About Us</a></li>
                        <li><a href="listRoomServlet?reset=true">Rooms</a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#new">News</a></li>
                        <li><a href="#feedback">Feedback</a></li>
                        <li><a href="#" onclick="window.location.href = 'contact.jsp'">Contact</a></li>
                    </ul>
                </nav>
                <div class="account">
                    <c:choose>
                        <c:when test="${user == null}">
                            <a href="#" class="btn" onclick="window.location.href = 'LoginFinal.jsp'">Sign up</a>
                            <a href="#" class="btn" onclick="window.location.href = 'LoginFinal.jsp'">Log in</a>
                        </c:when>
                        <c:otherwise>
                            <div class="auth__img">
                                <p>${user.getFullName()}</p>
                                <img src="${user.getImageLink() != null ? user.getImageLink() : 'img/empty_avt2.jpg'}" alt="Avatar">

                                <div class="dropdown-menu">
                                    <a href="profileUserServlet"><i class="fa-solid fa-user"></i>Profile</a>
                                    <a href="historyServlet"><i class="fa-solid fa-clock-rotate-left"></i>History</a>
                                    <a href="logoutServlet"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </header>
    </body>
</html>
