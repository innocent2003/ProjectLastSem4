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
public class Brand {
    private int id;
    private String BrandName;

    public Brand() {
    }

    public Brand(int id, String BrandName) {
        this.id = id;
        this.BrandName = BrandName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

}
