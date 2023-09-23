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
@WebServlet(name = "DeleteDetailImage", urlPatterns = {"/admin/DeleteDetailImage"})
public class DeleteDetailImage extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productIdToDelete = Integer.parseInt(request.getParameter("productId"));

        Connection connection = null;
        try {
            // Kết nối đến cơ sở dữ liệu
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaproject", "root", "");

            // Tắt chế độ tự động commit để quản lý giao dịch
            connection.setAutoCommit(false);

            // Xóa dữ liệu từ bảng product_image dựa trên ID của product
            String deleteProductImageSQL = "DELETE FROM product_image WHERE ProductId = ?";
            PreparedStatement productImageStatement = connection.prepareStatement(deleteProductImageSQL);
            productImageStatement.setInt(1, productIdToDelete);
            productImageStatement.executeUpdate();

            // Xóa dữ liệu từ bảng product_detail dựa trên ID của product
            String deleteProductDetailSQL = "DELETE FROM product_detail WHERE ProductId = ?";
            PreparedStatement productDetailStatement = connection.prepareStatement(deleteProductDetailSQL);
            productDetailStatement.setInt(1, productIdToDelete);
            productDetailStatement.executeUpdate();

            // Xóa dữ liệu từ bảng product dựa trên ID của product
            String deleteProductSQL = "DELETE FROM product WHERE Id = ?";
            PreparedStatement productStatement = connection.prepareStatement(deleteProductSQL);
            productStatement.setInt(1, productIdToDelete);
            productStatement.executeUpdate();

            // Commit giao dịch
            connection.commit();

            response.sendRedirect("product.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            if (connection != null) {
                try {
                    // Nếu xảy ra lỗi, rollback giao dịch
                    connection.rollback();
                    response.getWriter().println("Giao dịch đã rollback.");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
