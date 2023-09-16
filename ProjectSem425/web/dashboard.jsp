<%-- 
    Document   : dashboard
    Created on : Aug 17, 2023, 7:49:17 AM
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
        <%= session.getAttribute("userId") %>!</h1>
    <a href="/LogoutServlet">Logout</a>
    </body>
</html>
