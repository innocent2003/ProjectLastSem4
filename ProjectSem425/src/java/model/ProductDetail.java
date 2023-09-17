/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Expguy
 */
public class ProductDetail {
    private String productName;
    private double price;
    private String ram;
    private String storage;
    private String color;
    private String imageUrl;
    private String categoryName;
    private int categoryId;
    private String brandName;
    private int brandId;
    private String description;

    public ProductDetail() {
    }

    public ProductDetail(String productName, double price, String ram, String storage, String color, String imageUrl, String categoryName, int categoryId, String brandName, int brandId, String description) {
        this.productName = productName;
        this.price = price;
        this.ram = ram;
        this.storage = storage;
        this.color = color;
        this.imageUrl = imageUrl;
        this.categoryName = categoryName;
        this.categoryId = categoryId;
        this.brandName = brandName;
        this.brandId = brandId;
        this.description = description;
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

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getStorage() {
        return storage;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
}
