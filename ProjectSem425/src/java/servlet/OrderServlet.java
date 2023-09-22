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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CartItem;

/**
 *
 * @author Expguy
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/processOrder"})
public class OrderServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            addOrderFromForm(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void addOrderFromForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        String strUserId = request.getParameter("userId");
        int userId = 0;
        if (strUserId != null && !strUserId.isEmpty()) {
            userId = Integer.parseInt(strUserId);
        }
        if (userId == 0) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        String cartJson = request.getParameter("myHiddenField");
        if (cartJson != null) {
            try {
                Gson gson = new Gson();
                Type cartListType = new TypeToken<List<CartItem>>() {
                }.getType();
                List<CartItem> cartList = gson.fromJson(cartJson, cartListType);
                request.setAttribute("cartList", cartList);
                request.setAttribute("userId", userId);

                String url = "jdbc:mysql://localhost:3306/javaproject";
                String user = "root";
                String password = "";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, password);
                String insertOrderQuery = "INSERT INTO orders(customerId, order_date, total, status) VALUES (?, ?, ?, '0')";
                PreparedStatement insertOrderStmt = conn.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
                double total = 0.0;
                for (CartItem cartItem : cartList) {
                    total += cartItem.getPrice() * cartItem.getQuantity();
                }
                if (total != 0) {
                    insertOrderStmt.setInt(1, userId);
                    insertOrderStmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
                    insertOrderStmt.setDouble(3, total);
                    insertOrderStmt.executeUpdate();
                    ResultSet generatedKeys = insertOrderStmt.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int orderId = generatedKeys.getInt(1);
                        String insertOrderDetailQuery = "INSERT INTO order_detail (OrderId, ProductId, Quantity, Price, Subtotal) VALUES (?, ?, ?, ?, ?)";
                        PreparedStatement insertOrderDetailStmt = conn.prepareStatement(insertOrderDetailQuery);
                        for (CartItem cartItem : cartList) {
                            int id = cartItem.getId();
                            int quantity = cartItem.getQuantity();
                            double price = cartItem.getPrice();
                            double subtotal = cartItem.getPrice() * cartItem.getQuantity();
                            insertOrderDetailStmt.setInt(1, orderId);
                            insertOrderDetailStmt.setInt(2, id);
                            insertOrderDetailStmt.setInt(3, quantity);
                            insertOrderDetailStmt.setDouble(4, price);
                            insertOrderDetailStmt.setDouble(5, subtotal);
                            insertOrderDetailStmt.executeUpdate();
                        }
                    }
                    conn.close();
                    String redirectUrl = request.getContextPath() + "/success-order.jsp";
                    response.sendRedirect(redirectUrl);
                    return;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "/store.jsp");
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
