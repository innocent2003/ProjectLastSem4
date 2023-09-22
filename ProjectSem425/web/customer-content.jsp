<%-- 
    Document   : customer-content
    Created on : Sep 18, 2023, 10:38:16 PM
    Author     : lemin
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="store.jsp?brand=0">Store</a></li>
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
                    <li><a href="index.jsp">Home</a></li>
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
            <form class="my-form" method="post" action="UpdateCustomerServlet">
<!--                <div class="form-group">
                    <label for="form-name">Name</label>
                    <input type="hidden" class="form-control" id="form-name" placeholder="User_id" value="<%= session.getAttribute("userId") %>">
                </div>-->
                <input type="text" value="<%= session.getAttribute("userId")  %>"/>
                <div class="form-group">
                    <label for="form-email">UserName</label>
                    <input type="text" name="name" class="form-control" id="form-email" placeholder="Username">
                </div>
                <div class="form-group">
                    <label for="form-subject">Password</label>
                    <input type="text" name="address" class="form-control" id="form-subject" placeholder="Address">
                </div>
              <div class="form-group">
                    <label for="form-subject">Phone number</label>
                    <input type="text" name="phone" class="form-control" id="form-subject" placeholder="Phone number">
                </div>
                <div class="form-group">
                    <label for="form-subject">Email</label>
                    <input type="text" name="email" class="form-control" id="form-subject" placeholder="Email">
                </div>
                <button class="btn primary-btn" type="submit">Contact Us</button>                
            </form>
        </div>
    </div>
</div>

<h1></h1>
<!-- /SECTION -->
