<%-- 
    Document   : customer-content
    Created on : Sep 18, 2023, 10:38:16 PM
    Author     : lemin
--%>

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
                <li><a href="checkout.jsp">CheckOut</a></li>
                <li class="active"><a href="contact.jsp">Contact</a></li>
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
                <h3 class="breadcrumb-header">Contact Us</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="../">Home</a></li>
                    <li class="active">Contact</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="container">
    <br />
    <div class="row">
        <div class="col-md-6">
            <div id="googleMap" style="width:100%; height:500px;"></div>
        </div>
        <br />
        <div class="col-md-6">
            <form class="my-form" method="post" action="">
                <div class="form-group">
                    <label for="form-name">Name</label>
                    <input type="hidden" class="form-control" id="form-name" placeholder="User_id">
                </div>
                <div class="form-group">
                    <label for="form-email">Email Address</label>
                    <input type="email" class="form-control" id="form-email" placeholder="Email Address">
                </div>
                <div class="form-group">
                    <label for="form-subject">Telephone</label>
                    <input type="text" class="form-control" id="form-subject" placeholder="Subject">
                </div>
                <div class="form-group">
                    <label for="form-message">Email your Message</label>
                    <textarea class="form-control" id="form-message" placeholder="Message"></textarea>
                </div>
                <button class="btn primary-btn" type="submit">Contact Us</button>                
            </form>
        </div>
    </div>
</div>

<h1><%= session.getAttribute("userId") %></h1>
<!-- /SECTION -->
