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
        <form class="info-form" method="post" action="javascript:void(0);">
            <input type="hidden" name="customerId" value="<%= userId%>"/>
            <div class="form-group">
                <label for="form-email">Fullname</label>
                <input type="text" name="name" class="form-control" id="form-subject" value="<%= name%>">
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
        <form class="pwd-form" method="post" action="javascript:void(0);">
            <input type="hidden" name="customerId" value="<%= userId%>"/>
            <div class="form-group">
                <label for="form-password">Password</label>
                <input type="password" name="password" class="form-control" id="form-subject" placeholder="Type your new password">
            </div>
            <div class="form-group">
                <label for="form-password">Re-Password</label>
                <input type="password" name="re-password" class="form-control" id="form-subject" placeholder="Re-Type your new password">
            </div>
            <button class="btn primary-btn" type="submit">Change</button>                
        </form>
    </div>
</div>
</div>

<h1></h1>
<!-- /SECTION -->
<script>
    document.querySelector('.info-form').addEventListener('submit', function (event) {
        event.preventDefault();
        var customerId = document.querySelector('input[name="customerId"]').value;
        var name = document.querySelector('input[name="name"]').value;
        var address = document.querySelector('input[name="address"]').value;
        var phone = document.querySelector('input[name="phone"]').value;
        var email = document.querySelector('input[name="email"]').value;

        if (!customerId || !name || !address || !phone || !email) {
            Swal.fire({
                icon: 'error',
                title: 'Missing',
                text: 'Please fill in all fields',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        if (name.length < 10 || name.length > 255) {
            Swal.fire({
                icon: 'error',
                title: 'Name',
                text: 'Name must be between 10 and 255 characters',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        if (address.length < 10 || address.length > 255) {
            Swal.fire({
                icon: 'error',
                title: 'Address',
                text: 'Address must be between 10 and 255 characters',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        var phoneRegex = /^\d{10}$/;
        if (!phone.match(phoneRegex)) {
            Swal.fire({
                icon: 'error',
                title: 'Phone',
                text: 'Please enter a valid phone number',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!email.match(emailRegex)) {
            Swal.fire({
                icon: 'error',
                title: 'Email',
                text: 'Please enter a valid email address',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        fetch('UpdateCustomerServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'customerId=' + encodeURIComponent(customerId) +
                    '&name=' + encodeURIComponent(name) +
                    '&address=' + encodeURIComponent(address) +
                    '&phone=' + encodeURIComponent(phone) +
                    '&email=' + encodeURIComponent(email)
        })
                .then(function (response) {
                    if (response.ok) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Your information has been updated',
                            timer: 2000,
                            timerProgressBar: true,
                            showConfirmButton: true,
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Failed',
                            text: 'An error occurred while updating the information',
                            timer: 2000,
                            timerProgressBar: true,
                            showConfirmButton: true,
                        });
                    }
                }
                )
                .catch(function (error) {
                    console.error('Error:', error);
                });
    });
    document.querySelector('.pwd-form').addEventListener('submit', function (event) {
        event.preventDefault();

        var customerId = document.querySelector('input[name="customerId"]').value;
        var password = document.querySelector('input[name="password"]').value;
        var rePassword = document.querySelector('input[name="re-password"]').value;

        if (!password || !rePassword) {
            Swal.fire({
                icon: 'error',
                title: 'Empty',
                text: 'Please enter a password and confirm it',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        if (password.length < 5 || password.length > 255) {
            Swal.fire({
                icon: 'error',
                title: 'Length',
                text: 'Password must be between 5 and 255 characters',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        if (password !== rePassword) {
            Swal.fire({
                icon: 'error',
                title: 'Missmatch',
                text: 'Please make sure the passwords match',
                timer: 2000,
                timerProgressBar: true,
                showConfirmButton: true,
            });
            return;
        }

        fetch('changePassword', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'customerId=' + encodeURIComponent(customerId) +
                    '&password=' + encodeURIComponent(password)
        })
                .then(function (response) {
                    if (response.ok) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Password changed successfully',
                            timer: 2000,
                            timerProgressBar: true,
                            showConfirmButton: true,
                        });
                        document.querySelector('input[name="password"]').value = '';
                        document.querySelector('input[name="re-password"]').value = '';
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Failed',
                            text: 'An error occurred while changing the password',
                            timer: 2000,
                            timerProgressBar: true,
                            showConfirmButton: true,
                        });
                    }
                })
                .catch(function (error) {
                    console.error('Error:', error);
                });
    });
</script>
