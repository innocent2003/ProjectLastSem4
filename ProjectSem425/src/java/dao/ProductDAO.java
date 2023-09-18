package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Product;

public class ProductDAO {

    private static final String GET_PRODUCTS_QUERY = "SELECT p.id, p.productName, p.price, p.categoryId, p.brandId, pd.ram, pd.storage, pd.color, pd.description, pd.quantity, pi.url, "
            + "c.categoryname, b.brandname "
            + "FROM product p "
            + "JOIN product_detail pd ON p.id= pd.productid "
            + "JOIN product_image pi ON p.id = pi.productid "
            + "JOIN category c ON p.categoryid = c.id "
            + "JOIN brand b ON p.brandid = b.id ";
    private static final String Get_XIAOMIPRODUCTS_QUERY = "SELECT p.id, p.productName, p.price, p.categoryId, p.brandId, pd.ram, pd.storage, pd.color, pi.url "
            + "FROM product p "
            + "JOIN product_image pi ON p.id = pi.productId "
            + "JOIN product_detail pd ON p.id = pd.productId "
            + "WHERE BrandId=1";
    private static final String Get_SAMSUNGPRODUCTS_QUERY = "SELECT p.id, p.productName, p.price, p.categoryId, p.brandId, pd.ram, pd.storage, pd.color, pi.url "
            + "FROM product p "
            + "JOIN product_image pi ON p.id = pi.productId "
            + "JOIN product_detail pd ON p.id = pd.productId "
            + "WHERE BrandId=2";
    private static final String Get_APPLEPRODUCTS_QUERY = "SELECT p.id, p.productName, p.price, p.categoryId, p.brandId, pd.ram, pd.storage, pd.color, pi.url "
            + "FROM product p "
            + "JOIN product_image pi ON p.id = pi.productId "
            + "JOIN product_detail pd ON p.id = pd.productId "
            + "WHERE BrandId=3";
    private static final String GET_BRANDS_QUERY = "SELECT * FROM BRAND";

    public List<Brand> getBrands() throws ClassNotFoundException {
        List<Brand> brandList = new ArrayList<>();
        try {
            String url = "jdbc:mysql://localhost:3306/javaproject";
            String user = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                    PreparedStatement statement = conn.prepareStatement(GET_BRANDS_QUERY);
                    ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("Id");
                    String brandName = resultSet.getString("BrandName");

                    Brand brand = new Brand(id, brandName);
                    brandList.add(brand);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return brandList;
    }

    public List<Product> getProducts() throws ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        try {
            String url = "jdbc:mysql://localhost:3306/javaproject";
            String user = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                    PreparedStatement statement = conn.prepareStatement(GET_PRODUCTS_QUERY);
                    ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String productName = resultSet.getString("productName");
                    double price = resultSet.getDouble("price");
                    String image = resultSet.getString("url");
                    String ram = resultSet.getString("ram");
                    String storage = resultSet.getString("storage");
                    String color = resultSet.getString("color");
                    int brandId = resultSet.getInt("brandId");
                    String brandName = resultSet.getString("brandName");
                    int categoryId = resultSet.getInt("categoryId");
                    String categoryName = resultSet.getString("categoryName");
                    String description = resultSet.getString("description");
                    int qty = resultSet.getInt("quantity");
                    Product product = new Product(id, productName, price, image, ram, storage, color, brandId, brandName, categoryId, categoryName, description, qty);
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product> getXiaomiProducts() throws ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        try {
            String url = "jdbc:mysql://localhost:3306/javaproject";
            String user = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                    PreparedStatement statement = conn.prepareStatement(Get_XIAOMIPRODUCTS_QUERY);
                    ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("Id");
                    String productName = resultSet.getString("ProductName");
                    double price = resultSet.getDouble("Price");
                    String image = resultSet.getString("url");
                    String ram = resultSet.getString("ram");
                    String storage = resultSet.getString("storage");
                    String color = resultSet.getString("color");
                    Product product = new Product(id, productName, price, image, ram, storage, color);
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product> getSamsungProducts() throws ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        try {
            String url = "jdbc:mysql://localhost:3306/javaproject";
            String user = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                    PreparedStatement statement = conn.prepareStatement(Get_SAMSUNGPRODUCTS_QUERY);
                    ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("Id");
                    String productName = resultSet.getString("ProductName");
                    double price = resultSet.getDouble("Price");
                    String image = resultSet.getString("url");
                    String ram = resultSet.getString("ram");
                    String storage = resultSet.getString("storage");
                    String color = resultSet.getString("color");
                    Product product = new Product(id, productName, price, image, ram, storage, color);
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product> getAppleProducts() throws ClassNotFoundException {
        List<Product> productList = new ArrayList<>();
        try {
            String url = "jdbc:mysql://localhost:3306/javaproject";
            String user = "root";
            String password = "";
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(url, user, password);
                    PreparedStatement statement = conn.prepareStatement(Get_APPLEPRODUCTS_QUERY);
                    ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("Id");
                    String productName = resultSet.getString("ProductName");
                    double price = resultSet.getDouble("Price");
                    String image = resultSet.getString("url");
                    String ram = resultSet.getString("ram");
                    String storage = resultSet.getString("storage");
                    String color = resultSet.getString("color");
                    Product product = new Product(id, productName, price, image, ram, storage, color);
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public Product getProductById(String productId) throws ClassNotFoundException, SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Product productDetail = null;
        String url = "jdbc:mysql://localhost:3306/javaproject";
        String user = "root";
        String password = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        try {
            String query = "SELECT p.productName, p.price, p.categoryId, p.brandId, pd.ram, pd.storage, pd.color, pd.description, pd.quantity, pi.url, "
                    + "c.categoryname, b.brandname "
                    + "FROM product p "
                    + "JOIN product_detail pd ON p.id= pd.productid "
                    + "JOIN product_image pi ON p.id = pi.productid "
                    + "JOIN category c ON p.categoryid = c.id "
                    + "JOIN brand b ON p.brandid = b.id "
                    + "WHERE p.id = ?";
            statement = conn.prepareStatement(query);
            statement.setString(1, productId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int id = Integer.parseInt(productId);
                String productName = resultSet.getString("productName");
                double price = resultSet.getDouble("price");
                String image = resultSet.getString("url");
                String ram = resultSet.getString("ram");
                String storage = resultSet.getString("storage");
                String color = resultSet.getString("color");
                int brandId = resultSet.getInt("brandId");
                String brandName = resultSet.getString("brandName");
                int categoryId = resultSet.getInt("categoryId");
                String categoryName = resultSet.getString("categoryName");
                String description = resultSet.getString("description");
                int qty = resultSet.getInt("quantity");
                productDetail = new Product(id, productName, price, image, ram, storage, color, brandId, brandName, categoryId, categoryName, description, qty);
            }
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }
        }
        return productDetail;
    }

    public List<Product> getProductsByBrandId(int brandId) throws ClassNotFoundException, SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Product> productList = null;
        String url = "jdbc:mysql://localhost:3306/javaproject";
        String user = "root";
        String password = "";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, password);
        try {
            String query = "SELECT p.id, p.productName, p.price, pi.url "
                    + "FROM product p "
                    + "JOIN product_image pi ON p.id = pi.productid "
                    + "WHERE brandId = ?";

            statement = conn.prepareStatement(query);
            statement.setInt(1, brandId);
            resultSet = statement.executeQuery();
            productList = new ArrayList<>();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String productName = resultSet.getString("productName");
                double price = resultSet.getDouble("price");
                String imageUrl = resultSet.getString("url");
                Product product = new Product(id, productName, price, imageUrl);
                productList.add(product);
            }
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }
        }
        return productList;
    }
}
