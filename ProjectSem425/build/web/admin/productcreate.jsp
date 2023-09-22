<%-- 
    Document   : productcreate
    Created on : Sep 13, 2023, 12:11:17 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Tables</title>

        <!-- Custom fonts for this template-->
        <link href="../admin/vendor/all.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../admin/vendor/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>

        <!-- Custom styles for this page -->
        <link href="../admin/vendor/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="../">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Pages
                </div>

                <!-- Nav Item - Login -->
<!--                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">
                        <i class="fas fa-fw fa-sign-in-alt"></i>
                        <span>Login</span>
                    </a>
                </li>

                 Nav Item - Register 
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">
                        <i class="fas fa-fw fa-registered"></i>
                        <span>Register</span></a>
                </li>-->

                <!-- Nav Item - User -->
                <li class="nav-item">
                    <a class="nav-link" href="user.jsp">
                        <i class="fas fa-fw fa-user"></i>
                        <span>User</span></a>
                </li>

                <!-- Nav Item - Product -->
                <li class="nav-item">
                    <a class="nav-link" href="product.jsp">
                        <i class="fas fa-fw fa-bacon"></i>
                        <span>Product</span></a>
                </li>

                <!-- Nav Item - Order -->
                <li class="nav-item">
                    <a class="nav-link" href="order.jsp">
                        <i class="fas fa-fw fa-shopping-bag"></i>
                        <span>Order</span></a>
                </li>

                <!-- Nav Item - Category -->
                <li class="nav-item">
                    <a class="nav-link" href="category.jsp">
                        <i class="fas fa-fw fa-calendar-day"></i>
                        <span>Category</span></a>
                </li>

                <!-- Nav Item - Brand -->
                <li class="nav-item">
                    <a class="nav-link" href="brand.jsp">
                        <i class="fas fa-fw fa-braille"></i>
                        <span>Brand</span></a>
                </li>

                <!-- Nav Item - Comment -->
                <li class="nav-item">
                    <a class="nav-link" href="comment.jsp">
                        <i class="fas fa-fw fa-comments"></i>
                        <span>Comment</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline" >
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <!-- Topbar Search -->
                        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!-- Counter - Alerts -->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!-- Dropdown - Alerts -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Alerts Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 12, 2019</div>
                                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 7, 2019</div>
                                            $290.29 has been deposited into your account!
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-exclamation-triangle text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 2, 2019</div>
                                            Spending Alert: We've noticed unusually high spending for your account.
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                </div>
                            </li>

                            <!-- Nav Item - Messages -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-envelope fa-fw"></i>
                                    <!-- Counter - Messages -->
                                    <span class="badge badge-danger badge-counter">7</span>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                                    <h6 class="dropdown-header">
                                        Message Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_1.svg" alt="...">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                                            <div class="small text-gray-500">Emily Fowler · 58m</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
                                            <div class="status-indicator"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                                            <div class="small text-gray-500">Jae Chun · 1d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_3.svg" alt="...">
                                            <div class="status-indicator bg-warning"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                                            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                                            <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                                </div>
                            </li>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                    <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Product Management</h1>
                        </div>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Create</h6>
                            </div>
                            <div class="card-body">
                                <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/javaproject"
         user = "root"  password = ""/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from brand;
         </sql:query>
            <sql:query dataSource = "${snapshot}" var = "result1">
            SELECT * from category;
         </sql:query>
                            
                                <form class="row g-3 needs-validation" novalidate action="AddProductServlet2"" method="post" enctype="multipart/form-data">
                                    <div class="table-responsive">
                                        <div class="form-group d-flex">
                                            <label for="brand" class="col-md-3 text-md-right col-form-label">Brand</label>
                                            <div class="col-md-9 col-xl-8">
                                                <select required name="BrandId" id="brand_id" class="form-control">
<!--                                                    <option>-- Brand --</option>
                                                    <option>Samsung</option>
                                                    <option>Iphone</option>
                                                    <option>Sony</option>-->
                                                      <c:forEach var = "row" items = "${result.rows}">
                     <option value="${row.id}">${row.BrandName}</option>
                </c:forEach>
                                               
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="category" class="col-md-3 text-md-right col-form-label">Category</label>
                                            <div class="col-md-9 col-xl-8">
                                                <select required name="CategoryId" id="category_id" class="form-control">
                                                      <c:forEach var = "row" items = "${result1.rows}">
                     <option value="${row.id}">${row.CategoryName}</option>
                </c:forEach>
                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="name" class="col-md-3 text-md-right col-form-label">Image</label>
                                            <div class="col-md-9 col-xl-8">
                                                <input type="file" id="image" name="image" accept="image/*" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="productname" class="col-md-3 text-md-right col-form-label">Product Name</label>
                                            <div class="col-md-9 col-xl-8">
                                                <input type="text" name="productName" class="form-control rounded" placeholder="Product Name" aria-label="productname" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="price" class="col-md-3 text-md-right col-form-label">Price</label>
                                            <div class="col-md-9 col-xl-8">
                                                <input type="text" name="price" class="form-control rounded" placeholder="Price" aria-label="Price" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="qty" class="col-md-3 text-md-right col-form-label">Ram</label>
                                            <div class="col-md-9 col-xl-8">
                                                <input type="text" id="ram" name="ram" class="form-control rounded" placeholder="Ram" aria-label="Quantity" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="status" class="col-md-3 text-md-right col-form-label">Storage</label>
                                            <div class="col-md-9 col-xl-8">
                                                <input type="text" id="storage" name="storage" class="form-control rounded" placeholder="Storage" aria-label="Status" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="feature" class="col-md-3 text-md-right col-form-label">Color</label>
                                            <div class="col-md-9 col-xl-8">
                                                <input type="text" id="color" name="color" class="form-control rounded" placeholder="Feature" aria-label="Feature" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                        <div class="form-group d-flex">
                                            <label for="description" class="col-md-3 text-md-right col-form-label">Description</label>
                                            <div class="col-md-9 col-xl-8">
                                                <input type="text" class="form-control rounded" placeholder="Description" aria-label="Description" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body text-center">
                                        <button type="reset" class="btn btn-secondary">Cancer</button>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="../admin/vendor/jquery.min.js" type="text/javascript"></script>
        <script src="../admin/vendor/bootstrap.bundle.min.js" type="text/javascript"></script>

        <!-- Core plugin JavaScript-->
        <script src="../admin/vendor/jquery.easing.min.js" type="text/javascript"></script>

        <!-- Custom scripts for all pages-->
        <script src="../admin/vendor/sb-admin-2.min.js" type="text/javascript"></script>

        <!-- Page level plugins -->
        <script src="../admin/vendor/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../admin/vendor/dataTables.bootstrap4.min.js" type="text/javascript"></script>

        <!-- Page level custom scripts -->
        <script src="../admin/vendor/datatables-demo.js" type="text/javascript"></script>

    </body>

</html>
