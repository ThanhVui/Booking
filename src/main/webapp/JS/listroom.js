/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/*------------- Unique Facilities Section ------------------*/
/* global fetch, PageContext */

function toggleText(contentId, iconId, btnId) {
    var content = document.getElementById(contentId);
    var icon = document.getElementById(iconId).children[0];
    var btn = document.getElementById(btnId);

    // Toggle the content visibility
    content.classList.toggle("active");

    // Rotate the arrow icon
    icon.classList.toggle("rotate");

    // Change button text based on the visibility of the content
    if (content.classList.contains("active")) {
        btn.textContent = "See Less";
        icon.style.transform = "rotate(180deg)"; // Rotate arrow down
    } else {
        btn.textContent = "See More";
        icon.style.transform = "rotate(0deg)"; // Reset arrow to original
    }
}
/*------------- search bar ------------------*/
let adults = 1;
let children = 0;

function toggleGuestDropdown() {
    const dropdown = document.getElementById("guest-dropdown-content");
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
}

function closeGuestDropdown() {
    const dropdown = document.getElementById("guest-dropdown-content");
    dropdown.style.display = "none";
    updateGuestLabel();
}

function increase(type) {
    if (type === "adults") {
        adults++;
        document.getElementById("adults-count").textContent = adults;
    } else if (type === "children") {
        children++;
        document.getElementById("children-count").textContent = children;
    }
    updateGuestLabel();
}

function decrease(type) {
    if (type === "adults" && adults > 0) {
        adults--;
        document.getElementById("adults-count").textContent = adults;
    } else if (type === "children" && children > 0) {
        children--;
        document.getElementById("children-count").textContent = children;
    }
    updateGuestLabel();
}

function updateGuestLabel() {
    document.getElementById("guest-count").textContent = `${adults} Adult${adults > 1 ? 's' : ''}, ${children} Child${children > 1 ? 'ren' : ''}`;
}

/*------------- filters  ------------------*/
document.addEventListener('DOMContentLoaded', () => {
    // Attach change event listener to the star rating checkboxes
    const filterCheckboxes = document.querySelectorAll('input[name="starRating"], \n\
                        input[name="facilities"],\n\
                        input[name="roomType"], \n\
                        input[name="occupancy"]');

    filterCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', handleFilters);
    });

    function handleFilters() {
        const filters = {
            destination: document.getElementById('destination').value,
            checkIn: document.getElementById('checkin').value,
            checkOut: document.getElementById('checkout').value,
            adultsCount: parseInt(document.getElementById('adults-count').textContent, 10),
            childrenCount: parseInt(document.getElementById('children-count').textContent, 10),
            totalGuests: parseInt(document.getElementById('adults-count').textContent, 10) + parseInt(document.getElementById('children-count').textContent, 10),
            starRating: [],
            facilities: [],
            roomType: [],
            occupancy: []
        };

        // Collect star ratings, facilities, etc.
        document.querySelectorAll('input[name="starRating"]:checked').forEach(checkbox => {
            filters.starRating.push(checkbox.value);
        });

        document.querySelectorAll('input[name="facilities"]:checked').forEach(checkbox => {
            filters.facilities.push(checkbox.value);
        });

        document.querySelectorAll('input[name="roomType"]:checked').forEach(checkbox => {
            filters.roomType.push(checkbox.value);
        });

        document.querySelectorAll('input[name="occupancy"]:checked').forEach(checkbox => {
            filters.occupancy.push(checkbox.value);
        });

        applyFilters(filters);
    }



    function applyFilters(filters) {
        fetch('listRoomServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(filters)
        })
                .then(response => response.json())
                .then(data => updateRoomList(data))
                .catch(error => console.error('error:', error));
    }

    // Search destination of hotel
    document.querySelector('.search-btn-search').addEventListener('click', searchHotels);
    function searchHotels() {
        const destination = document.getElementById('destination').value;
        const checkin = document.getElementById('checkin').value;
        const checkout = document.getElementById('checkout').value;
        const adultsCount = parseInt(document.getElementById('adults-count').textContent, 10);
        const childrenCount = parseInt(document.getElementById('children-count').textContent, 10);

        if (!destination) {
            alert('Please select a destination!');
            return;
        }

        if (!checkin || !checkout) {
            alert('Please fill in both Check-in and Check-out dates.');
            return;
        }

        if (new Date(checkin) >= new Date(checkout)) {
            alert('Check-in date must be earlier than check-out date.');
            return;
        }

        if (adultsCount + childrenCount > 10) {
            alert('Total number of adults and children must be less than 10.');
            return;
        }

        handleFilters();
    }


    function updateRoomList(rooms) {
        console.log(rooms); // Debugging step
        const roomList = document.querySelector('.hotel-list');
        roomList.innerHTML = ''; // Clear the existing room list

        if (rooms.length === 0) {
            roomList.innerHTML = '<p>No rooms available.</p>';
            return;
        }

        rooms.forEach(room => {
            // Log the images array for each room
            console.log(`Images for Room ${room.roomNo}:`, room.images);
            const roomHTML = `
            <a href="roomDetail?id=${room.roomNo}" style="text-decoration: none; color: #000;">
                <div class="hotel-item" id="room-${room.roomNo}">
                    <div class="hotel-image">
                        <img src="${room.imageBackground}" alt="Main Room Image" style="height: 200px;">
                        <div class="thumbnail-gallery">
                           ${room.images ? room.images.map(image => `<img style="width: 100px; height: 85px;" src="${image.imageURL}" alt="${image.imageTitle}">`).join('') : ''}
                        </div>
                    </div>
                    <div class="hotel-info">
                        <h2>${room.hotel.hotelName}</h2>
                        <label>${generateStars(room.hotel.reviewHotel.starRating)}</label></br>
                        <ul class="amenities">
                            <li>Services</li>
                            <li>${room.amenities.substring(0, 40)}...</li>
                        </ul>
                        <p>Type Of Room: ${room.roomType.roomType}</p>
                        <p>Occupancy Room: ${room.roomType.occupancy}</p>
                        <p>Description: ${room.roomType.roomDescription.substring(0, 40)}...</p>
                        <p>Location: ${room.hotel.address}</p>
                    </div>
                    <div class="hotel-price">
                        <p class="original-price">${room.roomType.defaultRoomPrice} VND</p>
                        <p class="discount-price">${room.roomType.roomPrice} VND</p>
                        <p>Included Taxes & Fees</p>
                        <p class="availability">Status: ${room.available ? "Available" : "Unavailable"}</p>
                        <button class="book-btn">Booking Now</button>
                    </div>
                </div><br>
            </a>`;
            roomList.insertAdjacentHTML('beforeend', roomHTML);
        });
    }

    function generateStars(starCount) {
        let stars = '';
        for (let i = 0; i < starCount; i++) {
            stars += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" style="margin-right: 5px;">
                      <path fill="#FFD700" d="M12 .587l3.668 7.429 8.194 1.18-5.931 5.748 1.399 8.148L12 18.896l-7.33 3.867 1.399-8.148-5.931-5.748 8.194-1.18L12 .587z"></path>
                      </svg>`;
        }
        return stars;
    }
});
/*-------------  ------------------*/

/*-------------  ------------------*/

/*-------------  ------------------*/

/*-------------  ------------------*/

/*-------------  ------------------*/

/*-------------  ------------------*/
