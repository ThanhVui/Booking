<%-- 
    Document   : admin
    Created on : Oct 6, 2024, 2:03:37 PM
    Author     : Tang Thanh Vui - CE180901
--%>

<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 0;
            }
            .sidebar {
                width: 260px;
                background: linear-gradient(to bottom, #4b6cb7, #182848);
                height: 100vh;
                color: white;
                padding: 20px;
                position: fixed;
                box-shadow: 5px 0 15px rgba(0, 0, 0, 0.1);
            }
            .sidebar h2 {
                color: #ffba08;
                text-align: center;
                margin-bottom: 30px;
                font-size: 24px;
            }
            .sidebar ul {
                list-style-type: none;
                padding: 0;
            }
            .sidebar ul li {
                padding: 15px 10px;
                cursor: pointer;
                transition: background-color 0.3s;
                display: flex;
                align-items: center;
            }
            .sidebar ul li i {
                margin-right: 10px;
            }
            .sidebar ul li:hover {
                background-color: rgba(255, 255, 255, 0.1);
                border-radius: 8px;
            }
            .main-content {
                margin-left: 280px;
                padding: 20px;
                background: #ffffff;
                min-height: 100vh;
                box-shadow: inset 0 0 15px rgba(0, 0, 0, 0.05);
            }
            .hidden-content {
                display: none;
            }
            .active-content {
                display: block;
            }
            .dashboard-options {
                list-style-type: none;
                padding: 0;
                margin: 20px 0;
            }
            .dashboard-options li {
                padding: 10px;
                cursor: pointer;
                transition: background-color 0.3s;
                display: flex;
                align-items: center;
                background-color: #f9f9f9;
                margin-bottom: 10px;
                border-radius: 8px;
            }
            .dashboard-options li:hover {
                background-color: #e6e6e6;
            }
            .dashboard-options li i {
                padding-right: 10px;
            }
            .user-options, .room-options {
                list-style-type: none;
                padding: 0;
                margin: 20px 0;
                display: flex;
                gap: 10px;
            }
            .user-options li, .room-options li {
                flex: 1;
                padding: 10px;
                cursor: pointer;
                transition: background-color 0.3s;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #4b6cb7;
                color: white;
                border-radius: 8px;
            }
            .user-options li:hover, .room-options li:hover {
                background-color: #ffba08;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            table th, table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            table th {
                background-color: #4b6cb7;
                color: black;
            }
            .btn {
                padding: 8px 12px;
                border: none;
                background-color: #4b6cb7;
                color: white;
                cursor: pointer;
                border-radius: 4px;
            }
            .btn:hover {
                background-color: #ffba08;
            }
        </style>
        <script>
            function showSection(sectionId) {
                var sections = document.getElementsByClassName('hidden-content');
                for (var i = 0; i < sections.length; i++) {
                    sections[i].classList.remove('active-content');
                }
                document.getElementById(sectionId).classList.add('active-content');
            }

            // Đảm bảo khi click vào phần "Dashboard" thì sẽ hiển thị đúng phần tử
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('.sidebar ul li[onclick="showSection(\'dashboardSection\')"]').addEventListener('click', function () {
                    // Cập nhật nội dung phần Dashboard
                    document.getElementById('dashboardSection').innerHTML = `
                        <h1>Dashboard</h1>
                        <ul class="dashboard-options">
                            <li onclick="showDashboardChart('totalGuestsChartContainer')"><i class="fas fa-user-friends"></i> Total Guests</li>
                            <li onclick="showDashboardChart('totalBookingsChartContainer')"><i class="fas fa-calendar-check"></i> Total Bookings</li>
                        </ul>
                        <div id="dashboardContent">
                            <div id="totalGuestsChartContainer" class="hidden-content">
                                <h3>Total Guests</h3>
                                <canvas id="totalGuestsChart"></canvas>
                            </div>
                            <div id="totalBookingsChartContainer" class="hidden-content">
                                <h3>Total Bookings</h3>
                                <canvas id="totalBookingsChart"></canvas>
                            </div>
                        </div>
                    `;
                    initializeCharts();
                });
            });

            function showDashboardChart(chartContainerId) {
                var chartContainers = document.querySelectorAll('#dashboardContent > div');
                chartContainers.forEach(function (container) {
                    container.classList.remove('active-content');
                });
                document.getElementById(chartContainerId).classList.add('active-content');
            }

            function initializeCharts() {
                // Smooth Line Chart for Total Guests
                var labels = <%= new Gson().toJson((String[]) session.getAttribute("labels"))%>;
                var totalGuestOfMonths = <%= new Gson().toJson((long[]) session.getAttribute("totalGuestOfMonths"))%>;

                console.log(labels); // Kiểm tra giá trị labels
                console.log(totalGuestOfMonths); // Kiểm tra giá trị totalGuestOfMonths

                var totalGuestsCtx = document.getElementById('totalGuestsChart').getContext('2d');
                new Chart(totalGuestsCtx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Total Guests',
                                data: totalGuestOfMonths,
                                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                borderColor: 'rgba(54, 162, 235, 1)',
                                borderWidth: 2,
                                fill: true,
                                tension: 0.4
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top'
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                // Smooth Line Chart for Total Bookings
                var labels = <%= new Gson().toJson((String[]) session.getAttribute("labels"))%>;
                var totalBookingOfMonths = <%= new Gson().toJson((long[]) session.getAttribute("totalBookingOfMonths"))%>;

                var totalBookingsCtx = document.getElementById('totalBookingsChart').getContext('2d');
                new Chart(totalBookingsCtx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Total Bookings',
                                data: totalBookingOfMonths,
                                backgroundColor: 'rgba(255, 206, 86, 0.2)',
                                borderColor: 'rgba(255, 206, 86, 1)',
                                borderWidth: 2,
                                fill: true,
                                tension: 0.4
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top'
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });

                // Smooth Line Chart for Orders Received
                var ordersReceivedCtx = document.getElementById('ordersReceivedChart').getContext('2d');
                new Chart(ordersReceivedCtx, {
                    type: 'line',
                    data: {
                        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                        datasets: [{
                                label: 'Orders Received',
                                data: [50, 60, 55, 70, 65, 75, 70],
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 2,
                                fill: true,
                                tension: 0.4
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: true,
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top'
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }

            // Đảm bảo khi click vào phần "Users" thì sẽ hiển thị đúng phần tử
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('.sidebar ul li[onclick="showSection(\'usersSection\')"]').addEventListener('click', function () {
                    // Cập nhật nội dung phần Users
                    document.getElementById('usersSection').innerHTML = `
                        <h1>Users Management</h1>
                        <ul class="user-options">
                            <li onclick="showUserList()"><i class="fas fa-list"></i> List Users</li>       
                        </ul>
                        <div id="userContent"></div>
                    `;
                });
            });



            function showUserList() {
                fetch('listservletcontroller')
                        .then(response => response.text())
                        .then(data => {
                            document.getElementById('userContent').innerHTML = data;
                        })
                        .catch(error => console.error('Error:', error));
            }




        </script>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <h2>TPro Admin</h2>
            <ul>
                <li onclick="showSection('dashboardSection')"><i class="fas fa-tachometer-alt"></i> Dashboard</li>
                <li onclick="showSection('analyticsSection')"><i class="fas fa-chart-line"></i> Analytics</li>
                <li onclick="showSection('ecommerceSection')"><i class="fas fa-shopping-cart"></i> E-commerce</li>
                <li onclick="showSection('usersSection')"><i class="fas fa-user"></i> Users</li>
                <li onclick="showSection('bookingsSection')"><i class="fas fa-book"></i> Bookings</li>
                <li onclick="showSection('roomsSection')"><i class="fas fa-hotel"></i> Rooms</li>
                <li onclick="showSection('reviewsSection')"><i class="fas fa-star"></i> Reviews</li>
                <li onclick="showSection('discountsSection')"><i class="fas fa-percent"></i> Discounts</li>
                <li onclick="showSection('billsSection')"><i class="fas fa-file-invoice-dollar"></i> Bills</li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div id="dashboardSection" class="hidden-content active-content">
                <h1>Admin Dashboard</h1>
                <!-- Dashboard Content -->
            </div>

            <!-- Users Section -->
            <div id="usersSection" class="hidden-content">
                <h3>Users Details</h3>
                <!-- Nội dung sẽ được cập nhật động khi click vào mục Users từ sidebar -->
            </div>

            <!-- Rooms Section -->
            <div id="roomsSection" class="hidden-content">
                <h1>Rooms Management</h1>
                <ul class="room-options">
                    <li id="listRoomsButton"><i class="fas fa-list"></i> List Rooms</li>
                    <li onclick="showAddRoom()"><i class="fas fa-plus"></i> Add New Room</li>
                </ul>
                <div id="roomContent"></div> <!-- This is where the servlet content will be loaded -->
            </div>

            <!-- Các phần khác -->
            <div id="analyticsSection" class="hidden-content">
                <h3>Analytics Overview</h3>
                <div class="chart-container">
                    <canvas id="analyticsChart"></canvas>
                </div>
            </div>

            <div id="ecommerceSection" class="hidden-content">
                <h3>E-commerce Details</h3>
                <!-- Nội dung E-commerce -->
            </div>

            <div id="bookingsSection" class="hidden-content">
                <h3>Bookings Details</h3>
                <!-- Nội dung Bookings -->
            </div>

            <div id="reviewsSection" class="hidden-content">
                <h3>Reviews Details</h3>
                <!-- Nội dung Reviews -->
            </div>

            <div id="discountsSection" class="hidden-content">
                <h3>Discounts Details</h3>
                <div class="chart-container">
                    <canvas id="salesStatsChart"></canvas>
                </div>
            </div>

            <div id="billsSection" class="hidden-content">
                <h3>Bills Details</h3>
                <!-- Nội dung Bills -->
            </div>
        </div>

        <!-- Chart JS Script -->
        <script>
            /*========== VUi VUi VUi VUi Show Room List ==========*/
            function showRoomList() {
                fetch('adminListRoomsServlet')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok ' + response.statusText);
                            }
                            return response.text();
                        })
                        .then(data => {
                            document.getElementById('roomContent').innerHTML = data;
                        })
                        .catch(error => {
                            console.error('There was a problem with the fetch operation:', error);
                            document.getElementById('roomContent').innerHTML = `<div class="alert alert-danger">Failed to load rooms list. Please try again later.</div>`;
                        });
            }

            /*========== Show Add Room Form ==========*/
            function showAddRoom() {
                fetch('adminAddNewRoomServlet')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok ' + response.statusText);
                            }
                            return response.text();
                        })
                        .then(data => {
                            document.getElementById('roomContent').innerHTML = data;
                        })
                        .catch(error => {
                            console.error('There was a problem with the fetch operation:', error);
                            document.getElementById('roomContent').innerHTML = `<div class="alert alert-danger">Failed to load add room page. Please try again later.</div>`;
                        });
            }

            /*========== Sidebar Initialization ==========*/
            document.addEventListener('DOMContentLoaded', function () {
                document.querySelector('.sidebar ul li[onclick="showSection(\'roomsSection\')"]').addEventListener('click', function () {
                    document.getElementById('roomsSection').innerHTML = `
                <h1>Rooms Management</h1>
                <ul class="room-options">
                    <li id="listRoomsButton"><i class="fas fa-list"></i> List Rooms</li>
                    <li id="addRoomButton"><i class="fas fa-plus"></i> Add New Room</li>
                </ul>
                <div id="roomContent"></div>
            `;
                    document.getElementById('listRoomsButton').addEventListener('click', showRoomList);
                    document.getElementById('addRoomButton').addEventListener('click', showAddRoom);
                });

                // Check sessionStorage or session flag for showing the room list after update
                if (sessionStorage.getItem('loadRoomsSection') === 'true' || '<%= session.getAttribute("showRoomListAfterUpdate")%>' === 'true') {
                    sessionStorage.removeItem('loadRoomsSection'); // Clear the sessionStorage flag
                    showSection('roomsSection'); // Show Rooms section
                    showRoomList(); // Load the room list

                    // Remove the session attribute to prevent reloading on next refresh
            <% session.removeAttribute("showRoomListAfterUpdate");%>
                }
            });
            // Check sessionStorage or session flag for showing the room list after delete
            if (sessionStorage.getItem('loadRoomsSection') === 'true' || '<%= session.getAttribute("showRoomListAfterDelete")%>' === 'true') {
                sessionStorage.removeItem('loadRoomsSection'); // Clear the flag if it was set
                showSection('roomsSection'); // Show the Rooms section
                showRoomList(); // Load the room list

                // Remove the session attribute to prevent reloading on the next refresh
            <% session.removeAttribute("showRoomListAfterDelete");%>
            }
        </script>
        
        <script>
            // Smooth Line Chart for Analytics Overview
            var analyticsCtx = document.getElementById('analyticsChart').getContext('2d');
            new Chart(analyticsCtx, {
                type: 'line',
                data: {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                    datasets: [{
                            label: 'User Growth',
                            data: [65, 59, 80, 81, 56, 55, 40],
                            backgroundColor: 'rgba(255, 159, 64, 0.2)',
                            borderColor: 'rgba(255, 159, 64, 1)',
                            borderWidth: 2,
                            fill: true,
                            tension: 0.4
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            // Smooth Line Chart for Sales Stats
            var salesStatsCtx = document.getElementById('salesStatsChart').getContext('2d');
            new Chart(salesStatsCtx, {
                type: 'line',
                data: {
                    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
                    datasets: [{
                            label: 'Sales',
                            data: [65, 75, 70, 80, 60, 80],
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 2,
                            fill: true,
                            tension: 0.4
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
