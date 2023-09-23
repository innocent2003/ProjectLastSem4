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
    <title>Sign Up Form by Colorlib</title>

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
                        <h2 class="form-title">Sign up</h2>
<!--                        <form method="POST" class="register-form" id="register-form" action="RegisterServlet">
                            <div class="form-group">
                                <label for="user"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="Username" id="user" placeholder="Username"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="Password" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>-->

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
                            
                            
                            
                            
<!--                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>-->
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
</body>
</html>
