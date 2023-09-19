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
                        <li><a href="account.jsp"><i class="fa fa-user"></i>Welcome, <%= session.getAttribute("userName")%></a></li>
                        <li><a href="LogoutServlet"><i class="fa fa-user"></i>Logout</a></li>
                        <li><a href="customer.jsp"><i class="fa fa-user"></i>Customer detail</a></li>
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
                                <a href="#" class="logo">
                                    <img src="resources/img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form>
                                    <select class="input-select">
                                        <option value="0">All Categories</option>
                                        <option value="1">Category 01</option>
                                        <option value="1">Category 02</option>
                                    </select>
                                    <input class="input" placeholder="Search here">
                                    <button class="search-btn">Search</button>
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
                                    <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Cameras</a></li>
                                    <li><a href="#">Accessories</a></li>
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
        <script>
                                    var cart = JSON.parse(sessionStorage.getItem('cart')) || [];
                                    var cartItemsElement = document.getElementById('cartItems1');
                                    var totalPriceElement = document.getElementById('totalPrice1');

                                    function updateCart() {
                                        cartItemsElement.innerHTML = '';
                                        var totalAmount = 0;

                                        for (var i = 0; i < cart.length; i++) {
                                            var product = cart[i];

                                            var row = document.createElement('tr');

                                            var imageCell = document.createElement('td');
                                            var imageElement = document.createElement('img');
                                            imageElement.src = product.image;
                                            imageElement.alt = product.name;
                                            imageElement.style.width = '50px';
                                            imageElement.style.height = '50px';
                                            imageCell.appendChild(imageElement);
                                            row.appendChild(imageCell);

                                            var productNameCell = document.createElement('td');
                                            productNameCell.textContent = product.name;
                                            row.appendChild(productNameCell);

                                            var ramCell = document.createElement('td');
                                            ramCell.textContent = product.ram;
                                            row.appendChild(ramCell);

                                            var storageCell = document.createElement('td');
                                            storageCell.textContent = product.storage;
                                            row.appendChild(storageCell);

                                            var colorCell = document.createElement('td');
                                            colorCell.textContent = product.color;
                                            row.appendChild(colorCell);

                                            var quantityCell = document.createElement('td');
                                            quantityCell.textContent = product.quantity;
                                            row.appendChild(quantityCell);

                                            var priceCell = document.createElement('td');
                                            priceCell.className = 'text-center';
                                            priceCell.textContent = '$' + product.price;
                                            row.appendChild(priceCell);

                                            var actionCell = document.createElement('td');
                                            actionCell.className = 'text-right';
                                            var deleteButton = document.createElement('button');
                                            deleteButton.textContent = 'Delete';
                                            deleteButton.addEventListener('click', (function (index) {
                                                return function () {
                                                    removeFromCart(index);
                                                };
                                            })(i));
                                            actionCell.appendChild(deleteButton);
                                            row.appendChild(actionCell);

                                            cartItemsElement.appendChild(row);

                                            totalAmount += product.price * product.quantity;
                                        }

                                        totalPriceElement.textContent = '$' + totalAmount.toFixed(2);
                                    }

                                    function removeFromCart(index) {
                                        cart.splice(index, 1);
                                        sessionStorage.setItem('cart', JSON.stringify(cart));
                                        updateCart();
                                    }
                                    updateCart();
                                    
        </script>
        <script>
            window.onload = function () {
                                        var cart = getCart();
                                        updateCartUI(cart);
                                    };
                                    function addToCart(event) {
                                        event.preventDefault();

                                        var form = event.target.closest("form");
                                        var productId = form.querySelector("#productId").value;
                                        var productName = form.querySelector("#productName").value;
                                        var productPrice = form.querySelector("#productPrice").value;
                                        var productImage = form.querySelector("#productImage").value;
                                        var productRam = form.querySelector("#productRam").value;
                                        var productStorage = form.querySelector("#productStorage").value;
                                        var productColor = form.querySelector("#productColor").value;
                                        var cart = JSON.parse(sessionStorage.getItem('cart')) || [];

                                        var productExists = false;
                                        for (var i = 0; i < cart.length; i++) {
                                            if (cart[i].id === productId) {
                                                cart[i].quantity += 1;
                                                productExists = true;
                                                break;
                                            }
                                        }
                                        if (!productExists) {
                                            cart.push({
                                                id: productId,
                                                name: productName,
                                                price: productPrice,
                                                image: productImage,
                                                ram: productRam,
                                                storage: productStorage,
                                                color: productColor,
                                                quantity: 1
                                            });
                                        }

                                        sessionStorage.setItem('cart', JSON.stringify(cart));

                                        updateCartUI(cart);
                                    }

                                    function updateCartUI(cart) {
                                        var cartItemsContainer = document.getElementById('cartItems');
                                        var cartItemCountElement = document.getElementById('cartItemCount');
                                        var cartSelectedItems = document.getElementById('cartSelectedItems');
                                        var cartSubtotal = document.getElementById('cartSubtotal');

                                        var cartItemCount = 0;
                                        var selectedItemsCount = 0;
                                        var subtotal = 0;

                                        // Clear the cart items container
                                        while (cartItemsContainer.firstChild) {
                                            cartItemsContainer.removeChild(cartItemsContainer.firstChild);
                                        }

                                        // Iterate over each item in the cart
                                        for (var i = 0; i < cart.length; i++) {
                                            var item = cart[i];

                                            // Create the product widget
                                            var productWidget = document.createElement('div');
                                            productWidget.className = 'product-widget';

                                            // Create the product image element
                                            var productImageDiv = document.createElement('div');
                                            productImageDiv.className = 'product-img';
                                            var productImage = document.createElement('img');
                                            productImage.src = item.image;
                                            productImageDiv.appendChild(productImage);

                                            // Create the product body element
                                            var productBodyDiv = document.createElement('div');
                                            productBodyDiv.className = 'product-body';
                                            var productName = document.createElement('h3');
                                            productName.className = 'product-name';
                                            var productNameLink = document.createElement('a');
                                            productNameLink.href = 'product.jsp?id=' + item.id;
                                            productNameLink.textContent = item.name;
                                            productName.appendChild(productNameLink);
                                            var productInfor = document.createElement('h6');
                                            productInfor.textContent = item.ram + "/" + item.storage + " - " + item.color;
                                            var productPrice = document.createElement('h4');
                                            productPrice.className = 'product-price';
                                            var productQty = document.createElement('span');
                                            productQty.className = 'qty';
                                            productQty.textContent = item.quantity + 'x';
                                            var productPriceValue = document.createElement('span');
                                            productPriceValue.textContent = '$' + item.price;
                                            productPrice.appendChild(productQty);
                                            productPrice.appendChild(productPriceValue);

                                            // Create the delete button
                                            var deleteButton = document.createElement('button');
                                            deleteButton.className = 'delete';
                                            var deleteIcon = document.createElement('i');
                                            deleteIcon.className = 'fa fa-close';
                                            deleteButton.appendChild(deleteIcon);
                                            deleteButton.addEventListener('click', createDeleteHandler(item));

                                            // Append elements to the product widget
                                            productWidget.appendChild(productImageDiv);
                                            productWidget.appendChild(productBodyDiv);
                                            productBodyDiv.appendChild(productName);
                                            productBodyDiv.appendChild(productInfor);
                                            productBodyDiv.appendChild(productPrice);
                                            productWidget.appendChild(deleteButton);

                                            // Append the product widget to the cart items container
                                            cartItemsContainer.appendChild(productWidget);

                                            // Update item count and subtotal
                                            cartItemCount += item.quantity;
                                            selectedItemsCount++;
                                            subtotal += item.quantity * item.price;
                                        }

                                        // Update the UI with the updated values
                                        cartItemCountElement.textContent = cartItemCount;
                                        cartSelectedItems.textContent = selectedItemsCount + ' Item(s) selected';
                                        cartSubtotal.textContent = 'SUBTOTAL: $' + subtotal;
                                    }

                                    function createDeleteHandler(item) {
                                        return function () {
                                            removeFromCart(item);
                                            updateCartUI(getCart());
                                        };
                                    }

                                    function removeFromCart(item) {
                                        var cart = getCart();
                                        var index = -1;

                                        // Find the index of the item in the cart
                                        for (var i = 0; i < cart.length; i++) {
                                            if (cart[i].id === item.id) {
                                                index = i;
                                                break;
                                            }
                                        }

                                        // Remove the item from the cart if found
                                        if (index !== -1) {
                                            cart.splice(index, 1);
                                            sessionStorage.setItem('cart', JSON.stringify(cart));
                                        }
                                    }

                                    function getCart() {
                                        return JSON.parse(sessionStorage.getItem('cart')) || [];
                                    }
        </script>
    </body>
</html>
