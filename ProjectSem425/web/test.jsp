<%@page import="java.util.List"%>
<%@page import="model.CartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test Page</title>
</head>
<body>
    <h2>Cart List:</h2>
    <ul>
        <% for (CartItem cartItem : (List<CartItem>) request.getAttribute("cartList")) { %>
            <li>Product ID: <%= cartItem.getId() %></li>
            <li>Quantity: <%= cartItem.getQuantity() %></li>
            <li>Price: <%= cartItem.getPrice() %></li>
            <li>Subtotal: <%= cartItem.getPrice() * cartItem.getQuantity() %></li>
            <br>
        <% } %>
    </ul>
     <h2>Order ID: <%= request.getAttribute("orderId") %></h2>
</body>
</html>