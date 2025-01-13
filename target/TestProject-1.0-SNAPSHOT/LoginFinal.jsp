<%-- 
    Document   : LoginFinal
    Created on : Oct 10, 2024, 3:40:21 AM
    Author     : Nguyen Huy Hoang - CE182102
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

        <style>
            @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

            * {
                box-sizing: border-box;
            }

            body {
                background: #f6f5f7;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                font-family: 'Montserrat', sans-serif;
                height: 100vh;
                margin: -20px 0 50px;
            }

            h1 {
                font-weight: bold;
                margin: 0;
            }

            h2 {
                text-align: center;
            }

            p {
                font-size: 14px;
                font-weight: 100;
                line-height: 20px;
                letter-spacing: 0.5px;
                margin: 20px 0 30px;
            }

            span {
                font-size: 12px;
            }

            a {
                color: #333;
                font-size: 14px;
                text-decoration: none;
                margin: 15px 0;
            }

            button {
                border-radius: 20px;
                border: 1px solid #d4af7a;
                background-color: #d4af7a;
                color: #FFFFFF;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
            }

            button:active {
                transform: scale(0.95);
            }

            button:focus {
                outline: none;
            }

            button:hover {
                transition: all 0.2s ease-in;
                background-color: #c2a06f;
                cursor: pointer;
            }

            button.ghost {
                background-color: transparent;
                border-color: #FFFFFF;
            }

            form {
                background-color: #FFFFFF;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 50px;
                height: 100%;
                text-align: center;
            }

            input {
                background-color: #eee;
                border: none;
                padding: 12px 15px;
                margin: 8px 0;
                width: 100%;
            }
            
            .password-container {
                position: relative;
                background-color: #eee;
                border: none;
                margin: 8px 0;
                width: 100%;
            }
            
            .password-container input {
                margin: 0;
            }

            .toggle-password {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 18px;
            }

            .forgetLink {
                transition: transform 80ms ease-in;
            }

            .forgetLink:hover {
                transition: all 0.2s ease-in;
                color: #c2a06f;
                cursor: pointer;
            }

            .container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25),
                    0 10px 10px rgba(0, 0, 0, 0.22);
                position: relative;
                overflow: hidden;
                width: 768px;
                max-width: 100%;
                min-height: 480px;
            }

            .form-container {
                position: absolute;
                top: 0;
                height: 100%;
                transition: all 0.6s ease-in-out;
            }

            .log-in-container {
                left: 0;
                width: 50%;
                z-index: 2;
            }

            .container.right-panel-active .log-in-container {
                transform: translateX(100%);
            }

            .sign-up-container {
                left: 0;
                width: 50%;
                opacity: 0;
                z-index: 1;
            }

            .container.right-panel-active .sign-up-container {
                transform: translateX(100%);
                opacity: 1;
                z-index: 5;
                animation: show 0.6s;
            }

            @keyframes show {

                0%,
                49.99% {
                    opacity: 0;
                    z-index: 1;
                }

                50%,
                100% {
                    opacity: 1;
                    z-index: 5;
                }
            }

            .overlay-container {
                position: absolute;
                top: 0;
                left: 50%;
                width: 50%;
                height: 100%;
                overflow: hidden;
                transition: transform 0.6s ease-in-out;
                z-index: 100;
            }

            .container.right-panel-active .overlay-container {
                transform: translateX(-100%);
            }

            .overlay {
                background: #FF416C;
                background: -webkit-linear-gradient(to right, rgba(212, 175, 55, 0.6), rgba(0, 0, 0, 0.6));
                background: linear-gradient(to right, rgba(212, 175, 55, 0.6), rgba(0, 0, 0, 0.6));
                background-repeat: no-repeat;
                background-size: cover;
                background-position: 0 0;
                color: #FFFFFF;
                position: relative;
                left: -100%;
                height: 100%;
                width: 200%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .container.right-panel-active .overlay {
                transform: translateX(50%);
            }

            .overlay-panel {
                position: absolute;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 40px;
                text-align: center;
                top: 0;
                height: 100%;
                width: 50%;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }

            .overlay-left {
                transform: translateX(-20%);
            }

            .container.right-panel-active .overlay-left {
                transform: translateX(0);
            }

            .overlay-right {
                right: 0;
                transform: translateX(0);
            }

            .container.right-panel-active .overlay-right {
                transform: translateX(20%);
            }

            .social-container {
                margin: 20px 0;
            }

            .social-container a {
                border: 1px solid #DDDDDD;
                border-radius: 50%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                margin: 0 5px;
                height: 40px;
                width: 40px;
            }

            .social-container a:hover {
                background-color: #d4af7a;
                color: #fff;
                transition: all 0.3s ease-in;
            }

        </style>
    </head>

    <body>
        <!--Sign Up-->
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="auth" method="post">
                    <h1>Create Account</h1>
                    <div class="social-container">
                        <a href="https://www.facebook.com/v21.0/dialog/oauth?client_id=566088429416938&redirect_uri=http://localhost:8080/TestProject/loginFacebookHandlerServlet" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/TestProject/loginGoogleHandlerServlet&response_type=code&client_id=349879213313-1udse0mkno5tn30lqr8co4tj6inodedv.apps.googleusercontent.com&approval_prompt=force" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <!--<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>-->
                    </div>
                    <span>or use your email for registration</span>

                    <!--Input-->
                    <input type="hidden" name="action" value="signup"/>
                    <input type="text" placeholder="Name (8-50 chars)" name="name"/>
                    <input type="email" placeholder="Email" name="email"/>
                    <input type="password" placeholder="Password (8-50 chars)" name="password"/>
                    <button style="margin-top: 20px;">Sign Up</button>
                </form>
            </div>

            <!--Log In-->
            <div class="form-container log-in-container">
                <form action="auth" method="post">
                    <h1>Log In</h1>
                    <div class="social-container">
                        <a href="https://www.facebook.com/v21.0/dialog/oauth?client_id=566088429416938&redirect_uri=http://localhost:8080/TestProject/loginFacebookHandlerServlet" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/TestProject/loginGoogleHandlerServlet&response_type=code&client_id=349879213313-1udse0mkno5tn30lqr8co4tj6inodedv.apps.googleusercontent.com&approval_prompt=force" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <!--<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>-->
                    </div>
                    <span>or use your account</span>

                    <!--Input-->
                    <input type="hidden" name="action" value="login"/>
                    <input type="email" placeholder="Email" name="email" />
                    <div class="password-container">
                        <input type="password" placeholder="Password" name="password" required>
                        <span class="toggle-password">
                            <i class="fa-regular fa-eye"></i>
                        </span>
                    </div>
                    <!--<input type="password" placeholder="Password" name="password" />-->
                    <a href="forgetPassword.jsp" class="forgetLink">Forgot your password?</a>
                    <button>Log In</button>
                </form>
            </div>

            <!--Overlay-->
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Log In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const togglePasswordIcons = document.querySelectorAll('.toggle-password');

            togglePasswordIcons.forEach(toggle => {
                toggle.addEventListener('click', function () {
                    const passwordField = this.previousElementSibling;
                    const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordField.setAttribute('type', type);

                    // Toggle the icon
                    if (type === 'password') {
                        this.innerHTML = '<i class="fa-regular fa-eye"></i>';
                    } else {
                        this.innerHTML = '<i class="fa-regular fa-eye-slash"></i>';
                    }
                });
            });


            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');

            signUpButton.addEventListener('click', () => {
                container.classList.add("right-panel-active");
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove("right-panel-active");
            });
        </script>
    </body>
</html>