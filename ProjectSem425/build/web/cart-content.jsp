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
                <li class="active"><a href="cart.jsp">Cart</a></li>
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
                <h3 class="breadcrumb-header">Cart</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active">Cart</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->

<!-- container -->
<div class="container mb-4">
    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Image</th>
                            <th scope="col">Product</th>
                            <th scope="col" class="text-center">Ram</th>
                            <th scope="col" class="text-center">Storage</th>
                            <th scope="col" class="text-center">Color</th>
                            <th scope="col" class="text-center">Quantity</th>
                            <th scope="col" class="text-center">Price</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody id="cartItems1"></tbody>
                    <tfoot> 
                        <tr>
                            <td colspan="5"></td>
                            <td class="text-right"><b>Total:</b></td>
                            <td class="text-center" id="totalPrice1"></td>
                            <td id="clearBtn"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div class="col mb-2">
            <div class="row">
                <div class="col-sm-12  col-md-6">
                    <a href="store.jsp"><button class="btn btn-lg btn-block btn-light">Continue Shopping</button></a>
                </div>
                <div class="col-sm-12 col-md-6 text-right">
                    <a style="color: white" href="checkout.jsp"><button class="btn btn-lg btn-block primary-btn text-uppercase">Checkout</button></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /container -->

<!-- /SECTION -->


