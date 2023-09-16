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

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author lemin
 */
 @WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String CategoryName = request.getParameter("CategoryName");
        String CategoryStatus = request.getParameter("CategoryStatus");
        

        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO category (CategoryName,CategoryStatus ) VALUES (?, ?)");
            pstmt.setString(1, CategoryName);
            pstmt.setString(2, CategoryStatus);
           
            pstmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("login.jsp");
    }

    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/javaproject";
        String user = "root";
        String password = "";
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
