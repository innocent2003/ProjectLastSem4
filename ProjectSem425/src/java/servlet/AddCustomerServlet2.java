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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author lemin
 */
@WebServlet(name = "AddCustomerServlet2", urlPatterns = {"/AddCustomerServlet2"})
public class AddCustomerServlet2 extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        try {
            // Kết nối đến cơ sở dữ liệu MySQL
            String url = "jdbc:mysql://localhost:3306/javaproject";
            String dbUsername = "root";
            String dbPassword = "";
            Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Thêm dữ liệu vào bảng Users
            String insertUserQuery = "INSERT INTO users (Username, Password, Role) VALUES (?, ?, 'customer')";
            PreparedStatement userStatement = connection.prepareStatement(insertUserQuery);
            userStatement.setString(1, username);
            userStatement.setString(2, password);
            userStatement.executeUpdate();
            
            // Lấy ID của user vừa thêm
            int userId = 0;
            String getLastUserIdQuery = "SELECT LAST_INSERT_ID() AS User_id";
            PreparedStatement lastUserIdStatement = connection.prepareStatement(getLastUserIdQuery);
            if (lastUserIdStatement.execute()) {
                ResultSet resultSet = lastUserIdStatement.getResultSet();
                if (resultSet.next()) {
                    userId = resultSet.getInt("User_id");
                }
            }

            // Thêm dữ liệu vào bảng Customers
            String insertCustomerQuery = "INSERT INTO customers (User_id, Name, Address, Phone, Email) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement customerStatement = connection.prepareStatement(insertCustomerQuery);
            customerStatement.setInt(1, userId);
            customerStatement.setString(2, name);
            customerStatement.setString(3, address);
            customerStatement.setString(4, phone);
            customerStatement.setString(5, email);
            customerStatement.executeUpdate();

            // Đóng kết nối
            connection.close();
            
            // Chuyển hướng hoặc xuất thông báo thành công
            response.sendRedirect("success.jsp"); // Chuyển hướng đến trang thông báo thành công
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi và chuyển hướng hoặc xuất thông báo lỗi
            response.sendRedirect("error.jsp?message=Error occurred"); // Chuyển hướng đến trang thông báo lỗi
        }
    }
  
}
