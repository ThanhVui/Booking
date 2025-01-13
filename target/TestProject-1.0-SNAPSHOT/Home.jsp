<%-- 
    Document   : Home
    Created on : Oct 15, 2024, 12:17:31 AM
    Author     : Nguyen Huy Hoang - CE182102
--%>

<%@page import="model.Guest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="CSS/home.css"/>

        <script src="JS/main.js"></script>
        
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <!-- Hero Section -->
        <section class="hero" style="margin-top: 20px">
            <div class="overlay">
                <h1>Luxury & Class</h1>
                <a href="#" class="btn">View Rooms</a>
            </div>
            <div class="slider">
                <img src="./Images/Hero/image1.jpg" alt="Room 1">
                <img src="./Images/Hero/image2.jpg" alt="Room 2">
                <img src="./Images/Hero/image3.jpg" alt="Room 3">
            </div>
            <div class="booking-form">
                <select>
                    <option>Place</option>
                    <option>Can Tho</option>
                    <option>Sai Gon</option>
                    <option>Da Nang</option>
                    <option>Ha Noi</option>
                </select>
                <input type="date" value="2024-10-01">
                <input type="date" value="2024-10-02">
                <select>
                    <option>Adults</option>
                    <option>1 Adult</option>
                    <option>2 Adults</option>
                </select>
                <select>
                    <option>Children</option>
                    <option>None</option>
                    <option>1 Child</option>
                </select>
                <button>Search</button>
            </div>
        </section>

        <!-- Welcome Section -->
        <section id="about" class="welcome" style="padding: 120px 0;">
            <div class="container">
                <img src="/Images/Welcome/lobby.jpg" alt="Luxe Hotel Lobby">
                <div class="text">
                    <h2>Welcome to VietHotel Premier</h2>
                    <p>Welcome to VietHotel Premier, your ultimate destination for booking the finest hotels in Vietnam! We proudly showcase top-rated accommodations renowned for their exceptional service and luxurious amenities, from stunning beachfront resorts to historic hotels in vibrant city centers. With VietHotel Premier, every stay is not just a place to rest but an opportunity to explore the rich culture and warm hospitality of Vietnam. Join us as we embark on a journey to discover the best experiences the country has to offer!</p>
                </div>
            </div>
        </section>
        
        <!-- Room Categories -->
        <section class="rooms">
            <h2>Room Categories</h2>
            <div class="carousel-container">
                <div class="room-list">
                    <div class="room-item" data-room="deluxe">
                        <img src="/Images/Room/deluxe-room.jpg" alt="Deluxe Room">
                        <h3>Deluxe Room</h3>
                        <p>From: 890,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="triple">
                        <img src="/Images/Room/triple-room.jpg" alt="Triple Room">
                        <h3>Triple Room</h3>
                        <p>From: 1,200,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="senior">
                        <img src="/Images/Room/senior-room.jpg" alt="Senior Room">
                        <h3>Senior Room</h3>
                        <p>From: 1,800,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="ssvip">
                        <img src="/Images/Room/ssvip-room.jpg" alt="SSVIP Room">
                        <h3>SSVIP Room</h3>
                        <p>From: 2,500,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="deluxe">
                        <img src="/Images/Room/deluxe-room.jpg" alt="Deluxe Room">
                        <h3>Deluxe Room</h3>
                        <p>From: 890,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="triple">
                        <img src="/Images/Room/triple-room.jpg" alt="Triple Room">
                        <h3>Triple Room</h3>
                        <p>From: 1,200,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="senior">
                        <img src="/Images/Room/senior-room.jpg" alt="Senior Room">
                        <h3>Senior Room</h3>
                        <p>From: 1,800,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="ssvip">
                        <img src="/Images/Room/ssvip-room.jpg" alt="SSVIP Room">
                        <h3>SSVIP Room</h3>
                        <p>From: 2,500,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="deluxe">
                        <img src="/Images/Room/deluxe-room.jpg" alt="Deluxe Room">
                        <h3>Deluxe Room</h3>
                        <p>From: 890,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="triple">
                        <img src="/Images/Room/triple-room.jpg" alt="Triple Room">
                        <h3>Triple Room</h3>
                        <p>From: 1,200,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="senior">
                        <img src="/Images/Room/senior-room.jpg" alt="Senior Room">
                        <h3>Senior Room</h3>
                        <p>From: 1,800,000 VND/Night</p>
                    </div>
                    <div class="room-item" data-room="ssvip">
                        <img src="/Images/Room/ssvip-room.jpg" alt="SSVIP Room">
                        <h3>SSVIP Room</h3>
                        <p>From: 2,500,000 VND/Night</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Experience Section -->
        <section id="new" class="experience-slider">
            <div class="slider-container">
                <div class="slide active">
                    <img src="/Images/Experience/urban-experience.jpg" alt="Urban Experience">
                    <div class="text-content">
                        <h2>Exquisite Urban Experience</h2>
                        <p>Step into a world where modern luxury meets vibrant city life. The rhythm of the streets, the gleam of the skyline, and the pulse of urban energy come together to create an unforgettable adventure. Let the city sweep you off your feet.</p>
                        <div class="arrow-container">
                            <button class="arrow-1 prev">&#10094;</button>
                            <button class="arrow-1 next">&#10095;</button>
                        </div>
                    </div>
                </div>
                <div class="slide">
                    <img src="/Images/Experience/spa-experience.jpg" alt="Spa Experience">
                    <div class="text-content">
                        <h2>Spa Serenity</h2>
                        <p>Indulge in the ultimate relaxation with our world-class spa treatments, where every detail is designed for your comfort. Escape into a tranquil oasis where time slows down.</p>
                        <div class="arrow-container">
                            <button class="arrow-1 prev">&#10094;</button>
                            <button class="arrow-1 next">&#10095;</button>
                        </div>
                    </div>
                </div>
                <div class="slide">
                    <img src="/Images/Experience/friendly-locals.jpg" alt="Friendly Locals">
                    <div class="text-content">
                        <h2>Friendly Locals</h2>
                        <p>Our guests always leave with a smile, thanks to the warm, friendly people that make every encounter memorable. Experience the kindness that feels like a homecoming.</p>
                        <div class="arrow-container">
                            <button class="arrow-1 prev">&#10094;</button>
                            <button class="arrow-1 next">&#10095;</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
        <section id="services" class="services" style="padding: 120px 0;">
            <h2>Services</h2>
            <div class="service-list">
                <div class="service-item">
                    <img src="/Images/Services/Duadon.jpg" alt="Airport Shuttle">
                    <div class="overlay">
                        <h3>Airport Shuttle</h3>
                    </div>
                </div>
                <div class="service-item">
                    <img src="/Images/Services/buasang.jpg" alt="Thoughtful Breakfast">
                    <div class="overlay">
                        <h3>Thoughtful Breakfast</h3>
                    </div>
                </div>
                <div class="service-item">
                    <img src="/Images/Services/huong-dan-vien-1-1512650003199.jpg" alt="City Tours">
                    <div class="overlay">
                        <h3>City Tours</h3>
                    </div>
                </div>
                <div class="service-item">
                    <img src="/Images/Services/resort.jpg" alt="Beach Resort">
                    <div class="overlay">
                        <h3>Beach Resort</h3>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section id="feedback" class="testimonials" style="padding: 120px 0;">
            <h2>Customer Feedback</h2>
            <div class="testimonial-list">
                <div class="testimonial-item">
                    <img src="/Images/Feedback/1_UWKI.jpg" alt="Lionel Andrés Messi">
                    <p>"I had a wonderful stay at this hotel, the service was truly perfect!"</p>
                    <h3>Lionel Andrés Messi</h3>
                    <div class="star-rating">
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                    </div>
                </div>
                <div class="testimonial-item">
                    <img src="/Images/Feedback/ElonMusk_2017-embed.jpg" alt="Elon Reeve Musk">
                    <p>"I will return here whenever I have the chance, it's a great place to relax."</p>
                    <h3>Elon Reeve Musk</h3>
                    <div class="star-rating">
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                    </div>
                </div>
                <div class="testimonial-item">
                    <img src="/Images/Feedback/Neymar-Jr-Instagram-072024-04-f8f4230653a44aee815b1cba0879281e.jpg" alt="Neymar da Silva Santos Júnior">
                    <p>"The rooms are comfortable and the service is excellent, I had a memorable experience."</p>
                    <h3>Neymar da Silva Santos Júnior</h3>
                    <div class="star-rating">
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                        <span class="star">&#9733;</span>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Nút mở chat box -->
        <!-- <div class="chat-btn" id="chat-btn">
            <img src="https://img.icons8.com/ios-filled/50/FFFFFF/chat.png" />
        </div> -->

        <!-- Chat box -->
        <!-- <div class="chat-box" id="chat-box">
            <div class="chat-header">
                <span>Huy Hoàng Xin Chào Ạ!</span>
                <button class="close-btn" id="close-chat">&times;</button>
            </div>
            <div class="chat-body">
                <img class="chat-img" src="your-image-url-here" alt="Xin chào">
                <div class="chat-welcome">
                    <p>Chào bạn, Sáu Tài Chính cảm ơn bạn đã quan tâm đến dịch vụ công ty SHB Finance.</p>
                    <p>Bạn có thể chọn các thông tin mình quan tâm dưới đây để tham khảo hoặc nhập các câu hỏi chi tiết nhé!
                    </p>
                </div>
            </div>
            <div class="chat-footer">
                <input type="text" placeholder="Nhập tin nhắn..." id="chat-input">
                <button class="send-btn">
                    <img src="https://img.icons8.com/ios-glyphs/30/FFFFFF/paper-plane.png" />
                </button>
            </div>
        </div> -->

        <script>
            // Mở chat box
            const chatBtn = document.getElementById('chat-btn');
            const chatBox = document.getElementById('chat-box');
            const closeChat = document.getElementById('close-chat');

            chatBtn.addEventListener('click', () => {
                // Nếu chat box đang hiển thị, ẩn nó, nếu không thì hiển thị nó
                if (chatBox.style.display === 'flex') {
                    chatBox.style.display = 'none';
                    // chatBtn.style.display = 'block'; // Sử dụng khi cần thay đổi hiển thị nút
                } else {
                    chatBox.style.display = 'flex';
                    // chatBtn.style.display = 'none'; // Sử dụng khi cần thay đổi hiển thị nút
                }
            });

            closeChat.addEventListener('click', () => {
                if (chatBox.style.display === 'flex') {
                    chatBox.style.display = 'none';
                    // chatBtn.style.display = 'block'; // Sử dụng khi cần thay đổi hiển thị nút
                }
            });

        </script>
    </body>
</html>
