<%-- 
    Document   : listUser
    Created on : Aug 16, 2023, 5:22:59 PM
    Author     : lemin
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
   <head>
      <title>JSTL sql</title>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/javaproject"
         user = "root"  password = ""/>

         <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from Customers;
         </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Emp ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td> <c:out value = "${row.id}"/></td>
               <td> <c:out value = "${row.Name}"/></td>
               <td> <c:out value = "${row.Email}"/></td>
               <td> <c:out value = "${row.Password}"/></td>
            </tr>
         </c:forEach>
      </table>

   </body>
</html>