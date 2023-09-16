<%-- 
    Document   : login
    Created on : Aug 15, 2023, 3:27:43 PM
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
        <form method="POST" action="LoginServlet">
            <input type="text" name="Email"/>
            <input type="password" name="Password"/>
            <input type="submit"/>
        </form>
    </body>
</html>
