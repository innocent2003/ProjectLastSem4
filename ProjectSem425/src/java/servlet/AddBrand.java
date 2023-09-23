/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
@WebServlet(name = "AddBrand", urlPatterns = {"/admin/AddBrand"})
public class AddBrand extends HttpServlet {

// private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String brandName = request.getParameter("brandName");
        int status = Integer.parseInt(request.getParameter("status"));

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Replace with your database connection details
            String jdbcUrl = "jdbc:mysql://localhost:3306/javaproject";
            String dbUser = "root";
            String dbPassword = "";

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the database connection
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // SQL query to insert the brand
            String sql = "INSERT INTO brand (BrandName, Status) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, brandName);
            pstmt.setInt(2, status);

            // Execute the SQL statement
            pstmt.executeUpdate();

            // Redirect to a success page
            response.sendRedirect("brand.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions (e.g., display an error message)
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
