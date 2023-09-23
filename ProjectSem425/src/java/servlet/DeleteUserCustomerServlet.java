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
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
/**
 *
 * @author lemin
 */
@WebServlet(name = "DeleteUserCustomerServlet", urlPatterns = {"/admin/DeleteUserCustomerServlet"})
public class DeleteUserCustomerServlet extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId"); // Lấy ID của người dùng muốn xóa

        // Kết nối đến cơ sở dữ liệu
        String jdbcURL = "jdbc:mysql://localhost:3306/javaproject";
        String dbUser = "root";
        String dbPassword = "";

        try {
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Truy vấn SQL để xóa dữ liệu từ cả bảng users và customers
            String deleteQuery = "DELETE users, customers FROM users LEFT JOIN customers ON users.Id = customers.User_id WHERE users.Id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setString(1, userId);
            preparedStatement.executeUpdate();

            // Đóng kết nối cơ sở dữ liệu
            connection.close();

            // Chuyển hướng người dùng đến trang thành công hoặc gửi thông báo thành công
            response.sendRedirect("user.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
