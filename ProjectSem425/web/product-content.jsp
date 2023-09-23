<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>

<%
    session = request.getSession();
    Object userIdObj = session.getAttribute("userId");
    int userId = 0;
    if (userIdObj != null) {
        userId = (Integer) userIdObj;
    }
    String productId = request.getParameter("id");
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.getProductById(productId);
    int avgvote = productDAO.calculateRoundedAverageVoteById(productId);
    int totalComment = productDAO.getTotalComments(productId);
    int totalVoteByRating1 = productDAO.getTotalVotesByRating(productId, 1);
    int totalVoteByRating2 = productDAO.getTotalVotesByRating(productId, 2);
    int totalVoteByRating3 = productDAO.getTotalVotesByRating(productId, 3);
    int totalVoteByRating4 = productDAO.getTotalVotesByRating(productId, 4);
    int totalVoteByRating5 = productDAO.getTotalVotesByRating(productId, 5);
    int brandId = product.getBrandId();
    String strBrandId = String.valueOf(brandId);
    List<Product> productList = productDAO.getProductsByBrandId(strBrandId);
    List<Product> rproductList = productDAO.getRandomProductsByBrandId(strBrandId);
    List<Comment> commentList = productDAO.getCommentsByProductId(productId);
    int recordsPerPage = 3;
    int totalRecords = commentList.size();
    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
    int currentPage = 1;

    if (request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
    }

    int startRecord = (currentPage - 1) * recordsPerPage;
    int endRecord = Math.min(startRecord + recordsPerPage, totalRecords);
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
<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Product</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="store.jsp?brand=0">Store</a></li>
                    <li class="active">Product</li>
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
            <!-- HTML -->
            <div class="col-md-5 col-md-push-2">
                <div id="product-main-img" class="product-carousel">
                    <%
                        List<String> imageList = product.getImageList();
                        for (String imageUrl : imageList) {
                    %>
                    <div class="product-preview">
                        <img src="resources/img/<%= imageUrl%>" alt="">
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <!-- Product thumb imgs -->
            <div class="col-md-2 col-md-pull-5">
                <div id="product-imgs" class="product-thumb-carousel">
                    <%
                        for (String imageUrl : imageList) {
                    %>
                    <div class="product-thumb">
                        <img src="resources/img/<%= imageUrl%>" alt="">
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <!-- /Product thumb imgs -->

            <!-- Product details -->
            <div class="col-md-5">
                <div class="product-details">
                    <h2 class="product-name"><%= product.getProductName()%></h2>
                    <div>
                        <div class="product-rating">
                            <% for (int i = 0; i < avgvote; i++) { %>
                            <i class="fa fa-star"></i>
                            <% } %>
                            <% for (int i = avgvote; i < 5; i++) { %>
                            <i class="fa fa-star-o"></i>
                            <% }%>
                        </div>
                        <span><%= totalComment%> Review(s)</span>
                    </div>
                    <div class="product-options">
                        <span>Ram: <b><%= product.getRam()%>GB</b></span>
                        <span style="margin-left: 20px; margin-right: 20px">Storage: <b><%= product.getStorage()%>GB</b></span>
                        <span>Color: <b><%= product.getColor()%></b></span>
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
                            <a href="login.jsp" class="add-to-cart-btn" style="display: inline-flex; justify-content: center; align-items: center;"><i class="fa fa-shopping-cart" style="padding-left: 20px"></i> Add to cart</a>
                        </div>
                        <%
                            }
                        %>
                    </form>

                    <ul class="product-btns">
                        <li><a href="#"><i class="fa fa-heart-o"></i> add to wishlist</a></li>
                        <li><a href="#"><i class="fa fa-exchange"></i> add to compare</a></li>
                    </ul>

                    <ul class="product-links">
                        <li>Category:</li>
                        <li><a href="#"><%= product.getCategoryName()%></a></li>
                    </ul>
                    <ul class="product-links">
                        <li>Brand:</li>
                        <li><a href="store.jsp?brand=<%= product.getBrandId()%>"><%= product.getBrandName()%></a></li>
                    </ul>

                    <ul class="product-links">
                        <li>Share:</li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                    </ul>

                </div>
            </div>
            <!-- /Product details -->

            <!-- Product tab -->
            <div class="col-md-12">
                <div id="product-tab">
                    <!-- product tab nav -->
                    <ul class="tab-nav">
                        <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                        <li><a data-toggle="tab" href="#tab3">(<%= totalComment%>) Review(s)</a></li>
                    </ul>
                    <!-- /product tab nav -->

                    <!-- product tab content -->
                    <div class="tab-content">
                        <!-- tab1  -->
                        <div id="tab1" class="tab-pane fade in active">
                            <div class="row">
                                <div class="col-md-12">
                                    <p><%= product.getDescription()%></p>
                                </div>
                            </div>
                        </div>
                        <!-- /tab1  -->

                        <!-- tab3  -->
                        <div id="tab3" class="tab-pane fade in">
                            <div class="row">
                                <!-- Rating -->
                                <div class="col-md-3">
                                    <div id="rating">
                                        <div class="rating-avg">
                                            <span><%= avgvote%></span>
                                            <div class="rating-stars">
                                                <% for (int i = 0; i < avgvote; i++) { %>
                                                <i class="fa fa-star"></i>
                                                <% } %>
                                                <% for (int i = avgvote; i < 5; i++) { %>
                                                <i class="fa fa-star-o"></i>
                                                <% }%>
                                            </div>
                                        </div>
                                        <ul class="rating">
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 100%;"></div>
                                                </div>
                                                <span class="sum"><%= totalVoteByRating5%></span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 80%;"></div>
                                                </div>
                                                <span class="sum"><%= totalVoteByRating4%></span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 60%;"></div>
                                                </div>
                                                <span class="sum"><%= totalVoteByRating3%></span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 40%;"></div>
                                                </div>
                                                <span class="sum"><%= totalVoteByRating2%></span>
                                            </li>
                                            <li>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="rating-progress">
                                                    <div style="width: 20%;"></div>
                                                </div>
                                                <span class="sum"><%= totalVoteByRating1%></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Rating -->

                                <!-- Reviews -->
                                <div class="col-md-6">
                                    <div id="reviews">
                                        <ul class="reviews">
                                            <%
                                                if (commentList != null) {
                                                    for (int i = startRecord; i < endRecord; i++) {
                                                        Comment c = commentList.get(i);
                                                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                                                        String createdAt = sdf.format(c.getCreateAt());

                                            %>
                                            <li>
                                                <div class="review-heading">
                                                    <h6 class="name"><%= c.getUserName()%></h6>
                                                    <p class="date"><%= createdAt%></p>
                                                    <div class="review-rating">
                                                        <% int vote = c.getVote(); %>
                                                        <% for (int j = 0; j < 5; j++) { %>
                                                        <% if (j < vote) { %>
                                                        <i class="fa fa-star"></i>
                                                        <% } else { %>
                                                        <i class="fa fa-star-o empty"></i>
                                                        <% } %>
                                                        <% }%>
                                                    </div>
                                                </div>
                                                <div class="review-body">
                                                    <p><%= c.getContent()%></p>
                                                </div>
                                            </li>
                                            <%
                                                    }
                                                }
                                            %>
                                        </ul>
                                        <ul class="reviews-pagination">
                                            <% for (int i = 1; i <= totalPages; i++) { %>
                                            <% if (i == currentPage) {%>
                                            <li class="active"><%= i%></li>
                                                <% } else {%>
                                            <li><a href="#" class="page-link" data-page="<%= i%>"><%= i%></a></li>
                                                <% } %>
                                                <% } %>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /Reviews -->

                                <!-- Review Form -->
                                <div class="col-md-3">
                                    <div id="review-form">
                                        <%
                                            if (userId != 0) {
                                        %>
                                        <form method="post" action="addComment" class="review-form">
                                            <input type="hidden" name="userId" value="<%= userId%>">
                                            <input type="hidden" name="productId" value="<%= productId%>">
                                            <textarea class="input" name="review" placeholder="Your Review"></textarea>
                                            <div class="input-rating">
                                                <span>Your Rating: </span>
                                                <div class="stars">
                                                    <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                    <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                    <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                    <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                    <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                </div>
                                            </div>
                                            <button type="submit" class="primary-btn">Submit</button>
                                        </form>
                                        <%
                                        } else {
                                        %>
                                        <a href="login.jsp"><button class="primary-btn">Login</button></a>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <!-- /Review Form -->
                            </div>
                        </div>
                        <!-- /tab3  -->
                    </div>
                    <!-- /product tab content  -->
                </div>
            </div>
            <!-- /product tab -->

        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">

            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">Related Products</h3>
                </div>
            </div>
            <%
                if (productList != null) {
                    for (Product pb : rproductList) {
            %>
            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <!-- product -->
                <div class="product">
                    <div class="product-img" style="padding-top: 20px;">
                        <a class="product-img" href="product.jsp?id=<%= pb.getId()%>"><img src="resources/img/<%= pb.getImageUrl()%>" alt=""></a>
                    </div>
                    <div class="product-body">
                        <h3 class="product-name"><a href="product.jsp?id=<%= pb.getId()%>"><%= pb.getProductName()%></a></h3>
                        <h5><%= pb.getRam()%>/<%= pb.getStorage()%> - <%= pb.getColor()%></h5>
                        <h4 class="product-price">$<%= pb.getPrice()%></h4>
                        <div class="product-rating">
                            <%
                                int vote = productDAO.calculateRoundedAverageVoteById(productId);
                            %>
                            <% for (int i = 0; i < vote; i++) { %>
                            <i class="fa fa-star"></i>
                            <% }%>
                            <% for (int i = vote; i < 5; i++) { %>
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
                        <input type="hidden" id="productId" name="productId" value="<%= pb.getId()%>">
                        <input type="hidden" id="productName" name="productName" value="<%= pb.getProductName()%>">
                        <input type="hidden" id="productPrice" name="productPrice" value="<%= pb.getPrice()%>">
                        <input type="hidden" id="productImage" name="productImage" value="resources/img/<%= pb.getImageUrl()%>">
                        <input type="hidden" id="productRam" name="productRam" value="<%= pb.getRam()%>">
                        <input type="hidden" id="productStorage" name="productStorage" value="<%= pb.getStorage()%>">
                        <input type="hidden" id="productColor" name="productColor" value="<%= pb.getColor()%>">
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
            <!-- /product -->
            <div class="clearfix visible-sm visible-xs"></div>
            <%
                    }
                }
            %>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
                                $(document).ready(function () {
                                    $(".review-form").submit(function (event) {
                                        event.preventDefault();

                                        var form = $(this);
                                        var formData = $(this).serialize();

                                        $.ajax({
                                            url: "addComment",
                                            type: "POST",
                                            data: formData,
                                            success: function (response) {
                                                if (response === "success") {
                                                    Swal.fire({
                                                        icon: 'success',
                                                        title: 'Success',
                                                        text: 'Comment has been added successfully',
                                                        timer: 2000,
                                                        timerProgressBar: true,
                                                        showConfirmButton: true,
                                                    }).then(function () {
                                                        setTimeout(function () {
                                                            location.reload();
                                                        });
                                                    });
                                                } else {
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Error',
                                                        text: response,
                                                        timer: 2000,
                                                        timerProgressBar: true,
                                                        showConfirmButton: true,
                                                    });
                                                }
                                            },
                                            error: function (xhr, status, error) {
                                                Swal.fire({
                                                    icon: 'error',
                                                    title: 'Error',
                                                    text: xhr.responseText,
                                                    timer: 2000,
                                                    timerProgressBar: true,
                                                    showConfirmButton: true,
                                                });
                                            }
                                        });
                                    });
                                });
                                $(document).ready(function () {
                                    $('#reviews').on('click', '.page-link', function (e) {
                                        e.preventDefault();

                                        var page = $(this).data('page');
                                        var url = 'product.jsp?id=<%= productId%>&page=' + page;

                                        $.ajax({
                                            url: url,
                                            type: 'GET',
                                            success: function (data) {
                                                $('#reviews').html($(data).find('#reviews').html());
                                            },
                                            error: function (xhr, status, error) {
                                                console.log(error);
                                            }
                                        });
                                    });
                                });
</script>
