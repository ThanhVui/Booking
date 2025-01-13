<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>QR Payment</title>
       <link rel="stylesheet" href="CSS/qrPayment.css">
    </head>
    <body>
        <div class="container">
            <h1>Scan QR code to pay</h1>
            <div class="qr-code">
                <%
                    String transactionId = (String) session.getAttribute("transactionId");
                    if (transactionId == null) {
                        response.sendRedirect("payment.jsp");
                        return;
                    }

                    String successUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                            + request.getContextPath() + "/success.jsp?transactionId=" + transactionId;

                    try {
                        QRCodeWriter qrCodeWriter = new QRCodeWriter();
                        BitMatrix bitMatrix = qrCodeWriter.encode(successUrl, BarcodeFormat.QR_CODE, 300, 300);

                        ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
                        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
                        byte[] pngData = pngOutputStream.toByteArray();

                        String qrCodeBase64 = Base64.getEncoder().encodeToString(pngData);
                %>
                <img src="data:image/png;base64,<%= qrCodeBase64%>" alt="QR Code">
                <%
                    } catch (Exception e) {
                        out.println("<p>Error generating QR code. Please try again later.</p>");
                        e.printStackTrace();
                    }
                %>
            </div>
            <div class="instructions">
                <h2>QR Payment Instructions</h2>
                <ol>
                    <li>Open your e-Wallet or Banking App that supports QR payment with VietQR, then scan the QR code above.</li>
                    <li>Please verify the amount and payment information before completing the transaction within the payment period.</li>
                    <li>The booking information will be automatically confirmed after successful payment. Please check the booking status on the Booking page.</li>
                </ol>
            </div>
        </div>
        <script>
            // Lấy transactionId từ server để xác định giao dịch
            var transactionId = '<%= transactionId%>';
            console.log("Transaction ID in QR Payment: " + transactionId);

            // Sau 10 giây, tự động chuyển hướng đến trang success.jsp
            setTimeout(function () {
                console.log("Redirecting to success page with transactionId: " + transactionId);
                window.location.href = 'success.jsp?transactionId=' + transactionId;
            }, 5000); // 5 giây
        </script>
    </body>
</html>
