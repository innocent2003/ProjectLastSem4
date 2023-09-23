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
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lemin
 */
@WebServlet("/addComment")
public class AddCommentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCommentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCommentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userIdString = request.getParameter("userId");
        String productIdString = request.getParameter("productId");
        String ratingString = request.getParameter("rating");
        String review = request.getParameter("review");

        if (userIdString != null && productIdString != null && ratingString != null && review != null && !ratingString.isEmpty() && !review.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdString);
                int productId = Integer.parseInt(productIdString);
                int rating = Integer.parseInt(ratingString);

                String url = "jdbc:mysql://localhost:3306/javaproject";
                String user = "root";
                String password = "";

                Class.forName("com.mysql.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(url, user, password)) {
                    String sql = "INSERT INTO comments (CustomerId, ProductId, Vote, Content, created_at) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                        stmt.setInt(1, userId);
                        stmt.setInt(2, productId);
                        stmt.setInt(3, rating);
                        stmt.setString(4, review);
                        stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
                        stmt.executeUpdate();
                    }
                }

                response.getWriter().write("success");
            } catch (NumberFormatException e) {
                response.getWriter().write("Invalid number format");
            } catch (SQLException e) {
                response.getWriter().write("Failed to connect to the database");
                response.getWriter().write("SQL error: " + e.getMessage());
            } catch (ClassNotFoundException ex) {
            }
        } else {
            response.getWriter().write("Comments and votes cannot be left blank");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
