 <%-- 
    Document   : listroom
    Created on : Oct 6, 2024, 6:10:45 PM
    Author     : Tang Thanh Vui - CE180901
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Rooms Of Hotel Page</title>
        <link rel="stylesheet" href="CSS/listroom.css"/>
    </head>
    <body>
        <!-- Navigation Bar -->
        <jsp:include page="header.jsp"/>

        <div class="search-bar">
            <div class="search-item location">
                <label for="place" id="checkout-label-place" class="placeholder-label-place">Place </label>
                <select name="destination" id="destination">
                    <option value="" disabled selected>Destination</option>
                    <option value="Thanh pho Can Tho" ${sessionScope.destinationSearchBar == 'Ngo Quyen, Tan An, Ninh Kieu, TP Can Tho' ? 'selected' : ''}>Ngo Quyen, Tan An, Ninh Kieu, TP Can Tho</option>
                    <option value="Nam Ky Khoi Nghia, phuong Tan An, quan Ninh Kieu, Can Tho" ${sessionScope.destinationSearchBar == 'Nam Ky Khoi Nghia, phuong Tan An, quan Ninh Kieu, Can Tho' ? 'selected' : ''}>Ngo Quyen, Tan An, Ninh Kieu, TP Can Tho</option>
                    <option value="Duong Chau Van Liem, Can Tho" ${sessionScope.destinationSearchBar == 'Duong Chau Van Liem, Can Tho' ? 'selected' : ''}>Duong Chau Van Liem, Can Tho</option>
                    <option value="Con Cai Khe, Phuong Cai Khe, Cai Khe, Ninh Kieu, Thanh pho Can Tho" ${sessionScope.destinationSearchBar == 'Con Cai Khe, Phuong Cai Khe, Cai Khe, Ninh Kieu, Thanh pho Can Tho' ? 'selected' : ''}>Con Cai Khe, Phuong Cai Khe, Cai Khe, Ninh Kieu, Thanh pho Can Tho</option>
                    <option value="Hung Vuong, Ninh Kieu District, Can Tho" ${sessionScope.destinationSearchBar == 'Hung Vuong, Ninh Kieu District, Can Tho' ? 'selected' : ''}>Hung Vuong, Ninh Kieu District, Can Tho</option>
                    <option value="Xuan Khanh Ward, Ninh Kieu District, Xuan Khanh, Ninh Kieu, TP Can Tho" ${sessionScope.destinationSearchBar == 'Xuan Khanh Ward, Ninh Kieu District, Xuan Khanh, Ninh Kieu, TP Can Tho' ? 'selected' : ''}>Xuan Khanh Ward, Ninh Kieu District, Xuan Khanh, Ninh Kieu, TP Can Tho</option>
                    <option value="Khu dan cu Long Thinh phuong Phu Thu, quan Cai Rang, Can Tho" ${sessionScope.destinationSearchBar == 'Khu dan cu Long Thinh phuong Phu Thu, quan Cai Rang, Can Tho' ? 'selected' : ''}>Khu dan cu Long Thinh phuong Phu Thu, quan Cai Rang, Can Tho</option>
                    <option value="Tran Quang Khai, Cai Khe, Ninh Kieu, Can Tho, Cai Khe, Ninh Kieu, Thanh pho Can Tho" ${sessionScope.destinationSearchBar == 'Tran Quang Khai, Cai Khe, Ninh Kieu, Can Tho, Cai Khe, Ninh Kieu, Thanh pho Can Tho' ? 'selected' : ''}>Tran Quang Khai, Cai Khe, Ninh Kieu, Can Tho, Cai Khe, Ninh Kieu, Thanh pho Can Tho</option>
                    <option value="Phan Dinh Phung, Tan An, Ninh Kieu, TP Can Tho" ${sessionScope.destinationSearchBar == 'Phan Dinh Phung, Tan An, Ninh Kieu, TP Can Tho' ? 'selected' : ''}>Phan Dinh Phung, Tan An, Ninh Kieu, TP Can Tho</option>
                </select>
            </div>

            <!-- Check-in and Check-out date inputs with placeholders -->
            <div class="search-item date-input-wrapper" style="margin-left: 10px;">
                <label for="checkin" id="checkin-label" class="placeholder-label">Check-In</label>
                <input type="date" id="checkin" class="date-input" value="${sessionScope.checkInSearchBar}">
            </div>

            <div class="search-item date-input-wrapper" style="margin-left: 10px;">
                <label for="checkout" id="checkout-label" class="placeholder-label">Check-Out</label>
                <input type="date" id="checkout" class="date-input" value="${sessionScope.checkOutSearchBar}">
            </div>

            <!-- Guests dropdown -->
            <div class="search-item-guest guests-dropdown" style="margin-left: 10px;">
                <label for="guest" id="checkout-label-guest" class="placeholder-label-guest">Guests </label>
                <button class="guests-btn" onclick="toggleGuestDropdown()">
                    <span id="guest-count">${sessionScope.adultsSearchBar} Adult${sessionScope.adultsSearchBar > 1 ? 's' : ''}, ${sessionScope.childrenSearchBar} Child${sessionScope.childrenSearchBar > 1 ? 'ren' : ''}</span>
                </button>
                <div id="guest-dropdown-content" class="guest-dropdown-content" >
                    <div class="guest-item">
                        <span>Adults</span>
                        <div class="counter">
                            <button onclick="decrease('adults')">-</button>
                            <span id="adults-count">${sessionScope.adultsSearchBar != null ? sessionScope.adultsSearchBar : "1"}</span>
                            <button onclick="increase('adults')">+</button>
                        </div>
                    </div>
                    <div class="guest-item" >
                        <span>Children</span>
                        <div class="counter">
                            <button onclick="decrease('children')">-</button>
                            <span id="children-count">${sessionScope.childrenSearchBar != null ? sessionScope.childrenSearchBar : "0"}</span>
                            <button onclick="increase('children')">+</button>
                        </div>
                    </div>
                    <button class="done-btn" onclick="closeGuestDropdown()">Done</button>
                </div>
            </div>

                            <button class="search-btn-search" onclick="searchHotels()" style="margin-left: 10px;">Search</button>

        </div>

        <main class="main-content">
            <!----------------------------Aside------------------------------>
            <div class="filters">
                <!-- Star Rating Section -->
                <aside class="filter-section">
                    <h3 onclick="toggleText('star-rating-content', 'star-rating-icon', 'star-rating-btn')">
                        Star Rating
                        <div class="filter-icon" id="star-rating-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16">
                            <path d="M7 10l5 5 5-5H7z"></path>
                            </svg>
                        </div>
                    </h3>

                    <div class="filter-content active" id="star-rating-content">
                        <div class="filter-item" style="display: flex; align-items: center; justify-content: space-between;">
                            <label style="display: flex; align-items: center;">
                                <input type="checkbox" name="starRating" value="5"> 5
                                <c:forEach var="star" begin="1" end="5">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="margin-left: 10px;">
                                    <path fill="#FFD700" d="M12 .587l3.668 7.429 8.194 1.18-5.931 5.748 1.399 8.148L12 18.896l-7.33 3.867 1.399-8.148-5.931-5.748 8.194-1.18L12 .587z"></path>
                                    </svg>
                                </c:forEach>
                            </label>
                            <!--<span>(626)</span>-->
                        </div>

                        <div class="filter-item" style="display: flex; align-items: center; justify-content: space-between;">
                            <label style="display: flex; align-items: center;">
                                <input type="checkbox" name="starRating" value="4"> 4
                                <c:forEach var="star" begin="1" end="4">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="margin-left: 8px;">
                                    <path fill="#FFD700" d="M12 .587l3.668 7.429 8.194 1.18-5.931 5.748 1.399 8.148L12 18.896l-7.33 3.867 1.399-8.148-5.931-5.748 8.194-1.18L12 .587z"></path>
                                    </svg>
                                </c:forEach>
                            </label>
                            <!--<span>(422)</span>-->
                        </div>

                        <div class="filter-item" style="display: flex; align-items: center; justify-content: space-between;">
                            <label style="display: flex; align-items: center;">
                                <input type="checkbox" name="starRating" value="3"> 3
                                <c:forEach var="star" begin="1" end="3">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="margin-left: 8px;">
                                    <path fill="#FFD700" d="M12 .587l3.668 7.429 8.194 1.18-5.931 5.748 1.399 8.148L12 18.896l-7.33 3.867 1.399-8.148-5.931-5.748 8.194-1.18L12 .587z"></path>
                                    </svg>
                                </c:forEach>
                            </label>
                            <!--<span>(533)</span>-->
                        </div>

                        <div class="filter-item" style="display: flex; align-items: center; justify-content: space-between;">
                            <label style="display: flex; align-items: center;">
                                <input type="checkbox" name="starRating" value="2"> 2
                                <c:forEach var="star" begin="1" end="2">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="margin-left: 8px;">
                                    <path fill="#FFD700" d="M12 .587l3.668 7.429 8.194 1.18-5.931 5.748 1.399 8.148L12 18.896l-7.33 3.867 1.399-8.148-5.931-5.748 8.194-1.18L12 .587z"></path>
                                    </svg>
                                </c:forEach>
                            </label>
                            <!--<span>(174)</span>-->
                        </div>

                        <div class="filter-item" style="display: flex; align-items: center; justify-content: space-between;">
                            <label style="display: flex; align-items: center;">
                                <input type="checkbox" name="starRating" value="1"> 1
                                <c:forEach var="star" begin="1" end="1">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="margin-left: 8px;">
                                    <path fill="#FFD700" d="M12 .587l3.668 7.429 8.194 1.18-5.931 5.748 1.399 8.148L12 18.896l-7.33 3.867 1.399-8.148-5.931-5.748 8.194-1.18L12 .587z"></path>
                                    </svg>
                                </c:forEach>
                            </label>
                            <!--<span>(42)</span>-->
                        </div>
                    </div>

                    <p class="toggle-btn" id="star-rating-btn" onclick="toggleText('star-rating-content', 'star-rating-icon', 'star-rating-btn')">See More</p>
                </aside>

                <aside class="filter-section">
                    <h3 onclick="toggleText('popular-filter-content', 'popular-toggle-icon', 'popular-toggle-btn')">
                        Popular Facilities
                        <div class="filter-icon" id="popular-toggle-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16">
                            <path d="M7 10l5 5 5-5H7z"></path>
                            </svg>
                        </div>
                    </h3>

                    <div class="filter-content active" id="popular-filter-content">
                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Laundry"> Laundry</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Wi-Fi"> Wi-Fi</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="TV"> TV</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="AC"> AC</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Mini Bar"> Mini Bar</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Kitchenette"> Kitchenette</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Butler Service"> Butler Service</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Front Desk"> Front Desk</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Breakfast Available"> Breakfast Available</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Luggage Storage"> Luggage Storage</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Parking"> Parking</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Accessibility"> Accessibility</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Elevator"> Elevator</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Airport Transfer"> Airport Transfer</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Smoking Area"> Smoking Area</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Early Check-In"> Early Check-In</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Late Check-Out"> Late Check-Out</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Pools"> Pools</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="facilities" value="Room Service"> Room Service</label>
                        </div>
                    </div>

                    <p class="toggle-btn" id="popular-toggle-btn" onclick="toggleText('popular-filter-content', 'popular-toggle-icon', 'popular-toggle-btn')">See More</p>
                </aside>

                <aside class="filter-section">
                    <h3 onclick="toggleText('accommodation-type-content', 'accommodation-type-icon', 'accommodation-type-btn')">
                        Type Of Room
                        <div class="filter-icon" id="accommodation-type-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16">
                            <path d="M7 10l5 5 5-5H7z"></path>
                            </svg>
                        </div>
                    </h3>

                    <div class="filter-content active" id="accommodation-type-content">
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Luxury"> Luxury</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Deluxe"> Deluxe</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Standard"> Standard</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Suite"> Suite</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Economy"> Economy</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Presidential"> Presidential</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Family"> Family</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Single"> Single</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Double"> Double</label>
                        </div>
                        <div class="filter-item">
                            <label><input type="checkbox" name="roomType" value="Penthouse"> Penthouse</label>
                        </div>
                    </div>
                    <p class="toggle-btn" id="accommodation-type-btn" onclick="toggleText('accommodation-type-content', 'accommodation-type-icon', 'accommodation-type-btn')">See More</p>
                </aside>

                <aside class="filter-section">
                    <h3 onclick="toggleText('occupancy-filter-content', 'occupancy-toggle-icon', 'occupancy-toggle-btn')">
                        Occupancy Room
                        <div class="filter-icon" id="occupancy-toggle-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16">
                            <path d="M7 10l5 5 5-5H7z"></path>
                            </svg>
                        </div>
                    </h3>

                    <div class="filter-content active" id="occupancy-filter-content">
                        <div class="filter-item">
                            <label><input type="checkbox" name="occupancy" value="1"> 1 People</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="occupancy" value="2"> 2 People</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="occupancy" value="3"> 3 People</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="occupancy" value="4"> 4 People</label>
                        </div>

                        <div class="filter-item">
                            <label><input type="checkbox" name="occupancy" value="5"> 5 People</label>
                        </div>
                    </div>

                    <p class="toggle-btn" id="occupancy-toggle-btn" onclick="toggleText('occupancy-filter-content', 'occupancy-toggle-icon', 'occupancy-toggle-btn')">See More</p>
                </aside>
            </div>


            <!----------------------------Session------------------------------>
            <div class="session-main">
                <section class="hotel-list">
                    <c:choose>
                        <c:when test="${empty sessionScope.listRooms}">
                            <p>No rooms available.</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="room" items="${sessionScope.listRooms}">
                                <a href="roomDetail?id=${room.roomNo}" style="text-decoration: none; color: #000;">
                                    <div class="hotel-item" id="room-${room.roomNo}">

                                        <!-- Image Section -->
                                        <div class="hotel-image">
                                            <img src="${room.imageBackground}" alt="Main Room Image" style="height: 200px;">
                                            <div class="thumbnail-gallery">
                                                <c:forEach items="${room.getAllImagesByRoomNo()}" var="imageofroom">
                                                    <img style="width: 100px; height: 85px;" src="${imageofroom.imageURL}" alt="${imageofroom.imageTitle}">
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <!-- Hotel Details Section -->
                                        <div class="hotel-info">
                                            <h2>${room.hotel.hotelName}</h2>
                                            <label style="display: flex; align-items: center;">
                                                <c:forEach var="star" begin="1" end="${room.hotel.reviewHotel.starRating}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;">
                                                    <path fill="#FFD700" d="M12 .587l3.668 7.429 8.194 1.18-5.931 5.748 1.399 8.148L12 18.896l-7.33 3.867 1.399-8.148-5.931-5.748 8.194-1.18L12 .587z"></path>
                                                    </svg>
                                                </c:forEach>
                                            </label> </br>
                                            <ul class="amenities">
                                                <li>Services</li>
                                                <li>${room.amenities.substring(0, 40)}...</li>
                                            </ul>
                                            <p>Type Of Room: ${room.roomType.roomType}</p>
                                            <p>Occupancy Room: ${room.roomType.occupancy}</p>
                                            <p>Description: ${room.roomType.roomDescription.substring(0, 40)}... </p>
                                            <p>Location: ${room.hotel.address}</p>
                                        </div>

                                        <!-- Divider -->
                                        <div class="divider"></div>
                                        <!-- Price and Book Section -->
                                        <div class="hotel-price">
                                            <p class="original-price"><fmt:formatNumber value="${room.roomType.defaultRoomPrice * 100}" type="number" maxFractionDigits="3" /> VND</p>
                                            <p class="discount-price"><fmt:formatNumber value="${room.roomType.roomPrice * 100}" type="number" maxFractionDigits="3" /> VND</p>
                                            <p>Included Taxes & Fees</p>
                                            <p class="availability">Status: ${room.available == true ? "Avalable" : "Unavalable"}</p>
                                            <button class="book-btn">Booking Now</button>
                                        </div>
                                    </div><br>
                                </a>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </section>
            </div>
        </main>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

        <script src="JS/listroom.js"></script>

    </body>
</html>
