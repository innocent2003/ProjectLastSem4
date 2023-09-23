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
@WebServlet(name = "PlaceOrderServlet", urlPatterns = {"/admin/PlaceOrderServlet"})
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int orderedQuantity = Integer.parseInt(request.getParameter("orderedQuantity"));
//        int Status = Integer.parseInt(request.getParameter("Status"));
        
        try (Connection conn = DatabaseUtil.getConnection()) {
            if (conn != null) {
                // Kiểm tra xem có đủ số lượng sản phẩm để đặt hàng không
                String checkAvailabilityQuery = "SELECT QuantityAvailable FROM product_detail WHERE ProductId = ?";
                PreparedStatement checkAvailabilityStatement = conn.prepareStatement(checkAvailabilityQuery);
                checkAvailabilityStatement.setInt(1, productId);
                ResultSet availabilityResult = checkAvailabilityStatement.executeQuery();

                if (availabilityResult.next()) {
                    int quantityAvailable = availabilityResult.getInt("QuantityAvailable");

                    if (quantityAvailable >= orderedQuantity) {
                        // Cập nhật số lượng còn lại trong bảng product_detail
                        int updatedQuantity = quantityAvailable - orderedQuantity;
                        String updateQuantityQuery = "UPDATE product_detail SET QuantityAvailable = ? WHERE ProductId = ?";
                        PreparedStatement updateQuantityStatement = conn.prepareStatement(updateQuantityQuery);
                        updateQuantityStatement.setInt(1, updatedQuantity);
                        updateQuantityStatement.setInt(2, productId);
                        updateQuantityStatement.executeUpdate();

                        // Thực hiện việc lưu đơn đặt hàng vào bảng order_detail và các thao tác khác

                        // Điều hướng hoặc hiển thị thông báo thành công
                        response.sendRedirect("success.jsp");
                    } else {
                        // Xử lý trường hợp số lượng sản phẩm không đủ để đặt hàng
                        response.sendRedirect("error.jsp?message=Không đủ số lượng sản phẩm để đặt hàng");
                    }
                } else {
                    // Xử lý trường hợp không tìm thấy sản phẩm
                    response.sendRedirect("error.jsp?message=Sản phẩm không tồn tại");
                }
            } else {
                // Xử lý trường hợp kết nối cơ sở dữ liệu bị lỗi
                response.sendRedirect("error.jsp?message=Lỗi kết nối cơ sở dữ liệu");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý lỗi cơ sở dữ liệu
            response.sendRedirect("error.jsp?message=Lỗi cơ sở dữ liệu");
        }
    }
}
