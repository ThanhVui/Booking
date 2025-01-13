<%-- 
    Document   : toastMessages
    Created on : Nov 2, 2024, 12:51:58 PM
    Author     : Nguyen Huy Hoang - CE182102
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            body {
                height: 100vh;
                display: flex;
                flex-direction: column;
                font-family: system-ui, sans-serif;
                background-color: #f4f4f5;
            }

            body > div {
                margin: auto;
            }

            /* ======= Buttons ======== */

            /* Block */
            .btn {
                display: inline-block;
                text-decoration: none;
                background-color: transparent;
                border: none;
                outline: none;
                color: #fff;
                padding: 12px 48px;
                border-radius: 50px;
                cursor: pointer;
                min-width: 120px;
                transition: opacity 0.2s ease;
            }

            /* Modifier */
            .btn--size-l {
                padding: 16px 56px;
            }

            .btn--size-s {
                padding: 8px 32px;
            }

            .btn:hover {
                opacity: 0.8;
            }

            .btn + .btn {
                margin-left: 16px;
            }

            .btn--success {
                background-color: #71be34;
            }

            .btn--warn {
                background-color: #ffb702;
            }

            .btn--danger {
                background-color: #ff623d;
            }

            .btn--disabled {
                opacity: 0.5 !important;
                cursor: default;
            }

            /* ======= Toast message ======== */

            #toast {
                position: fixed;
                top: 32px;
                right: 32px;
                z-index: 999999;
            }

            .toast {
                display: flex;
                align-items: center;
                background-color: #fff;
                border-radius: 2px;
                padding: 20px 0;
                min-width: 400px;
                max-width: 450px;
                border-left: 4px solid;
                box-shadow: 0 5px 8px rgba(0, 0, 0, 0.08);
                transition: all linear 0.3s;
            }

            @keyframes slideInLeft {
                from {
                    opacity: 0;
                    transform: translateX(calc(100% + 32px));
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes fadeOut {
                to {
                    opacity: 0;
                }
            }

            .toast--success {
                border-color: #47d864;
            }

            .toast--success .toast__icon {
                color: #47d864;
            }

            .toast--info {
                border-color: #2f86eb;
            }

            .toast--info .toast__icon {
                color: #2f86eb;
            }

            .toast--warning {
                border-color: #ffc021;
            }

            .toast--warning .toast__icon {
                color: #ffc021;
            }

            .toast--error {
                border-color: #ff623d;
            }

            .toast--error .toast__icon {
                color: #ff623d;
            }

            .toast + .toast {
                margin-top: 24px;
            }

            .toast__icon {
                font-size: 24px;
            }

            .toast__icon,
            .toast__close {
                padding: 0 16px;
            }

            .toast__body {
                flex-grow: 1;
            }

            .toast__title {
                font-size: 16px;
                font-weight: 600;
                color: #333;
            }

            .toast__msg {
                font-size: 14px;
                color: #888;
                margin-top: 6px;
                line-height: 1.5;
            }

            .toast__close {
                font-size: 20px;
                color: rgba(0, 0, 0, 0.3);
                cursor: pointer;
            }

        </style>
    </head>
    <body>
        <div id="toast"></div>

        <div>
            <div onclick="showSuccessToast();" class="btn btn--success">Show success toast</div>
            <div onclick="showErrorToast();" class="btn btn--danger">Show error toast</div>
        </div>

        <script>
            
            function showSuccessToast() {
                toast({
                    title: "",
                    message: "",
                    type: "",
                    duration: 0
                });
            }

            function showErrorToast() {
                toast({
                    title: "Thất bại!",
                    message: "Có lỗi xảy ra, vui lòng liên hệ quản trị viên.",
                    type: "error",
                    duration: 5000
                });
            }

            // Toast function
            function toast( { title = "", message = "", type = "info", duration = 3000 }) {
                const main = document.getElementById("toast");
                if (main) {
                    const toast = document.createElement("div");

                    // Auto remove toast
                    const autoRemoveId = setTimeout(function () {
                        main.removeChild(toast);
                    }, duration + 1000);

                    // Remove toast when clicked
                    toast.onclick = function (e) {
                        if (e.target.closest(".toast__close")) {
                            main.removeChild(toast);
                            clearTimeout(autoRemoveId);
                        }
                    };

                    const icons = {
                        success: "fas fa-check-circle",
                        info: "fas fa-info-circle",
                        warning: "fas fa-exclamation-circle",
                        error: "fas fa-exclamation-circle"
                    };
                    const icon = icons[type];
                    const delay = (duration / 1000).toFixed(2);

                    toast.classList.add("toast", `toast--${type}`);
                    toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;

                    toast.innerHTML = `
                        <div class="toast__icon">
                            <i class="${icon}"></i>
                        </div>
                        <div class="toast__body">
                            <h3 class="toast__title">${title}</h3>
                            <p class="toast__msg">${message}</p>
                        </div>
                        <div class="toast__close">
                            <i class="fas fa-times"></i>
                        </div>
                    `;
                    main.appendChild(toast);
                }
            }
        </script>
    </body>
</html>
