/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author lemin
 */
@MultipartConfig
@WebServlet(name = "AddProductServlet2", urlPatterns = {"/admin/AddProductServlet2"})
public class AddProductServlet2 extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your servlet logic here
        // For example, you can set attributes and forward to the JSP
        request.setAttribute("message", "Hello from Servlet!");
        request.getRequestDispatcher("/jsp/subfolder/your.jsp").forward(request, response);
    }
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String productName = request.getParameter("productName");
        String ram = request.getParameter("ram");
        String storage = request.getParameter("storage");
        String color = request.getParameter("color");
        double price = Double.parseDouble(request.getParameter("price"));
        int CategoryId = Integer.parseInt(request.getParameter("CategoryId"));
        int BrandId = Integer.parseInt(request.getParameter("BrandId"));

        // Handle file upload
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Save the image to a directory
        String imagePath = "E:\\linhtinh\\ProjectLastSem4\\githubsem4\\aa3\\ProjectLastSem4\\ProjectSem425\\src\\java\\images\\" + fileName;
        try (InputStream fileContent = filePart.getInputStream();
             OutputStream imageOutputStream = new FileOutputStream(imagePath)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                imageOutputStream.write(buffer, 0, bytesRead);
            }
        }

        // Insert data into the database
        try (Connection conn = DatabaseUtil.getConnection()) {
            if (conn != null) {
                // Insert into product table
                String productSql = "INSERT INTO product (ProductName, CategoryId, BrandId, Price) VALUES (?, ?, ?, ?)";
                PreparedStatement productStatement = conn.prepareStatement(productSql, PreparedStatement.RETURN_GENERATED_KEYS);
                productStatement.setString(1, productName);
                productStatement.setInt(2, CategoryId); // ID of the product category
                productStatement.setInt(3, BrandId); // ID of the product brand
                productStatement.setDouble(4, price);
                productStatement.executeUpdate();

                // Get the generated product ID
                int productId;
                try (ResultSet generatedKeys = productStatement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        productId = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("Failed to retrieve generated product ID.");
                    }
                }

                // Insert into product_detail table
                String detailSql = "INSERT INTO product_detail (ProductId, Ram, Storage, Color) VALUES (?, ?, ?, ?)";
                PreparedStatement detailStatement = conn.prepareStatement(detailSql);
                detailStatement.setInt(1, productId);
                detailStatement.setString(2, ram);
                detailStatement.setString(3, storage);
                detailStatement.setString(4, color);
                detailStatement.executeUpdate();

                // Insert into product_image table
                String imageSql = "INSERT INTO product_image (ProductId, URL) VALUES (?, ?)";
                PreparedStatement imageStatement = conn.prepareStatement(imageSql);
                imageStatement.setInt(1, productId);
                imageStatement.setString(2, imagePath);
                imageStatement.executeUpdate();
                
                // Redirect or display a success message
                response.sendRedirect("success.jsp");
            } else {
                // Handle the case where the database connection is null
                response.getWriter().println("Database connection is null. Check your database configuration.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors
        }
    }
   
}
