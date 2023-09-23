<%-- 
    Document   : layout
    Created on : Sep 16, 2023, 9:36:31 AM
    Author     : Expguy
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smartphone</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="resources/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="resources/css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="resources/css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="resources/css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.css">
        <link type="text/css" rel="stylesheet" href="resources/css/myCss.css"/>
    </head>
    <body>
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +012-345-6789</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> 123 Washington D.C</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <% if (session.getAttribute("userId") != null) {%>
                        <li><a href="customer.jsp"><i class="fa fa-user"></i>Welcome, <%= session.getAttribute("userName")%></a></li>
                        <li><a href="LogoutServlet" id="logoutLink"><i class="fa fa-user"></i>Logout</a></li>
                            <% } else { %>
                        <li><a href="login.jsp"><i class="fa fa-user"></i> Login</a></li>
                        <li><a>|</a></li>
                        <li><a href="register.jsp"><i class="fa fa-user"></i> Register</a></li>
                            <% }%>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="index.jsp">
                                    <img src="resources/img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->
                        
                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search text-center">
                                <form method="post">
                                    <input class="input" name="keywordInput" placeholder="Search here">
                                    <button class="search-btn" type="submit" style="border-radius: 0">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">

                            <!-- Cart -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty" id="cartItemCount">0</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list" id="cartItems">
                                        </div>
                                        <div class="cart-summary">
                                            <small id="cartSelectedItems">0 Item(s) selected</small>
                                            <h5 id="cartSubtotal">TOTAL: $0.00</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="cart.jsp">View Cart</a>
                                            <a href="checkout.jsp">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->
        <jsp:include page="${contentPage}" />

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>123 Washington D.C</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+012-345-6789</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Accessories</a></li>
                                    <li><a href="#">Other</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->
        <script src="resources/js/jquery.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/slick.min.js"></script>
        <script src="resources/js/nouislider.min.js"></script>
        <script src="resources/js/jquery.zoom.min.js"></script>
        <script src="resources/js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.19/dist/sweetalert2.min.js"></script>
        <script src="resources/js/myJs.js"></script>
        <script>
                                    document.getElementById('logoutLink').addEventListener('click', function () {
                                        cart = [];
                                        sessionStorage.removeItem('cart');
                                    });
        </script>
    </body>
</html>
