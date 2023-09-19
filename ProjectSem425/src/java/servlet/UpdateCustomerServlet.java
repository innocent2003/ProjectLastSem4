/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author lemin
 */
public class UpdateCustomerServlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get updated customer information from the form
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        String jdbcUrl = "jdbc:mysql://your-database-host:3306/your-database";
        String dbUser = "your-username";
        String dbPassword = "your-password";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            // Prepare and execute the SQL update statement
            String updateSql = "UPDATE customers SET Name = ?, Address = ?, Phone = ?, Email = ? WHERE Id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateSql)) {
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, address);
                preparedStatement.setString(3, phone);
                preparedStatement.setString(4, email);
                preparedStatement.setInt(5, customerId);

                int rowsUpdated = preparedStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    // Update successful
                    response.sendRedirect("customer_list.jsp"); // Redirect to a page showing the updated customer list
                } else {
                    // No rows were updated, handle the error
                    response.getWriter().println("Update failed.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
