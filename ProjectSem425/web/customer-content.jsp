<%@page import="model.Customer"%>
<%@page import="dao.ProductDAO"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
                <li><a href="store.jsp?brand=0">Store</a></li>
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
                <h3 class="breadcrumb-header">Profile</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active">Profile</li>
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
    <div class="col-md-6">
        <div class="section-title">
            <h3 class="title">Your information</h3>
        </div>
        <form class="my-form" method="post" action="UpdateCustomerServlet">
            <!--            <div class="form-group">
                                <label for="form-name">Name</label>
                                <input type="hidden" class="form-control" id="form-name" placeholder="User_id" value="">
                            </div>
            -->
            <input type="hidden" name="customerId" value="<%= userId%>"/>
            <div class="form-group">
                <label for="form-email">Fullname</label>
                <input type="text" name="name" class="form-control" id="form-email" value="<%= name%>">
            </div>
            <div class="form-group">
                <label for="form-subject">Address</label>
                <input type="text" name="address" class="form-control" id="form-subject" value="<%= address%>">
            </div>
            <div class="form-group">
                <label for="form-subject">Phone</label>
                <input type="text" name="phone" class="form-control" id="form-subject" value="<%= telephone%>">
            </div>
            <div class="form-group">
                <label for="form-subject">Email</label>
                <input type="text" name="email" class="form-control" id="form-subject" value="<%= email%>">
            </div>
            <button class="btn primary-btn" type="submit">Edit</button>                
        </form>
    </div>
    <div class="col-md-6">
        <div class="section-title">
            <h3 class="title">Change your password</h3>
        </div>
        <form method="post" action="UpdateCustomerServlet1">
            <input type="hidden" name="customerId" value="<%= userId%>"/>
            <div class="form-group">
                <label for="form-email">Password</label>
                <input type="password" name="password" class="form-control" id="form-email" placeholder="Type your new password">
            </div>
            <div class="form-group">
                <label for="form-subject">Re-Password</label>
                <input type="password" name="re-password" class="form-control" id="form-subject" placeholder="Re-Type your new password">
            </div>
            <button class="btn primary-btn" type="submit">Change</button>                
        </form>
    </div>
</div>
</div>

<h1></h1>
<!-- /SECTION -->
