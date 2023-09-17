            <%
                if (productList != null) {
                    for (Product pb : productList) {
            %>
            <!-- product -->
            <div class="col-md-3 col-xs-6">
                <div class="product">
                    <div class="product-img">
                        <img src="resources/img/<%= pb.getImageURL()%>" alt="">
                    </div>
                    <div class="product-body">
                        <h3 class="product-name"><a href="product.jsp?id=<%= pb.getId()%>"><%= pb.getProductName() %></a></h3>
                        <h4 class="product-price">$<%= pb.getPrice() %></h4>
                        <div class="product-rating">
                        </div>
                        <div class="product-btns">
                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></button>
                            <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></button>
                        </div>
                    </div>
                    <div class="add-to-cart">
                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                    </div>
                </div>
            </div>
            <!-- /product -->
            <div class="clearfix visible-sm visible-xs"></div>
            <%
                    }
                }
            %>