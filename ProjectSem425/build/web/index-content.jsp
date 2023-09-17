<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO" %>
<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> productList = productDAO.getProducts();
    List<Product> xiaomiList = productDAO.getXiaomiProducts();
    List<Product> samsungList = productDAO.getSamsungProducts();
    List<Product> appleList = productDAO.getAppleProducts();
%>
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="index.jsp">Home</a></li>                       
                <li><a href="store.jsp">Store</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="checkout.jsp">CheckOut</a></li>
                <li><a href="contact.jsp">Contact</a></li>

            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>

<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section" style="margin: 0">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="hot-deal">
                    <ul class="hot-deal-countdown">
                        <li>
                            <div>
                                <h3>02</h3>
                                <span>Days</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>10</h3>
                                <span>Hours</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>34</h3>
                                <span>Mins</span>
                            </div>
                        </li>
                        <li>
                            <div>
                                <h3>60</h3>
                                <span>Secs</span>
                            </div>
                        </li>
                    </ul>
                    <h2 class="text-uppercase">hot deal this week</h2>
                    <p>New Collection Up to 50% OFF</p>
                    <a class="primary-btn cta-btn" href="#">Shop now</a>
                </div>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->


<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="resources/img/xiaomi.png" alt="" class="img-fluid">
                    </div>
                    <div class="shop-body">
                        <h3>Xiaomi</h3>
                        <a href="store.jsp?brand=1" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="resources/img/samsung.png" alt="" class="img-fluid">
                    </div>
                    <div class="shop-body">
                        <h3>Samsung</h3>
                        <a href="store.jsp?brand=2" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->

            <!-- shop -->
            <div class="col-md-4 col-xs-6">
                <div class="shop">
                    <div class="shop-img">
                        <img src="resources/img/apple.png" alt="" class="img-fluid">
                    </div>
                    <div class="shop-body">
                        <h3>Apple</h3>
                        <a href="store.jsp?brand=3" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
            </div>
            <!-- /shop -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <!-- section title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Top selling</h3>
                </div>
            </div>
            <!-- /section title -->

            <!-- Products tab & slick -->
            <div class="col-md-12">
                <div class="row">
                    <div class="products-tabs">
                        <!-- tab -->
                        <div id="tab2" class="tab-pane fade in active">
                            <div class="products-slick" data-nav="#slick-nav-2">
                                <%
                                    if (productList != null) {
                                        for (Product product : productList) {
                                %>
                                <!-- product -->
                                <div class="product">
                                    <div class="product-img" style="padding-top: 20px;">
                                        <img src="resources/img/<%= product.getImageURL()%>" alt="">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="product.jsp?id=<%= product.getId()%>"><%= product.getProductName()%></a></h3>
                                        <h4 class="product-price">$<%= product.getPrice()%></h4>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product-btns">
                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                                        </div>
                                    </div>

                                    <form action="add-to-cart" method="post">
                                        <input type="hidden" name="productId" value="<%= product.getId()%>">
                                        <input type="hidden" name="productName" value="<%= product.getProductName()%>">
                                        <input type="hidden" name="productPrice" value="<%= product.getPrice()%>">
                                        <input type="hidden" name="productImage" value="<%= product.getPrice()%>">
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- /product -->
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div id="slick-nav-2" class="products-slick-nav"></div>
                        </div>
                        <!-- /tab -->
                    </div>
                </div>
            </div>
            <!-- /Products tab & slick -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Xiaomi</h4>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        <%
                            if (xiaomiList != null) {
                                for (Product xiaomi : xiaomiList) {
                        %>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="resources/img/<%= xiaomi.getImageURL()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.jsp?id=<%= xiaomi.getId()%>"><%= xiaomi.getProductName()%></a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price"><%= xiaomi.getPrice()%></del></h4>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Samsung</h4>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        <%
                            if (samsungList != null) {
                                for (Product samsung : samsungList) {
                        %>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="resources/img/<%= samsung.getImageURL()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.jsp?id=<%= samsung.getId()%>"><%= samsung.getProductName()%></a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price"><%= samsung.getPrice()%></del></h4>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>

            <div class="clearfix visible-sm visible-xs"></div>

            <div class="col-md-4 col-xs-6">
                <div class="section-title">
                    <h4 class="title">Apple</h4>
                </div>

                <div class="products-widget-slick" data-nav="#slick-nav-3">
                    <div>
                        <%
                            if (appleList != null) {
                                for (Product apple : appleList) {
                        %>
                        <!-- product widget -->
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="resources/img/<%= apple.getImageURL()%>" alt="">
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.jsp?id=<%= apple.getId()%>"><%= apple.getProductName()%></a></h3>
                                <h4 class="product-price">$980.00 <del class="product-old-price"><%= apple.getPrice()%></del></h4>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->