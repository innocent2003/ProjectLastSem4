<%-- 
    Document   : AddCategory
    Created on : Sep 16, 2023, 10:58:08 AM
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
        <form method="POST" action="AddCategoryServlet">
              <label>Category Name</label>
        <input type="text" name="CategoryName" /><br/>
        <label>Category Status</label>
        <input type="number" name="CategoryStatus"/><br/>
        <button type="submit" value="Add Category">Save</button>
        </form>
    </body>
</html>
