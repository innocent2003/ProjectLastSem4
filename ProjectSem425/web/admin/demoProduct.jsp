<%-- 
    Document   : demoProduct
    Created on : Sep 19, 2023, 9:20:27 PM
    Author     : lemin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="AddProductServlet2"" method="post" enctype="multipart/form-data">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required><br><br>
        <input type="number" name="CategoryId"/>
        <input type="number" name="BrandId"/>
        <label for="ram">RAM:</label>
        <input type="text" id="ram" name="ram" required><br><br>

        <label for="storage">Storage:</label>
        <input type="text" id="storage" name="storage" required><br><br>

        <label for="color">Color:</label>
        <input type="text" id="color" name="color" required><br><br>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" required><br><br>

        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br><br>

        <input type="submit" value="Add Product">
    </form>
        
        
        <form action="DeleteDetailImage" method="post">
    <input type="text" name="productId" placeholder="Nhập ID sản phẩm cần xóa">
    <input type="submit" value="Xóa sản phẩm">
</form>
    </body>
</html>