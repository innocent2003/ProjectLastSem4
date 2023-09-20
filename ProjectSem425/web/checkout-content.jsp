<%@page import="dao.ProductDAO" %>
<%@page import="model.Customer"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession();
    Object userIdObj = session.getAttribute("userId");
    int userId = 0;
    if (userIdObj != null) {
        userId = (Integer) userIdObj;
    }
    ProductDAO productDAO = new ProductDAO();
    Customer cus = productDAO.getCustomerById(userId);
    String name = cus.getName();
    String email = cus.getEmail();
    String address = cus.getAddress();
    String telephone = cus.getTelephone();
    if (name == null) {
        name = "empty";
    }
    if (email == null) {
        email = "empty";
    }
    if (address == null) {
        address = "empty";
    }
    if (telephone == null) {
        telephone = "empty";
    }
%>
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="store.jsp">Store</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li class="active"><a href="checkout.jsp">CheckOut</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Checkout</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="../">Home</a></li>
                    <li class="active">Checkout</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-7">
                <!-- Customer Details -->
                <div class="billing-details">
                    <div class="section-title">
                        <h3 class="title">Customer</h3>
                    </div>
                    <div class="form-group">
                        <label>Name: </label>
                        <input class="input" type="text" name="last-name" placeholder="Name" readonly value="<%= name%>">
                    </div>
                    <div class="form-group">
                        <label>Email: </label>
                        <input class="input" type="email" name="email" placeholder="Email" readonly value="<%= email%>">
                    </div>
                    <div class="form-group">
                        <label>Address: </label>
                        <input class="input" type="readonly" name="address" placeholder="Address" readonly value="<%= address%>">
                    </div>
                    <div class="form-group">
                        <label>Telephone: </label>
                        <input class="input" type="tel" name="tel" placeholder="Telephone" readonly value="<%= telephone%>">
                    </div>
                </div>
                <!-- /Customer Details -->
            </div>

            <!-- Order Details -->
            <div class="col-md-5 order-details">
                <div class="section-title text-center">
                    <h3 class="title">Your Order</h3>
                </div>
                <div class="order-summary">
                    <div class="order-col">
                        <div><strong>PRODUCT</strong></div>
                        <div><strong>TOTAL</strong></div>
                    </div>
                    <div id="cartContainer" class="order-products"></div>
                    <div class="order-col">
                        <div>Shipping</div>
                        <div><strong>FREE</strong></div>
                    </div>
                    <div class="order-col">
                        <div><strong>TOTAL</strong></div>
                        <div><strong class="order-total">$0.00</strong></div>
                    </div>
                </div>
                <div class="payment-method">
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-1">
                        <label for="payment-1">
                            <span></span>
                            Direct Bank Transfer
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-2">
                        <label for="payment-2">
                            <span></span>
                            Cheque Payment
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                    <div class="input-radio">
                        <input type="radio" name="payment" id="payment-3">
                        <label for="payment-3">
                            <span></span>
                            Paypal System
                        </label>
                        <div class="caption">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                    </div>
                </div>
                <div class="input-checkbox">
                    <input type="checkbox" id="terms">
                    <label for="terms">
                        <span></span>
                        I've read and accept the <a href="#">terms & conditions</a>
                    </label>
                </div>
                <form id="myForm" action="processOrder" method="post">
                    <input type="hidden" id="userId" name="userId" value="<%= userId%>">
                    <input type="hidden" id="myHiddenField" name="myHiddenField">
                    <button type="submit" class="primary-btn order-submit" style="width: 100%">Place order</button>
                </form>

            </div>
            <!-- /Order Details -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
<script>
    var cart = JSON.parse(sessionStorage.getItem('cart')) || [];

    var cartContainer = document.getElementById('cartContainer');

    if (cart.length > 0) {
        for (var i = 0; i < cart.length; i++) {
            var cartItem = document.createElement('div');
            cartItem.className = 'order-col';
            var productInfo = document.createElement('div');
            productInfo.textContent = cart[i].quantity + 'x ' + cart[i].name;
            var productTotal = document.createElement('div');
            productTotal.textContent = '$' + (cart[i].quantity * cart[i].price).toFixed(2);
            cartItem.appendChild(productInfo);
            cartItem.appendChild(productTotal);
            cartContainer.appendChild(cartItem);
        }
        var orderTotal = cart.reduce(function (total, item) {
            return total + (item.quantity * item.price);
        }, 0);
        var orderTotalElement = document.querySelector('.order-total');
        orderTotalElement.textContent = '$' + orderTotal.toFixed(2);
    } else {
        cartContainer.textContent = "Cart is empty";
    }
    document.getElementById('myHiddenField').value = JSON.stringify(cart);
    console.log('myHiddenField value set:', document.getElementById('myHiddenField').value);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'processOrder', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.send('myHiddenField=' + encodeURIComponent(cart));

    console.log('XHR request sent.');

    document.getElementById('myForm').addEventListener('submit', function (event) {
        event.preventDefault();
        this.submit();
        console.log('Form submitted.');
    });
</script>