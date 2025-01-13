/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const slider = document.querySelector('.slider');
const images = slider.querySelectorAll('img');
let currentIndex = 0;

function slide() {
    currentIndex++;
    if (currentIndex >= images.length) {
        currentIndex = 0; // Quay lại hình đầu tiên
    }
    const offset = -currentIndex * (100 / images.length); // Tính toán độ dịch chuyển
    slider.style.transform = `translateX(${offset}%)`; // Áp dụng dịch chuyển
}

setInterval(slide, 3000); // Thay đổi hình mỗi 3 giây

document.addEventListener('DOMContentLoaded', function() {
    const roomList = document.querySelector('.room-list');
    let isDown = false;
    let startX;
    let scrollLeft;

    roomList.addEventListener('mousedown', (e) => {
        isDown = true;
        roomList.classList.add('active'); // Thêm hiệu ứng khi kéo (nếu cần)
        startX = e.pageX - roomList.offsetLeft;
        scrollLeft = roomList.scrollLeft;
    });

    roomList.addEventListener('mouseleave', () => {
        isDown = false;
        roomList.classList.remove('active');
    });

    roomList.addEventListener('mouseup', () => {
        isDown = false;
        roomList.classList.remove('active');
    });

    roomList.addEventListener('mousemove', (e) => {
        if (!isDown) return; // Dừng lại nếu không kéo
        e.preventDefault();
        const x = e.pageX - roomList.offsetLeft;
        const walk = (x - startX) * 2; // Tốc độ cuộn, có thể điều chỉnh
        roomList.scrollLeft = scrollLeft - walk;
    });
});

document.addEventListener('DOMContentLoaded', function() {
            const roomItems = document.querySelectorAll('.room-item');

            roomItems.forEach(item => {
                item.addEventListener('click', () => {
                    const roomType = item.getAttribute('data-room');
                    window.location.href = `room.jsp?roomType=${roomType}`;
                });
            });
        });

document.addEventListener('DOMContentLoaded', function () {
    const slides = document.querySelectorAll('.slide');
    const prevBtns = document.querySelectorAll('.arrow-1.prev');  // Corrected to match HTML structure
    const nextBtns = document.querySelectorAll('.arrow-1.next');  // Corrected to match HTML structure
    let currentIndex = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            if (i === index) {
                slide.classList.add('active');
            } else {
                slide.classList.remove('active');
            }
        });
    }

    prevBtns.forEach(prevBtn => {
        prevBtn.addEventListener('click', function () {
            currentIndex = (currentIndex === 0) ? slides.length - 1 : currentIndex - 1;
            showSlide(currentIndex);
        });
    });

    nextBtns.forEach(nextBtn => {
        nextBtn.addEventListener('click', function () {
            currentIndex = (currentIndex === slides.length - 1) ? 0 : currentIndex + 1;
            showSlide(currentIndex);
        });
    });

    showSlide(currentIndex); // Display the first slide initially
});






