/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
@WebServlet(name = "DeleteBrandServlet", urlPatterns = {"/admin/DeleteBrandServlet"})
public class DeleteBrandServlet extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the brand ID from the request parameter
        String brandIdStr = request.getParameter("brandId");

        try {
            int brandId = Integer.parseInt(brandIdStr);

            // JDBC Database Connection
            String jdbcUrl = "jdbc:mysql://localhost:3306/javaproject";
            String dbUser = "root";
            String dbPassword = "";

            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare SQL statement
            String sql = "DELETE FROM brand WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, brandId);

            // Execute the SQL query
            int rowsDeleted = preparedStatement.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("brand.jsp");
            } else {
                response.getWriter().println("Brand not found or delete operation failed.");
            }

            connection.close();
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Invalid brand ID.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
