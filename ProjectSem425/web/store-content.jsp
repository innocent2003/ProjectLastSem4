<%@page import="model.Brand"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO" %>
<%
    String brandId = request.getParameter("brand");
    ProductDAO productDAO = new ProductDAO();
    List<Product> productList = productDAO.getProducts();
    List<Product> xiaomiList = productDAO.getXiaomiProducts();
    List<Product> samsungList = productDAO.getSamsungProducts();
    List<Product> appleList = productDAO.getAppleProducts();
    List<Brand> brandList = productDAO.getBrands();
    List<Product> finalList = null;
%>
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>                       
                <li class="active"><a href="store.jsp">Store</a></li>
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

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active"><a href="store.jsp">Store</a></li>
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
            <!-- ASIDE -->
            <div id="aside" class="col-md-3">
                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Brand</h3>
                    <div class="checkbox-filter">
                        <div class="input-checkbox">
                            <input type="checkbox" id="brand-1">
                            <label for="brand-1">
                                <a href="store.jsp">All</a>
                            </label>
                        </div>
                        <%
                            if (brandList != null) {
                                for (Brand brand : brandList) {
                        %>
                        <div class="input-checkbox">
                            <input type="checkbox" id="brand-1">
                            <label for="brand-1">
                                <a href="store.jsp?brand=<%= brand.getId()%>"><%= brand.getBrandName()%></a>
                            </label>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Top selling</h3>
                    <%
                        if (productList != null) {
                            for (Product product : productList) {
                    %>
                    <div class="product-widget">
                        <div class="product-img">
                            <a class="product-img" href="product.jsp?id=<%= product.getId()%>"><img src="resources/img/<%= product.getImageUrl()%>" alt=""></a>
                        </div>
                        <div class="product-body">
                            <h3 class="product-name"><a href="product.jsp?id=<%= product.getId()%>"><%= product.getProductName()%></a></h3>
                            <h6><%= product.getRam()%>/<%= product.getStorage()%> - <%= product.getColor()%></h6>
                            <h4 class="product-price">$<%= product.getPrice()%></h4>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <!-- /aside Widget -->
            </div>
            <!-- /ASIDE -->

            <!-- STORE -->
            <div id="store" class="col-md-9">
                <!-- store products -->
                <div class="row">
                    <div class="clearfix visible-sm visible-xs"></div>
                    <%
                        if (brandId != null) {
                            if (brandId.equals("1")) {
                                finalList = xiaomiList;
                            } else if (brandId.equals("2")) {
                                finalList = samsungList;
                            } else if (brandId.equals("3")) {
                                finalList = appleList;
                            } else {
                                finalList = productList;
                            }
                        } else {
                            finalList = productList;
                        }
                        for (Product product : finalList) {
                    %>
                    <!-- product -->
                    <div class="col-md-4 col-xs-6">
                        <!-- product -->
                        <div class="product">
                            <div class="product-img" style="padding-top: 20px;">
                                <a class="product-img" href="product.jsp?id=<%= product.getId()%>"><img src="resources/img/<%= product.getImageUrl()%>" alt=""></a>
                            </div>
                            <div class="product-body">
                                <h3 class="product-name"><a href="product.jsp?id=<%= product.getId()%>"><%= product.getProductName()%></a></h3>
                                <h5><%= product.getRam()%>/<%= product.getStorage()%> - <%= product.getColor()%></h5>
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

                            <form id="add-to-cart-form" method="post">
                                <input type="hidden" id="productId" name="productId" value="<%= product.getId()%>">
                                <input type="hidden" id="productName" name="productName" value="<%= product.getProductName()%>">
                                <input type="hidden" id="productPrice" name="productPrice" value="<%= product.getPrice()%>">
                                <input type="hidden" id="productImage" name="productImage" value="resources/img/<%= product.getImageUrl()%>">
                                <input type="hidden" id="productRam" name="productRam" value="<%= product.getRam()%>">
                                <input type="hidden" id="productStorage" name="productStorage" value="<%= product.getStorage()%>">
                                <input type="hidden" id="productColor" name="productColor" value="<%= product.getColor()%>">
                                <%
                                    if (session.getAttribute("userId") != null) {
                                %>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn" onclick="addToCart(event)"><i class="fa fa-shopping-cart"></i> Add to cart</button>
                                </div>
                                <%
                                } else {
                                %>
                                <div class="add-to-cart">
                                    <a href="login.jsp" class="add-to-cart-btn" style="display: inline-flex; justify-content: center; align-items: center;"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </div>
                                <%
                                    }
                                %>
                            </form>
                        </div>
                        <!-- /product -->
                    </div>
                    <%
                        }
                    %>
                    <!-- /product -->
                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <div class="store-filter clearfix">
                    <ul class="store-pagination">
                        <li class="active">1</li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                <!-- /store bottom filter -->
            </div>
            <!-- /STORE -->
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->