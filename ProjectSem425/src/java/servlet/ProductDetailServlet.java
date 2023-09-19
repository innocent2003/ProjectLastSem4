/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Expguy
 */
@WebServlet("/product-content")
public class ProductDetailServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Trích xuất tham số ID từ URL
//        String productId = request.getParameter("id");
//
//        // Lấy thông tin chi tiết sản phẩm từ cơ sở dữ liệu hoặc nơi lưu trữ khác
//
//        // Gán thông tin sản phẩm vào request attribute để truyền dữ liệu cho view
//        request.setAttribute("productId", productId);
//
//        // Forward yêu cầu đến view productDetail.jsp
//        RequestDispatcher dispatcher = request.getRequestDispatcher("product-content.jsp");
//        dispatcher.forward(request, response);
//    }
}

