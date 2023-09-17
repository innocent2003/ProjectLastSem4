package model;

public class Product {
    private int id;
    private String productName;
    private double price;
    private String imageURL;

    public Product() {
    }

    public Product(int id, String productName, double price, String imageURL) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.imageURL = imageURL;
    }
    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }
}
