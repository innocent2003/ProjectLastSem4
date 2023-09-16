/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author lemin
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Email = request.getParameter("Email");
        String Password = request.getParameter("Password");

        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaproject", "root", "");
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT id FROM customers WHERE Email=? AND Password=?");
            preparedStatement.setString(1, Email);
            preparedStatement.setString(2, Password);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int userId = resultSet.getInt("id");
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                response.sendRedirect("dashboard.jsp"); // Redirect to the dashboard or any other page
            } else {
                response.sendRedirect("login.jsp?error=1"); // Redirect back to the login page with an error parameter
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


