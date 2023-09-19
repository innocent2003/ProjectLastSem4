/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lemin
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ProductName = request.getParameter("ProductName");
        String CategoryId = request.getParameter("CategoryId");
        String BrandId = request.getParameter("BrandId");
        String Price = request.getParameter("Price");

        try {
            Connection conn = getConnection();
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO product (ProductName,CategoryId ,BrandId, Price) VALUES (?, ?, ?,?)");
            pstmt.setString(1, ProductName);
            pstmt.setString(2, CategoryId);
            pstmt.setString(3, BrandId);
            pstmt.setString(4, Price);
            pstmt.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("addProduct.jsp");
    }

    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/javaproject";
        String user = "root";
        String password = "";
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
