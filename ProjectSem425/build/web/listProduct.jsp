<%-- 
    Document   : listProduct
    Created on : Aug 16, 2023, 7:23:55 PM
    Author     : lemin
--%>

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
         url = "jdbc:mysql://localhost/javaproject2"
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
               <td> <c:out value = "${row.id}"/></td>
               <td> <c:out value = "${row.ProductName}"/></td>
               <td> <img src="<c:out value = "${row.ProductImage}"/>"/></td>
               <td> <c:out value = "${row.Quantity}"/></td>
            </tr>
         </c:forEach>
      </table>
    </body>
</html>
