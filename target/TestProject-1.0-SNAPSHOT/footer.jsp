<%-- 
    Document   : footer
    Created on : Oct 26, 2024, 9:25:24 PM
    Author     : Tang Thanh Vui - CE180901
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/footer.css"/>
    </head>
    <body>
        <footer>
            <div class="container">
                <div class="footer-info">
                    <h3>VietHotel Premie</h3>
                    <p>Address: 56 Hai Bà Trưng, Hanoi, Vietnam</p>
                    <p>Email: info@viethotelpremie.vn</p>
                    <p>Phone: +84 123 456 789</p>
                </div>
                <div class="footer-links">
                    <ul>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                </div>
                <div class="newsletter">
                    <h3>Don't miss any updates</h3>
                    <form action="#">
                        <input type="email" placeholder="Your Email">
                        <button>Sign Up Now</button>
                    </form>
                </div>
            </div>
        </footer>
    </body>
</html>
