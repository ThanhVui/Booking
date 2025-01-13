<%-- 
    Document   : contact
    Created on : Oct 18, 2024, 12:14:21 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact</title>
        <link rel="stylesheet" href="./CSS/contact.css">
        
    </head>
    <body>
        <div class="contact-container">
            <form action="https://api.web3forms.com/submit" method="POST" class="contact-left">
                <div class="contact-left-tilte">
                    <h2>Get in touch</h2>
                    <hr> 
                </div>
                <input type="hidden" name="access_key" value="37fdd974-f550-4c44-921e-6de57334c2bb">
                <input type="text" name="name" placeholder="Full Name" class="contact-inputs" required>
                <input type="text" name="email" placeholder="Your Email" class="contact-inputs" required>
                <input type="text" name="phone" placeholder="Your Phone" class="contact-inputs" required>
                <textarea name="message" placeholder="Your Message" class="contact-inputs" required></textarea>
                <button type="submit">Submit <img src="${pageContext.request.contextPath}/Images/assets/arrow_icon.png" alt=""></button>
            </form>
            <div class="contact-right">
                <img src="${pageContext.request.contextPath}/Images/assets/right_img.png" alt="">
            </div>

        </div>
    </body>
</html>
