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
import java.sql.ResultSet;
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
@WebServlet(name = "UpdateQuantityServlet", urlPatterns = {"/admin/UpdateQuantityServlet"})
public class UpdateQuantityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy productId từ request parameters
        String productIdStr = request.getParameter("productId");

        try {
            int productId = Integer.parseInt(productIdStr);

            // Kết nối đến cơ sở dữ liệu MySQL bằng JDBC
            String jdbcUrl = "jdbc:mysql://localhost:3306/javaproject";
            String dbUser = "root";
            String dbPassword = "";

            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Lấy giá trị quantity từ bảng product_detail
            String getProductQuantitySQL = "SELECT Quantity FROM product_detail WHERE ProductId = ?";
            PreparedStatement getProductQuantityStatement = connection.prepareStatement(getProductQuantitySQL);
            getProductQuantityStatement.setInt(1, productId);

            ResultSet productQuantityResult = getProductQuantityStatement.executeQuery();

            int productQuantity = 0;

            if (productQuantityResult.next()) {
                productQuantity = productQuantityResult.getInt("Quantity");
            }

            // Lấy giá trị quantity từ bảng order_detail
            String getOrderQuantitySQL = "SELECT Quantity FROM order_detail WHERE ProductId = ?";
            PreparedStatement getOrderQuantityStatement = connection.prepareStatement(getOrderQuantitySQL);
            getOrderQuantityStatement.setInt(1, productId);

            ResultSet orderQuantityResult = getOrderQuantityStatement.executeQuery();

            int orderQuantity = 0;

            while (orderQuantityResult.next()) {
                orderQuantity += orderQuantityResult.getInt("Quantity");
            }

            // Trừ giá trị của orderQuantity ra khỏi productQuantity
            int newQuantity = productQuantity - orderQuantity;

            // Cập nhật giá trị mới vào bảng product_detail
            String updateQuantitySQL = "UPDATE product_detail SET Quantity = ? WHERE ProductId = ?";
            PreparedStatement quantityStatement = connection.prepareStatement(updateQuantitySQL);
            quantityStatement.setInt(1, newQuantity);
            quantityStatement.setInt(2, productId);

            // Thực thi truy vấn cập nhật
            int rowsUpdated = quantityStatement.executeUpdate();
            if (rowsUpdated > 0) {
                response.getWriter().println("Số lượng sản phẩm đã được cập nhật thành công.");
            } else {
                response.getWriter().println("Sản phẩm không tồn tại hoặc thao tác cập nhật thất bại.");
            }

            connection.close();
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().println("Dữ liệu đầu vào không hợp lệ.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi cơ sở dữ liệu: " + e.getMessage());
        }
    }
}
