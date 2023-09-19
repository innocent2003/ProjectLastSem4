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
public class AddCustomerServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thông tin kết nối cơ sở dữ liệu
        String url = "jdbc:mysql://localhost:3306/your_database";
        String username = "your_username";
        String password = "your_password";

        try {
            // Kết nối đến cơ sở dữ liệu
            Connection connection = DriverManager.getConnection(url, username, password);

            // Dữ liệu từ giao diện người dùng
            String usernameParam = request.getParameter("Username");
            String passwordParam = request.getParameter("Password");
            String roleParam = request.getParameter("Role");
            String nameParam = request.getParameter("Name");
            String addressParam = request.getParameter("Address");
            String phoneParam = request.getParameter("Phone");
            String emailParam = request.getParameter("Email");

            // Chèn dữ liệu vào bảng Users
            String insertUserQuery = "INSERT INTO Users (Username, Password, Role) VALUES (?, ?, ?)";
            PreparedStatement userStatement = connection.prepareStatement(insertUserQuery);
            userStatement.setString(1, usernameParam);
            userStatement.setString(2, passwordParam);
            userStatement.setString(3, roleParam);
            userStatement.executeUpdate();

            // Lấy ID của user vừa chèn
            String getLastUserIdQuery = "SELECT LAST_INSERT_ID() AS User_id";
            PreparedStatement lastUserIdStatement = connection.prepareStatement(getLastUserIdQuery);
            int userId = 0;
            if (lastUserIdStatement.execute()) {
                ResultSet resultSet = lastUserIdStatement.getResultSet();
                if (resultSet.next()) {
                    userId = resultSet.getInt("User_id");
                }
            }

            // Chèn dữ liệu vào bảng Customers, sử dụng khóa chính từ bảng Users
            String insertCustomerQuery = "INSERT INTO Customers (User_id, Name, Address, Phone, Email) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement customerStatement = connection.prepareStatement(insertCustomerQuery);
            customerStatement.setInt(1, userId);
            customerStatement.setString(2, nameParam);
            customerStatement.setString(3, addressParam);
            customerStatement.setString(4, phoneParam);
            customerStatement.setString(5, emailParam);

            customerStatement.executeUpdate();

            // Đóng kết nối
            connection.close();

            // Chuyển hướng đến trang kết quả
            response.sendRedirect("result.jsp?message=Success");
        } catch (Exception e) {
            // Xử lý ngoại lệ
            e.printStackTrace();
            response.sendRedirect("result.jsp?message=Error");
        }
    }
}
