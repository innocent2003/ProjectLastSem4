<%-- 
    Document   : addProduct
    Created on : Sep 18, 2023, 3:32:40 PM
    Author     : lemin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/javaproject"
         user = "root"  password = ""/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from brand;
         </sql:query>
            <sql:query dataSource = "${snapshot}" var = "result1">
            SELECT * from category;
         </sql:query>
            <form method="post" action="AddProductServlet">
            Product Name: <input type="text" name="ProductName"/><br>
            <select name="BrandId">
                <c:forEach var = "row" items = "${result.rows}">
                     <option value="${row.id}">${row.BrandName}</option>
                </c:forEach>
            </select>
            <select name="CategoryId">
                  <c:forEach var = "row" items = "${result1.rows}">
                     <option value="${row.id}">${row.CategoryName}</option>
                </c:forEach>
            </select>
            
           
            <br><!-- comment -->
            Price: <input type="number" name="Price"/>
            <input type="submit" value="Submit"/>
        </form>
            
            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/javaproject"
         user = "root"  password = ""/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from Product;
         </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th> ID</th>
            <th>Product Name</th>
             <th>Product Image</th>
            <th>Price</th>
            <th>Quantitiy</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td> <c:out value = "${row.Id}"/></td>
               <td> <c:out value = "${row.ProductName}"/></td>
               <td> <c:out value = "${row.Price}"/></td>
               <td></td>
            </tr>
         </c:forEach>
      </table>
    </body>
</html>
