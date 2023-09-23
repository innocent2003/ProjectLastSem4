<%-- 
    Document   : register
    Created on : Aug 15, 2023, 3:27:52 PM
    Author     : lemin
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up</title>

        <!-- Font Icon -->
        <link href="resources/fonts/material-design-iconic-font.min.css" rel="stylesheet" type="text/css"/>
        <!-- Main css -->
        <link href="resources/css/styles.css" rel="stylesheet" type="text/css"/>

        <!-- Main css -->
        <link href="resources/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign Up</h2>
                        <form method="POST" class="register-form" id="register-form" action="AddCustomerServlet2">
                            <div class="form-group">
                                <label for="user"><i class="zmdi zmdi-account"></i></label>
                                <input type="text" name="username" id="user" placeholder="Username"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account-box-phone"></i></label>
                                <input type="text" name="name" id="name" placeholder="Fullname"/>
                            </div>
                            <div class="form-group">
                                <label for="address"><i class="zmdi zmdi-adb"></i></label>
                                <input type="text" name="address" id="address" placeholder="Address"/>
                            </div>
                            <div class="form-group">
                                <label for="phone"><i class="zmdi zmdi-phone"></i></label>
                                <input type="text" name="phone" id="phone" placeholder="Phone number"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="email" id="email" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">

                        <figure><img src="resources/img/signup-image.jpg" alt=""/></figure>                       
                        <a href="login/jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- JS -->
        <script src="resources/js/main.js" type="text/javascript"></script>
        <script src="resources/js/jquery.min.js" type="text/javascript"></script>
        <!-- Đầu tiên, thêm mã JavaScript của thư viện Swal -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            document.querySelector('.register-form').addEventListener('submit', function (event) {
                event.preventDefault();

                var username = document.querySelector('input[name="username"]').value;
                var password = document.querySelector('input[name="password"]').value;
                var rePassword = document.querySelector('input[name="re_pass"]').value;
                var fullname = document.querySelector('input[name="name"]').value;
                var address = document.querySelector('input[name="address"]').value;
                var phone = document.querySelector('input[name="phone"]').value;
                var email = document.querySelector('input[name="email"]').value;
                var agreeTerm = document.querySelector('input[name="agree-term"]').checked;

                if (!username || !password || !rePassword || !fullname || !address || !phone || !email || !agreeTerm) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Missing',
                        text: 'Please fill in all fields',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                if (username.length < 5 || username.length > 255) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Name',
                        text: 'Name must be between 5 and 255 characters',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                if (password.length < 5 || password.length > 255) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Length',
                        text: 'Password must be between 5 and 255 characters',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                if (password !== rePassword) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Missmatch',
                        text: 'Please make sure the passwords match',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                if (fullname.length < 10 || fullname.length > 255) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Name',
                        text: 'Name must be between 10 and 255 characters',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                if (address.length < 10 || address.length > 255) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Address',
                        text: 'Address must be between 10 and 255 characters',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                var phoneRegex = /^\d{10}$/;
                if (!phone.match(phoneRegex)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Phone',
                        text: 'Please enter a valid phone number',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!email.match(emailRegex)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Email',
                        text: 'Please enter a valid email address',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: true,
                    });
                    return;
                }

                fetch('AddCustomerServlet2', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'username=' + encodeURIComponent(username) +
                            '&password=' + encodeURIComponent(password) +
                            '&name=' + encodeURIComponent(fullname) +
                            '&address=' + encodeURIComponent(address) +
                            '&phone=' + encodeURIComponent(phone) +
                            '&email=' + encodeURIComponent(email)
                })
                        .then(function (response) {
                            if (response.ok) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Registration successful',
                                    text: 'You have successfully registered',
                                    timer: 2000,
                                    timerProgressBar: true,
                                    showConfirmButton: true,
                                }).then(function () {
                                    window.location.href = 'login.jsp';
                                });
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Registration failed',
                                    text: 'An error occurred while registering',
                                    timer: 2000,
                                    timerProgressBar: true,
                                    showConfirmButton: true,
                                });
                            }
                        })
                        .catch(function (error) {
                            console.error('Error:', error);
                        });
            });
        </script>
    </body>
</html>
