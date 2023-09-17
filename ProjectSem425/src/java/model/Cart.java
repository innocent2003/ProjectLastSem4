/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Expguy
 */
public class Cart {
    private List<Product> items;
    
    public Cart() {
        items = new ArrayList<>();
    }

    public void addToCart(Product product) {
        items.add(product);
    }

    // Các phương thức getter và setter

    public List<Product> getItems() {
        return items;
    }
}
