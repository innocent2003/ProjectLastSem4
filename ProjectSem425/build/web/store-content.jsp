<%@page import="model.Brand"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO" %>
<%
    String brandId = request.getParameter("brand");
    ProductDAO productDAO = new ProductDAO();
    List<Product> productList = productDAO.getProductsByBrandId(brandId);
    List<Product> randomList = productDAO.get5RandomProducts();
    List<Brand> brandList = productDAO.getBrands();
    int recordsPerPage = 6;
    int totalRecords = productList.size();
    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
    int currentPage = 1;

    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }

    int startRecord = (currentPage - 1) * recordsPerPage;
    int endRecord = Math.min(startRecord + recordsPerPage, totalRecords);
%>
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>                       
                <li class="active"><a href="store.jsp?brand=0">Store</a></li>
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
                <h3 class="breadcrumb-header">Store</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active">Store</li>
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
                            <input type="checkbox" id="brand-0">
                            <label for="brand-0">
                                <a href="store.jsp?brand=0">All Brands</a>
                            </label>
                        </div>
                        <%
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
                        %>
                    </div>
                </div>
                <!-- /aside Widget -->

                <!-- aside Widget -->
                <div class="aside">
                    <h3 class="aside-title">Random</h3>
                    <%
                        if (randomList != null) {
                            for (Product product : randomList) {
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
            <div id="store" class="col-md-9 ">
                <!-- store products -->
                <div class="row">
                    <!-- SEARCH BAR -->
                    <div class="col-md-12">
                        <div class="header-search text-center">
                            <form method="post">
                                <input class="input" name="keywordInput" placeholder="Search here">
                                <button class="search-btn" type="submit" style="border-radius: 0">Search</button>
                            </form>
                        </div>
                    </div>
                    <!-- /SEARCH BAR -->
                    <div class="clearfix visible-sm visible-xs"></div>
                    <%
                        if (productList != null) {
                            for (int i = startRecord; i < endRecord; i++) {
                                Product product = productList.get(i);
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
                                    <%
                                        String productId = String.valueOf(product.getId());
                                        int vote = productDAO.calculateRoundedAverageVoteById(productId);
                                    %>
                                    <% for (int j = 0; j < vote; j++) { %>
                                    <i class="fa fa-star"></i>
                                    <% }%>
                                    <% for (int j = vote; j < 5; j++) { %>
                                    <i class="fa fa-star-o"></i>
                                    <% }%>
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
                        }
                    %>
                    <!-- /product -->
                </div>
                <!-- /store products -->

                <!-- store bottom filter -->
                <div class="store-filter clearfix">
                    <ul class="store-pagination">
                        <% for (int i = 1; i <= totalPages; i++) { %>
                        <% if (i == currentPage) {%>
                        <li class="active"><%= i%></li>
                            <% } else {%>
                        <li><a href="#" class="page-link" data-page="<%= i%>"><%= i%></a></li>
                            <% } %>
                            <% }%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
                                        $(document).ready(function () {
                                        $('#store').on('click', '.page-link', function (e) {
                                        e.preventDefault();
                                        var page = $(this).data('page');
                                        var brandId = '<%= request.getParameter("brand")%>';
                                        var url = 'store.jsp?brand=' + brandId + '&page=' + page;
                                        $.ajax({
                                        url: url,
                                                type: 'GET',
                                                success: function (data) {
                                                $('#store').html($(data).find('#store').html());
                                                },
                                                error: function (xhr, status, error) {
                                                console.log(error);
                                                }
                                        });
                                        });
                                        });
                                        document.querySelector('.search-btn').addEventListener('click', function(event) {
                                        event.preventDefault();
                                        var keyword = document.querySelector('.input').value;
                                        var category = document.querySelector('.input-select').value;
                                        searchProducts(keyword, category);
                                        });
</script>