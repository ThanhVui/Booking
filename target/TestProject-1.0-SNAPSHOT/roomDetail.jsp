<%-- 
    Document   : roomDetail
    Created on : Oct 28, 2024, 3:41:19 PM
    Author     : Nguyen Huy Hoang - CE182102
--%>

<%@page import="dal.GuestDAO"%>
<%@page import="model.Guest"%>
<%@page import="model.ReviewHotel"%>
<%@page import="java.util.List"%>
<%@page import="dal.ReviewHotelDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${hotel.hotelName}</title>

        <link rel="stylesheet" href="CSS/inmain.css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>

        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
            }

            .containers {
                width: 90%;
                margin: 0 auto;
            }

            .container {
                padding: 0;
            }

            .containers h2 {
                font-size: 22px;
                margin-bottom: 1rem;
            }

            .btn {
                background-color: #d4af37;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .btn:first-child {
                background-color: #fff;
                color: #000;
                transition: color 0.3s ease;
            }

            .btn:hover {
                background-color: #b8962e;
            }

            .btn:first-child:hover {
                background-color: #fff;
                color: #b8962e;
            }

            .search-section {
                padding: 1.8rem 0;
                background-color: #fff;
            }

            .search-section form {
                display: flex;
                justify-content: space-between;
            }

            .search-section input,
            .search-section select {
                padding: 0.5rem;
                margin-right: 10px;
                flex: 1;
            }

            .search-section input:first-child {
                flex: 2;
            }

            .search-section button {
                background-color: #d4af37;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                transition: background-color 0.3s ease;
            }

            .search-section button:hover {
                background-color: #b8962e;
                color: #fff;
                transition: color 0.3s ease;
            }

            /*            .info-hotel__layout {
                            display: flex;
                            align-items: center;
                        }*/

            .hotel-info {
                padding: 2rem 0;
                background-color: #fff;
            }

            .hotel-details {
                display: flex;
                justify-content: space-between;
            }

            .hotel-details img {
                /*flex: 2;*/
                border-radius: 12px;

            }

            .hotel-description {
                /*flex: 1;*/
                margin-top: 16px;
                padding: 0 24px;
                display: flex;
                justify-content: space-between;
            }

            .hotel-description__left {
                flex: 1;
                justify-items: flex-start;
            }

            .hotel-description__left h1 {
                font-size: 24px;
            }

            .hotel-description__left p {
                font-size: 16px;
            }

            .hotel-description__right {
                flex: 1;
                justify-items: flex-end;
            }

            .hotel-description__right p {
                margin-bottom: 10px;
                font-size: 18px;
            }

            .hotel-description p {
                /*margin-bottom: 1rem;*/
            }

            .overview {
                padding: 2rem 0;
            }

            .amenities {
                padding: 2rem 0;
            }

            .amenities ul {
                list-style-type: none;
            }

            .amenities li {
                padding: 0.5rem 0;
            }

            .similar-hotels {
                padding: 2rem 0;
            }

            .hotel-grid {
                display: flex;
                justify-content: space-between;
            }

            .hotel-card {
                width: 45%;
                background-color: white;
                padding: 1rem;
                text-align: center;
                border: 1px solid #ddd;
                margin: 0 0.5rem;
            }

            .hotel-card img {
                width: 100%;
                height: auto;
            }

            .hotel-card p {
                margin: 1rem 0;
            }

            /* Footer */
            footer {
                background-color: #333;
                color: #fff;
                padding: 50px 0;
            }

            footer .container {
                display: flex;
                justify-content: space-between;
                gap: 20px;
            }

            .footer-info {
                flex: 1;
            }

            .footer-info h3 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .footer-info p {
                font-size: 16px;
            }

            .footer-links ul {
                list-style: none;
                padding: 0;
            }

            .footer-links ul li {
                margin-bottom: 10px;
            }

            .footer-links ul li a {
                color: #fff;
                text-decoration: none;
                transition: color 0.3s ease;
            }

            .footer-links ul li a:hover {
                color: #d4af37;
            }

            .newsletter h3 {
                font-size: 20px;
                margin-bottom: 10px;
            }

            .newsletter form {
                display: flex;
                gap: 10px;
            }

            .newsletter input {
                padding: 10px;
                border: none;
                border-radius: 5px;
                flex: 1;
            }

            .newsletter button {
                padding: 10px 20px;
                background-color: #d4af37;
                border: none;
                color: #fff;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .newsletter button:hover {
                background-color: #b8962e;
            }

            .carousel {
                position: relative;
                width: 100%;
                height: 70vh;
                margin: auto;
                border-radius: 26px;
                overflow: hidden;
            }

            .carousel-images {
                display: flex;
                height: 70vh;
                transition: transform 0.5s ease-in-out;
            }

            .carousel-item {
                min-width: 100%;
                transition: opacity 0.5s;
            }

            .prev-btn, .next-btn {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                background-color: rgba(0, 0, 0, 0);
                color: white;
                font-size: 26px;
                border: none;
                padding: 20px;
                cursor: pointer;
                z-index: 10;
            }

            .prev-btn {
                left: 0;
            }

            .next-btn {
                right: 0;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin-left: 5px;
                margin-right: 5px;
                padding-bottom: 12px;
            }

            .col {
                padding-left: 4px;
                padding-right: 4px;
            }

            .l-3 {
                flex: 0 0 25%;
                max-width: 25%;
            }

            .l-4 {
                flex: 0 0 33.33333%;
                max-width: 33.33333%;
                line-height: 44px;
            }

            .l-9 {
                flex: 0 0 75%;
                max-width: 75%;
            }

            .row l-4 span {
                padding-left: 5px;
            }

            .comment-section {
                margin: 2rem auto;
            }

            .comment-section h2 {
                padding-bottom: 5px
            }

            .comment-list {
                max-height: 400px; /* Chiều cao tối đa cho danh sách bình luận */
                overflow-y: auto;  /* Kích hoạt thanh cuộn dọc */
                padding-right: 10px; /* Tạo khoảng cách cho thanh cuộn */
            }

            /* Tùy chỉnh thêm để giữ giao diện đẹp */
            .comment-wrp {
                border-bottom: 1px solid #ddd;
                padding: 10px 0;
            }

            .comment-wrp:last-child {
                border-bottom: none;
            }

        </style>

        <script>
            let currentIndex = 0;

            function showSlide(index) {
                const slides = document.querySelectorAll('.carousel-item');
                if (index >= slides.length) {
                    currentIndex = 0;
                } else if (index < 0) {
                    currentIndex = slides.length - 1;
                } else {
                    currentIndex = index;
                }
                const offset = -currentIndex * 100;
                document.querySelector('.carousel-images').style.transform = `translateX(${offset}%)`;
            }

            function nextSlide() {
                showSlide(currentIndex + 1);
            }

            function prevSlide() {
                showSlide(currentIndex - 1);
            }

            showSlide(currentIndex);

        </script>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <section class="hotel-info">
            <div class="containers info-hotel__layout">
                <div class="carousel">
                    <div class="carousel-images">
                        <img src="${sessionScope.room.imageBackground}" alt="Khách sạn Riva 1" class="carousel-item active">
                    </div>
                    <button class="prev-btn" onclick="prevSlide()">&#10094;</button>
                    <button class="next-btn" onclick="nextSlide()">&#10095;</button>
                </div>
                <c:set var="roomPrice" value="${roomType.roomPrice * 100}" />
                <div class="hotel-description">
                    <div class="hotel-description__left">
                        <h1>${hotel.hotelName}</h1>
                        <p>${hotel.address}</p>
                        <p>${roomType.roomType}</p>
                    </div>
                    <div class="hotel-description__right">
                        <p><fmt:formatNumber value="${roomPrice}" type="number" maxFractionDigits="3" /> VNĐ/Night</p>
                        <button onclick="window.location.href = 'payment.jsp'" class="btn">Booking Room</button>
                    </div>
                </div>
            </div>
        </section>

        <section class="overview">
            <div class="containers">
                <h2>Overview</h2>
                <p>${roomType.roomDescription}</p>
            </div>
        </section>

        <section class="amenities">
            <div class="containers">
                <h2>Hotel Amenities</h2>
                <div class="row" style="padding-top: 10px">
                    <div class="col l-3" style="font-weight: bold">
                        <p>Common Amenities</p>
                    </div>
                    <div class="col l-9" style="border-bottom: 1px solid #ddd">
                        <div class="row">
                            <div class="col l-4">
                                <i class="fa-solid fa-wifi"></i>
                                <span>Wifi</span>
                            </div>
                            <div class="col l-4">
                                <i class="fa-solid fa-elevator"></i>
                                <span>Elevator</span>
                            </div>
                            <div class="col l-4">
                                <i class="fa-solid fa-person-swimming"></i>
                                <span>Swimming Pool</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col l-3" style="font-weight: bold">
                        <p>Room Amenities</p>
                    </div>
                    <div class="col l-9" style="border-bottom: 1px solid #ddd">
                        <div class="row">
                            <div class="col l-4">
                                <i class="fa-solid fa-bath"></i>
                                <span>Bathtub</span>
                            </div>
                            <div class="col l-4">
                                <i class="fa-solid fa-tv"></i>
                                <span>TV</span>
                            </div>
                            <div class="col l-4">
                                <i class="fa-solid fa-phone"></i>
                                <span>Telephone</span>
                            </div>
                            <div class="col l-4">
                                <i class="fa-solid fa-person"></i>
                                <span>Personal Hygiene Items</span>
                            </div>
                            <div class="col l-4">
                                <i class="fa-solid fa-mug-hot"></i>
                                <span>Coffee</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col l-3" style="font-weight: bold">
                        <p>Dining</p>
                    </div>
                    <div class="col l-9" style="border-bottom: 1px solid #ddd">
                        <div class="row">
                            <div class="col l-4">
                                <i class="fa-solid fa-utensils"></i>
                                <span>Restaurant</span>
                            </div>
                            <div class="col l-4">
                                <i class="fa-solid fa-champagne-glasses"></i>
                                <span>Bar</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col l-3" style="font-weight: bold">
                        <p>Transport</p>
                    </div>
                    <div class="col l-9" style="border-bottom: 1px solid #ddd">
                        <div class="row">
                            <div class="col l-4">
                                <i class="fa-solid fa-square-parking"></i>
                                <span>Parking Lot</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section class="mapAddress" style="padding: 32px 0">
            <div class="containers">
                <div class="infoAddress">

                </div>

                <div class="map">
                    <iframe src="${hotel.addressURL}" 
                            width="100%" height="450" style="border:0; display: inline-block;" 
                            allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>

            </div>
        </section>

        <!--        <section class="similar-hotels">
                    <div class="containers">
                        <h2>Các khách sạn tương tự</h2>
                        <div class="hotel-grid">
                            <div class="hotel-card">
                                <img src="https://www.hoteljob.vn/files/Pic/Th%C3%A1ng%204/Khach-san-la-gi-01.jpg" alt="Khách sạn">
                                <p>Khách sạn Vũng Tàu</p>
                                <button class="btn">Đặt ngay</button>
                            </div>
                            <div class="hotel-card">
                                <img src="https://www.hoteljob.vn/files/Pic/Th%C3%A1ng%204/Khach-san-la-gi-01.jpg" alt="Khách sạn">
                                <p>Khách sạn Romance</p>
                                <button class="btn">Đặt ngay</button>
                            </div>
                            <div class="hotel-card">
                                <img src="https://www.hoteljob.vn/files/Pic/Th%C3%A1ng%204/Khach-san-la-gi-01.jpg" alt="Khách sạn">
                                <p>Khách sạn Romance</p>
                                <button class="btn">Đặt ngay</button>
                            </div>
                        </div>
                    </div>
                </section>-->
        <style>
            /* Dropdown button style */
            .dot-button {
                background: none;
                border: none;
                font-size: 24px;
                cursor: pointer;
                color: #333;
            }

            /* Dropdown content style */
            .dropdown-content {
                display: none; /* Hidden by default */
                position: absolute;
                background-color: #f9f9f9;
                min-width: 100px;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
                border-radius: 5px;
            }

            /* Dropdown items */
            .dropdown-content button {
                background: none;
                border: none;
                color: #333;
                padding: 10px;
                width: 100%;
                text-align: left;
                cursor: pointer;
            }

            .dropdown-content button:hover {
                background-color: #ddd;
            }

            /* Show dropdown on active */
            .dropdown.active .dropdown-content {
                display: block;
            }

            /* Styling for stars */
            .star {
                color: #ccc; /* Default star color */
                font-size: 20px;
            }

            .star.filled {
                color: #FFD700; /* Gold color for filled stars */
            }
        </style>

        <script>
            // Toggle dropdown visibility
            function toggleDropdown(event) {
                event.stopPropagation();
                const dropdown = event.currentTarget.nextElementSibling;

                // Đóng tất cả các dropdown khác
                document.querySelectorAll(".dropdown-content").forEach((content) => {
                    if (content !== dropdown) {
                        content.classList.remove("show-dropdown");
                    }
                });

                // Bật hoặc tắt dropdown hiện tại
                dropdown.classList.toggle("show-dropdown");
            }

// Đóng menu khi nhấp bên ngoài
            document.addEventListener("click", function (event) {
                if (!event.target.closest('.dropdown')) {
                    document.querySelectorAll(".dropdown-content").forEach((dropdown) => {
                        dropdown.classList.remove("show-dropdown");
                    });
                }
            });

        </script>

        <div class="comment-section containers" style="padding-top: 2rem">
            <h2>Welcome,  ${user.fullName}!  Here are the latest reviews:</h2>
            <% GuestDAO gd = new GuestDAO();%>

            <div class="comment-list">
                <c:if test="${not empty reviews}">
                    <c:forEach var="review" items="${reviews}">
                        <div class="comment-wrp" id="review-${review.reviewHotelID}">
                            <div class="comment container">
                                <div class="c-user">
                                    <div class="header-row">
                                        <p class="usr-name">${review.getObjGuest().fullName}</p>
                                    </div>

                                    <div class="" style="display: flex ">
                                        <p class="cmnt-at">${review.reviewDate}</p>

                                        <div class="rating">
                                            <c:forEach var="i" begin="1" end="5">
                                                <span class="star ${review.starRating >= i ? 'filled' : ''}">&#9733;</span>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <p class="c-text" style="padding-left: 10px">
                                        <span class="c-body">Comment: ${review.comment}</span>
                                    </p>
                                </div>

                                <c:if test="${review.guestID == sessionScope.user.guestID}">
                                    <div class="action-buttons">
                                        <!--<a onclick="showEditForm(${review.reviewHotelID}, '${review.comment}')" class="edit-btn">Edit</a>-->
                                        <a href="#" onclick="deleteReview(${review.reviewHotelID})" class="delete-btn">Delete</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>

        <!-- Form ẩn để chỉnh sửa bình luận -->
        <div id="editForm" style="display: none;">
            <form action="roomDetail" method="post">
                <input type="hidden" name="id" id="editReview">
                <textarea name="comment" id="editComment" class="cmnt-input" required></textarea>
                <button type="submit" class="btn">Submit</button>
                <button type="button" class="btn" onclick="hideEditForm()">Cancel</button>
            </form>
        </div>

        <!-- Khu vực thêm đánh giá mới -->
        <form action="roomDetail" method="post">
            <input type="hidden" name="action" value="addReview">
            <input type="hidden" name="hotelCode" value="${hotel.hotelCode}">
            <input type="hidden" name="guestID" value="${sessionScope.user.guestID}">

            <div class="reply-input container">
                <img src="${user.getImageLink() != null ? user.getImageLink() : 'img/empty_avt2.jpg'}" alt="User Image" class="usr-img">
                <div class="rating-section">
                    <label for="starRating">Rate this hotel:</label>
                    <div class="star-rating">
                        <input type="radio" id="star5" name="starRating" value="5" required>
                        <label for="star5" class="star">&#9733;</label>
                        <input type="radio" id="star4" name="starRating" value="4" required>
                        <label for="star4" class="star">&#9733;</label>
                        <input type="radio" id="star3" name="starRating" value="3" required>
                        <label for="star3" class="star">&#9733;</label>
                        <input type="radio" id="star2" name="starRating" value="2" required>
                        <label for="star2" class="star">&#9733;</label>
                        <input type="radio" id="star1" name="starRating" value="1" required>
                        <label for="star1" class="star">&#9733;</label>
                    </div>
                </div>
                <textarea name="comment" class="cmnt-input" placeholder="Add a comment..." required></textarea>
                <button type="submit" class="btn">Send</button>
            </div>
        </form>

        <!-- JavaScript để xử lý form chỉnh sửa -->
        <script>
            function showEditForm(reviewID, currentComment) {
                console.log(123);
//                document.getElementById("editReviewID").value = reviewID;
//                document.getElementById("editComment").value = currentComment;
                document.getElementById("editForm").style.display = "block";
            }

            function hideEditForm() {
                document.getElementById("editForm").style.display = "none";
            }
        </script>
        <script>
            function deleteReview(reviewID) {
                if (confirm("Are you sure you want to delete this comment?")) {
                    window.location.href = `deleteReviewServlet?id=` + reviewID;
                }
            }
        </script>


        <style>
            .comment.container {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin-bottom: 15px;
            }
            .c-user {
                flex: 1;
            }
            .header-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 5px;
            }
            .rating {
                display: inline-flex;
                margin-left: 20px;
            }
            .cmnt-at {
                margin: 5px 0;
                font-size: 0.9em;
                color: gray;
            }
            .c-text {
                margin-top: 5px;
            }
            .action-buttons {
                display: flex;
                flex-direction: column;
                align-items: flex-end;
            }
            .edit-btn {
                margin-bottom: 5px;
                text-decoration: none;
            }
            .delete-btn {
                color: red;
                text-decoration: none;
            }
            .comment-list {
                max-height: 400px;
                overflow-y: auto;
            }
            .reply-input.container {
                display: flex;
                align-items: flex-start;
                gap: 15px;
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
                width: 95%;
                margin-left: auto;
                margin-right: auto;
                box-sizing: border-box;
            }
            .usr-img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                object-fit: cover;
            }
            .rating-section {
                display: flex;
                flex-direction: column;
                gap: 10px;
                font-size: 16px;
                color: #333;
            }
            .star-rating {
                display: flex;
                flex-direction: row-reverse; /* Đảo ngược thứ tự */
                gap: 5px;
                font-size: 25px;
            }
            .star-rating input[type="radio"] {
                display: none;
            }
            .star-rating .star {
                cursor: pointer;
                color: #ccc;
                transition: color 0.3s ease;
            }
            .star-rating input[type="radio"]:checked ~ label.star,
            .star-rating label.star:hover,
            .star-rating label.star:hover ~ label.star {
                color: #FFD700;
            }
            .cmnt-input {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 16px;
                margin-top: 10px;
                transition: border-color 0.3s ease;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.05);
                resize: vertical;
            }
            .cmnt-input:focus {
                border-color: #007bff;
                outline: none;
            }
            .btn {
                padding: 10px 20px;
                color: #fff;
                border: none;
                border-radius: 50px;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.3s ease;
                align-self: flex-end;
                margin-top: 10px;
                margin-left: auto;
            }
            .btn:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
            }
            #editForm {
                display: flex;
                flex-direction: column;
                gap: 10px;
                background-color: #f9f9f9;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 600px;
                margin: 20px auto;
            }
        </style>

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <script src="JS/app.js"></script>
    </body>
</html>
